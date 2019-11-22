import 'dart:async';
import 'package:appreport/Temas/Temas.dart';
import 'package:flutter/gestures.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:flutter/material.dart';
import 'dart:convert';

class Dilema extends StatefulWidget {
  const Dilema({Key key}) : super(key: key);
  @override
  DilemaState createState() => DilemaState();
}

class DilemaState extends State<Dilema> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  InfoTema contador;
  int con;
  final String id = "dilema";
  final int index = 2;
  bool estabaOff = false;

  @override
  Widget build(BuildContext context) {
    load();
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
                      child: Text('El Dilema del Desarrollo para Móviles',
                          style: TextStyle(fontSize: tamanhoTexto * 1.5))),
                ),
              ),
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
                            text: 'El desarrollo del proyecto flutter se centró en responder los problemas y dilemas de la industria en cuanto al desarrollo de aplicaciones móviles.' +
                                '\n\nAl momento de construir una aplicación móvil una compañía deberá elegir entre desarrollarla de manera nativa o de manera cross-plaftorm.' +
                                '\n\nUna Aplicación nativa se desarrolla en el lenguaje nativo para el S.O del dispositivo al cual está orientada la aplicación por lo que permite ' +
                                'tener mayor rendimiento, acceder a todas las funcionalidades del dispositivo, pero genera mayores costos de desarrollo porque se debe crear una aplicación' +
                                ' por cada S.O popular.\n\nEstos problemas en el desarrollo no son triviales de ninguna forma porque sumado a los costos monetarios también se incurre en' +
                                ' retrasos, en una época en la que la entrega ágil de software es una prioridad para las compañías, por ejemplo, empresas como Google y Microsoft hacen uso' +
                                ' de versiones canary que son versiones de sus populares navegadores Chrome y Edge que se actualizan con funcionalidades casi a diario. Esto les permite' +
                                ' descubrir bugs, probar funcionalidades antes de mandar actualizaciones a sus aplicaciones y más populares. ',
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
          children.add(
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
                child: Container(
                    width: width,
                    child: RichText(
                      softWrap: true,
                      textAlign: TextAlign.center,
                      text: new TextSpan(
                        children: [
                          new TextSpan(
                            text:
                                '\nMcKinsey estima que 17 días es lo que puede tardarse mediante técnicas de devOps en lanzarse la primera versión de una aplicación móvil.\n',
                            style: TextStyle(
                                fontSize: tamanhoTexto * 0.6,
                                fontStyle: FontStyle.italic,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )),
              ),
            ]),
          );
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
                                text: 'https://www.google.com/chrome/canary/',
                                style: new TextStyle(
                                    fontSize: tamanhoTexto * 0.5,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    try {
                                      html.window.open(
                                          "https://www.google.com/chrome/canary/",
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
                                    'https://www.mckinsey.com/business-functions/mckinsey-digital/our-insights/beyond-agile-reorganizing-it-for-faster-software-delivery',
                                style: new TextStyle(
                                    fontSize: tamanhoTexto * 0.5,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    try {
                                      html.window.open(
                                          "https://www.mckinsey.com/business-functions/mckinsey-digital/our-insights/beyond-agile-reorganizing-it-for-faster-software-delivery",
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
                                text: 'https://www.atlassian.com/devops',
                                style: new TextStyle(
                                    fontSize: tamanhoTexto * 0.5,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    try {
                                      html.window.open(
                                          "https://www.atlassian.com/devops",
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
