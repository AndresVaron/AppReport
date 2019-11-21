import 'dart:async';
import '../main.dart';
import './connectivity.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:flutter/material.dart';
import 'dart:io'; //InternetAddress utility
import 'package:connectivity/connectivity.dart';
import 'dart:convert';

class InfoTema {
  int contador;
  final int index;
  int contadorTemp;
  Timer timer;
  InfoTema({@required this.index, this.contador, this.contadorTemp});
}

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final GlobalKey<NavigatorState> navigatorKey;

  StreamController connectionChangeController =
      new StreamController.broadcast();

  final Connectivity _connectivity = Connectivity();

  final List<Tema> temas;
  bool estabaOff = true;

  Map<String, InfoTema> contadores;
  bool connection = false;
  String tipo = "PHONE";

  ConnectivityBloc({this.temas, this.navigatorKey});

  @override
  ConnectivityState get initialState => ConnectivityInitialState();

  Stream get connectionChange => connectionChangeController.stream;

  void initialize() async {
    try {
      await InternetAddress.lookup(
          'google.com'); //Esto funciona porque el lookup no está soportado en flutter web.
    } catch (e) {
      if (e.toString().contains("Unsupported")) {
        tipo = "HTML";
      }
    }
    if (tipo == "PHONE") {
      _connectivity.onConnectivityChanged.listen(_connectionChange);
      await checkConnection();
    }
    await loadLocalStorage();
  }

  bool hasConnection() {
    if (tipo == "PHONE") {
      return connection;
    } else {
      return html.window.navigator.onLine;
    }
  }

  loadLocalStorage() async {
    contadores = {};
    if (temas != null) {
      var i = 1;
      temas.forEach((tema) {
        contadores[tema.id] = InfoTema(index: i, contador: 0, contadorTemp: 0);
        //Verificar en que plataforma esta;
        //Celular
        if (tipo == "PHONE") {
        }
        //Web:
        else {
          try {
            String storedCounter = html.window.localStorage[tema.id];
            if (storedCounter != null) {
              contadores[tema.id].contador = int.parse(storedCounter);
            }
          } catch (error) {
            print("Error cargando cache: $error");
          }
          //Contador Sin Enviar

          try {
            String storedCounter = html.window.localStorage[tema.id + "-UPS"];
            if (storedCounter != null) {
              contadores[tema.id].contadorTemp = int.parse(storedCounter);
            }
          } catch (error) {
            print("Error cargando cache: $error");
          }
        }
        i++;
      });
    }
    if (hasConnection()) {
      await updateTemp();
    }
  }

  @override
  Stream<ConnectivityState> mapEventToState(
    ConnectivityEvent event,
  ) async* {
    if (event is LoadScreenEvent) {
      var conTemp = contadores[event.id];
      if (hasConnection()) {
        await updateTemp();
        var resp = await update(conTemp.index.toString());
        if (resp.body.toString().contains("ups")) {
          var temp = json.decode(resp.body.toString());
          conTemp.contador = temp["ups"];
          guardarCont(event.id, conTemp);
        }
      } else {
        estabaOff = true;
      }
      yield ContadorState(contador: conTemp.contador + conTemp.contadorTemp);
      navigatorKey.currentState.pushNamed("/" + event.id);
    } else if (event is AddEvent) {
      var conTemp = contadores[event.id];
      conTemp.contadorTemp++;
      if (hasConnection()) {
        await updateTemp();
        doUp(event.id);
      } else {
        //Guardar en cache.
        estabaOff = true;
        guardarContTemp(event.id, conTemp);
      }
      yield ContadorState(contador: conTemp.contador + conTemp.contadorTemp);
    } else if (event is RefreshEvent) {
      var conTemp = contadores[event.id];
      if (hasConnection()) {
        await updateTemp();
        var resp = await update(conTemp.index.toString());
        if (resp.body.toString().contains("ups")) {
          var temp = json.decode(resp.body.toString());
          conTemp.contador = temp["ups"];
          guardarCont(event.id, conTemp);
        }
        yield ContadorState(contador: conTemp.contador + conTemp.contadorTemp);
      } else {
        estabaOff = true;
        yield ContadorErrorState(
            contador: conTemp.contador + conTemp.contadorTemp);
      }
    }
  }

  updateTemp() async {
    if (estabaOff) {
      contadores.forEach(((String id, InfoTema conTemp) async {
        if (conTemp.contadorTemp > 0) {
          var resp = await upVote(conTemp);
          if (resp != null && resp.body.toString().contains("ups")) {
            var temp = json.decode(resp.body.toString());
            conTemp.contadorTemp = 0;
            conTemp.contador = temp["ups"];
            guardarCont(id, conTemp);
            guardarContTemp(id, conTemp);
          }
        }
      }));
      estabaOff = false;
    }
  }

  doUp(id) async {
    try {
      var conTemp = contadores[id];
      if (conTemp != null && conTemp.timer != null) {
        conTemp.timer.cancel();
      }
      conTemp.timer = new Timer(new Duration(seconds: 3), () async {
        var resp = await upVote(conTemp);
        if (resp != null && resp.body.toString().contains("ups")) {
          var temp = json.decode(resp.body.toString());
          conTemp.contadorTemp = 0;
          conTemp.contador = temp["ups"];
          guardarCont(id, conTemp);
          guardarContTemp(id, conTemp);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  guardarCont(String id, InfoTema conTemp) async {
    if (tipo == "PHONE") {
    } else {
      try {
        html.window.localStorage[id] = conTemp.contador.toString();
      } catch (error) {
        print("Error guardando en cache: $error");
      }
    }
  }

  guardarContTemp(String id, InfoTema conTemp) async {
    if (tipo == "PHONE") {
    } else {
      try {
        html.window.localStorage[id + "-UPS"] = conTemp.contadorTemp.toString();
      } catch (error) {
        print("Error guardando en cache: $error");
      }
    }
  }

  void dispose() {
    connectionChangeController.close();
  }

  void _connectionChange(ConnectivityResult result) {
    checkConnection();
  }

  Future<bool> checkConnection() async {
    bool previousConnection = connection;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connection = true;
      } else {
        connection = false;
      }
    } catch (e) {
      connection = false;
    }
    if (previousConnection != connection) {
      connectionChangeController.add(connection);
    }
    return connection;
  }
}

Future<http.Response> upVote(InfoTema contador) {
  return http.get(
      'https://script.google.com/macros/s/AKfycbxdkQD1GDUJdnqqfcz6AQ-VqfeGqr11xppX3ucAkaA-4qKwmSU/exec?index=' +
          contador.index.toString() +
          "&ups=" +
          contador.contadorTemp.toString());
}

Future<http.Response> update(String index) {
  return http.get(
      'https://script.google.com/macros/s/AKfycbxdkQD1GDUJdnqqfcz6AQ-VqfeGqr11xppX3ucAkaA-4qKwmSU/exec?tema=' +
          index);
}
