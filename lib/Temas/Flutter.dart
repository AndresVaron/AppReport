import 'dart:async';
import 'package:appreport/Temas/Temas.dart';
import 'package:flutter/gestures.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:flutter/material.dart';
import 'dart:convert';

class Flutter extends StatefulWidget {
  const Flutter({Key key}) : super(key: key);
  @override
  FlutterState createState() => FlutterState();
}

class FlutterState extends State<Flutter> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  InfoTema contador;
  int con;
  final String id = "flutter";
  final int index = 1;
  bool estabaOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            title: Center(child: Text("Ups: " + con.toString())),
            actions: <Widget>[
              // action button
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  refresh();
                },
              )
            ]),
        body: LayoutBuilder(builder: (context, constraints) {
          var largeScreen = constraints.maxWidth > 600 ? true : false;
//CambiarEsto para tamano min en celular
          double tamanhoTexto = 20;
          double sidePadding = constraints.maxWidth / 10;
          double width = constraints.maxWidth / 10 * 8;
          if (largeScreen) {
            sidePadding = constraints.maxWidth / 5;
            width = constraints.maxWidth / 10 * 6;
            tamanhoTexto = (constraints.maxHeight /
                20); //Cambiar esto para que quepan todos los titulos en web.
          }
          var children = <Widget>[
            SizedBox(
              height: tamanhoTexto * 2,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
                child: Container(
                  width: width,
                  child: Center(
                      child: Text('¿Será que Flutter Reemplazará Android?',
                          style: TextStyle(fontSize: tamanhoTexto * 1.25))),
                ),
              )
            ]),
            SizedBox(
              height: tamanhoTexto * 1.5,
            ),
          ];

          children.add(
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
                child: Container(
                    width: width,
                    child: RichText(
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      text: new TextSpan(
                        children: [
                          new TextSpan(
                            text: 'La anterior pregunta plantea un dilema enorme para desarrolladores, compañías de software, empresas que requieren el desarrollo ' +
                                ' de aplicaciones móviles, startups y en general para cualquiera que quiera construir una aplicación móvil.\n\nDe la respuesta a esta pregunta ' +
                                'dependen inversiones de billones de dólares, el foco de miles de horas de trabajo, cambios en pensum universitarios. ' +
                                '\n\nEn este informe se hará un análisis comparativo entre el desempeño de una aplicación móvil desarrollada para Android, contra otro despliegue de la ' +
                                'misma pero despliégala como PWA.',
                            style: TextStyle(
                                fontSize: tamanhoTexto * 0.75,
                                color: Colors.black),
                          ),
                          new TextSpan(
                            text:
                                '\n\nEsperamos que de la lectura de este informe se pueda responder esta pregunta, o por lo menos permitir al lector estar en una posición en la cual pueda dar seguimiento a esta pregunta y anticipar el resultado. ',
                            style: TextStyle(
                                fontSize: tamanhoTexto * 0.75,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          new TextSpan(
                            text: '\n\nEste análisis se vuelve importante y relevante porque flutter es el lenguaje móvil con mayor crecimiento y para el cual se proyecta mayor crecimiento, que además está apoyado' +
                                ' por un jugador clave del mercado móvil, como lo es google y que es el lenguaje por defecto de un nuevo sistema operativo apoyado por el mismo i.e Fuchsia. \n\nEn la siguiente' +
                                ' gráfica/link se ve un análisis de la popularidad de flutter vs react-native ',
                            style: TextStyle(
                                fontSize: tamanhoTexto * 0.75,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )),
              ),
            ]),
          );
          children.add(SizedBox(
            height: tamanhoTexto,
          ));
          children.add(
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
                child: Container(
                    width: width,
                    child: Image(
                        image: AssetImage('images/flutter-react-ionic.jpeg'))),
              ),
            ]),
          );
          children.add(SizedBox(
            height: tamanhoTexto,
          ));
          children.add(
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
                child: Center(
                    child: Container(
                        width: width,
                        child: RichText(
                          text: new TextSpan(
                            children: [
                              new TextSpan(
                                text:
                                    'https://trends.google.com/trends/explore?date=today%205-y&q=flutter,react%20native,%2Fg%2F1q6l_n0n0',
                                style: new TextStyle(
                                    fontSize: tamanhoTexto * 0.55,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    try {
                                      html.window.open(
                                          "https://trends.google.com/trends/explore?date=today%205-y&q=flutter,react%20native,%2Fg%2F1q6l_n0n0",
                                          "_blank");
                                    } catch (error) {}
                                  },
                              ),
                            ],
                          ),
                        ))),
              ),
            ]),
          );
          children.add(SizedBox(
            height: tamanhoTexto / 2,
          ));
          return (ListView(children: children));
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            add();
          },
          tooltip: 'Increment',
          child: Icon(Icons.arrow_upward),
        ));
  }

  @override
  void initState() {
    super.initState();
    //Se carga el cache
    contador = InfoTema(index: index, contador: 0, contadorTemp: 0);
    try {
      String storedCounter = html.window.localStorage[id];
      if (storedCounter != null) {
        contador.contador = int.parse(storedCounter);
      }
    } catch (error) {
      print("Error cargando cache: $error");
    }
    //Contador Sin Enviar
    try {
      String storedCounter = html.window.localStorage[id + "-UPS"];
      if (storedCounter != null) {
        contador.contadorTemp = int.parse(storedCounter);
      }
    } catch (error) {
      print("Error cargando cache: $error");
    }
    try {
      setState(() {
        con = contador.contador + contador.contadorTemp;
      });
    } catch (error) {}
    load();
  }

  add() async {
    contador.contadorTemp++;
    if (hasConnection()) {
      await updateTemp();
      doUp(id);
    } else {
      //Guardar en cache.
      estabaOff = true;
      guardarContTemp();
    }
    try {
      setState(() {
        con = contador.contador + contador.contadorTemp;
      });
    } catch (error) {}
  }

  refresh() async {
    if (hasConnection()) {
      await updateTemp();
      var resp = await update(contador.index.toString());
      if (resp.body.toString().contains("ups")) {
        var temp = json.decode(resp.body.toString());
        contador.contador = temp["ups"];
        guardarCont();
        try {
          setState(() {
            con = contador.contador + contador.contadorTemp;
          });
        } catch (error) {}
      }
    } else {
      estabaOff = true;
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("No hay conexión a Internet"),
        action: SnackBarAction(
          label: 'Reintentar',
          onPressed: () {
            refresh();
          },
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
      ));
    }
  }

  load() async {
    if (hasConnection()) {
      await updateTemp();
      var resp = await update(contador.index.toString());
      if (resp.body.toString().contains("ups")) {
        var temp = json.decode(resp.body.toString());
        contador.contador = temp["ups"];
        guardarCont();
        try {
          setState(() {
            con = contador.contador + contador.contadorTemp;
          });
        } catch (error) {}
      }
    } else {}
  }

  updateTemp() async {
    if (estabaOff) {
      if (contador.contadorTemp > 0) {
        var resp = await upVote(contador);
        if (resp != null && resp.body.toString().contains("ups")) {
          var temp = json.decode(resp.body.toString());
          contador.contadorTemp = 0;
          contador.contador = temp["ups"];
          guardarCont();
          guardarContTemp();
          try {
            setState(() {
              con = contador.contador + contador.contadorTemp;
            });
          } catch (error) {}
        }
      }
      estabaOff = false;
    }
  }

  doUp(id) async {
    try {
      if (contador.timer != null) {
        contador.timer.cancel();
      }
      contador.timer = new Timer(new Duration(seconds: 3), () async {
        var resp = await upVote(contador);
        if (resp != null && resp.body.toString().contains("ups")) {
          var temp = json.decode(resp.body.toString());
          contador.contadorTemp = 0;
          contador.contador = temp["ups"];
          guardarCont();
          guardarContTemp();
          try {
            setState(() {
              con = contador.contador + contador.contadorTemp;
            });
          } catch (error) {}
        }
      });
    } catch (e) {
      print(e);
    }
  }

  guardarCont() async {
    try {
      html.window.localStorage[id] = contador.contador.toString();
    } catch (error) {
      print("Error guardando en cache: $error");
    }
  }

  guardarContTemp() async {
    try {
      html.window.localStorage[id + "-UPS"] = contador.contadorTemp.toString();
    } catch (error) {
      print("Error guardando en cache: $error");
    }
  }
}
