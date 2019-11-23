import 'dart:async';
import 'package:appreport/Temas/Temas.dart';
import 'package:flutter/gestures.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:flutter/material.dart';
import 'dart:convert';

class Bloc extends StatefulWidget {
  const Bloc({Key key}) : super(key: key);
  @override
  BlocState createState() => BlocState();
}

class BlocState extends State<Bloc> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  InfoTema contador;
  int con;
  final String id = "patrones";
  final int index = 3;
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
                      child: Text(
                          'Bloc del Antes y Del Ahora en Cross-Platform',
                          style: TextStyle(fontSize: tamanhoTexto * 1.25))),
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
                      textAlign: TextAlign.center,
                      text: new TextSpan(
                        children: [
                          new TextSpan(
                            text: 'Flash',
                            style: TextStyle(
                                fontSize: tamanhoTexto * 0.75,
                                fontWeight: FontWeight.bold,
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
                      textAlign: TextAlign.justify,
                      text: new TextSpan(
                        children: [
                          new TextSpan(
                            text: 'Flash: fue la herramienta más popular para hacer cross-platform, y la historia de flash es una muestra de cómo hacer cross-platform ' +
                                'permite universalizar el acceso a un a tecnología.\n\nInclusive se puede llegar a pensar en los sistemas operativos como elementos que permiten ' +
                                'aumentar la integración. (No es sino solo con Windows que se puede construir software tanto para equipos de  HP como Lenovo).\n\nEn resumen, el éxito' +
                                ' de una Buena integración es que sea eficiente, en la mayoría de entornos en los que debe ser desplegado.  Hay momentos en los que a pesar de la perdida ' +
                                'de rendimiento la integración se vuelve un mal necesario.\n',
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
                            text: 'Why not Ionic?',
                            style: TextStyle(
                                fontSize: tamanhoTexto * 0.75,
                                fontWeight: FontWeight.bold,
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
                      textAlign: TextAlign.justify,
                      text: new TextSpan(
                        children: [
                          new TextSpan(
                            text: 'Ionic es un framework de desarrollo que fue lanzado al mercado desde 2013, sin embargo, su fuerte nunca ha sido el desempeño ' +
                                'sino que busca que la curva de aprendizaje sea bastante rápida ya que esta esta basada en typescript que generalmente es caracterizado ' +
                                ' como una forma mas simple de javascript. Sin embaro su arquitectura hace que se quede corto en el rendimiento que puede dar, requiere de frameworks de terceros para funcionar.\n',
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
                            text: 'And React-Native?',
                            style: TextStyle(
                                fontSize: tamanhoTexto * 0.75,
                                fontWeight: FontWeight.bold,
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
                      textAlign: TextAlign.justify,
                      text: new TextSpan(
                        children: [
                          new TextSpan(
                            text:
                                'React fue una gran invención para web, al hacer que se manejara un DOM virtual y que la actualización de este DOM controlara en un modelo vista controlador al DOM real, reduce el número de elementos que se deben rerenderizar cuando se actualiza algo de la interfaz visual. React-Native funciona bajo el mismo principio.\n',
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
            height: tamanhoTexto / 2,
          ));
          children.add(
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
                child: Container(
                    width: width,
                    child: Image(image: AssetImage('images/react.png'))),
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
                child: Container(
                    width: width,
                    child: RichText(
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      text: new TextSpan(
                        children: [
                          new TextSpan(
                            text: 'Sin embargo pese a esto los problemas de rendimiento de React Native aparecen cuando se sobre utiliza el bridge y es que cuando se hacen' +
                                ' animaciones o transiciones o se desliza el dedo sobre la pantalla se intenta acceder a los widgets del OEM(original equipment manufacturer) lo ' +
                                'que va a causar que en aparezcan cuellos de botella cuando se intenta pasar de un ámbito a otro.\n\nPor otro lado, si bien react-native tiene más adopción' +
                                ' por parte de compañías prestigiosas por ejemplo es usado por Facebook, Instagram, Pinterest, Skype, Tesla, Uber, Walmart, Salesforce, Vogue.  ' +
                                'Lo cierto es que estuvo cultivando esta ventaja desde 2015 cuando fue lanzado, y sin embargo no la ha logrado mantener porque Flutter que ha principio ' +
                                'de año su aplicación más notable era The Hamilton musical, ha logrado ganar tracción y ser usado por Alibaba, Greentea, Google Ads.\n\nEn conclusión la integración ' +
                                'se hace necesaria en algunos contextos, hay una gran presión de los desarrolladores por herramientas que les faciliten la vida y Google puede haber dado con el clavo. ',
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
                                    'https://codeburst.io/react-native-vs-ionic-vs-flutter-comparison-of-top-cross-platform-app-development-tools-71c8011309ac',
                                style: new TextStyle(
                                    fontSize: tamanhoTexto * 0.5,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    try {
                                      html.window.open(
                                          "https://codeburst.io/react-native-vs-ionic-vs-flutter-comparison-of-top-cross-platform-app-development-tools-71c8011309ac",
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
                                    'https://hackernoon.com/getting-started-with-cross-platform-app-development-in-2019-dd2bf7f6161b',
                                style: new TextStyle(
                                    fontSize: tamanhoTexto * 0.5,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    try {
                                      html.window.open(
                                          "https://hackernoon.com/getting-started-with-cross-platform-app-development-in-2019-dd2bf7f6161b",
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
                                    'https://thehistoryoftheweb.com/the-story-of-flash/',
                                style: new TextStyle(
                                    fontSize: tamanhoTexto * 0.5,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    try {
                                      html.window.open(
                                          "https://thehistoryoftheweb.com/the-story-of-flash/",
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
                                    'https://codeburst.io/react-native-vs-nativescript-vs-xamarin-vs-flutter-vs-ionic-vs-cordova-vs-pwas-196810954450',
                                style: new TextStyle(
                                    fontSize: tamanhoTexto * 0.5,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    try {
                                      html.window.open(
                                          "https://codeburst.io/react-native-vs-nativescript-vs-xamarin-vs-flutter-vs-ionic-vs-cordova-vs-pwas-196810954450",
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
