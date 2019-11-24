import 'dart:async';
import 'package:appreport/Temas/Temas.dart';
import 'package:flutter/gestures.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:flutter/material.dart';
import 'dart:convert';

class RoadBLOCks extends StatefulWidget {
  const RoadBLOCks({Key key}) : super(key: key);
  @override
  RoadBLOCksState createState() => RoadBLOCksState();
}

class RoadBLOCksState extends State<RoadBLOCks> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  InfoTema contador;
  int con;
  final String id = "roadblocks";
  final int index = 13;
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
                      child: Text('RoadBLOCs',
                          style: TextStyle(fontSize: tamanhoTexto * 1.5))),
                ),
              )
            ]),
            SizedBox(
              height: tamanhoTexto,
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
                            text: 'Por el transcurso del la fase de desarrollo de esta aplicación, se encontraron múltiples impedimentos.' +
                                ' Entre estos estaban los que esperábamos, como la falta de soporte a los plugins oficiales',
                            style: TextStyle(
                                fontSize: tamanhoTexto * 0.75,
                                color: Colors.black),
                          ),
                          new TextSpan(
                            text: ' que proveen el equipo de flutter o la inexistencia del serviceworker para configurar un PWA(Progressive Web App).\n\n' +
                                'A pesar de esto, encontramos algunos errores bastante inesperados, como el de la imagen a seguir.',
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
                    child: Image(image: AssetImage('images/orientation.jpeg'))),
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
                    child: RichText(
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      text: new TextSpan(
                        children: [
                          new TextSpan(
                            text: 'Este snippet se utiliza para indicar que la app tiene la orientación restringida y funciona tanto en Android como en iOS, ' +
                                'por lo que fue inesperado que al incluirlo en nuestro código la pagina web no compilara. Esto es importante notarlo ya que en algunas ocasiones, dependiendo' +
                                ' si la librería utilizada era de dart o flutter podrían salir errores diferentes tal como el que se ve soluciona por el codigo visto en la imagen siguiente, que indica la utilización de la función lookup() ' +
                                '(de dart:io) la cual hace un nslookup, algo que no se puede hacer desde un browser.',
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
                    child: Image(image: AssetImage('images/lookup.png'))),
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
                    child: RichText(
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      text: new TextSpan(
                        children: [
                          new TextSpan(
                            text: 'Además de estos problemas, los cuales se pueden consideran inofensivos ya que con tiempo se pueden implementar soluciones, se encontraron unos mucho más complicados de entender y arreglar. ' +
                                ' Estos son errores que solo logramos se descubrieron en el momento de hacerle el build de despliegue a la aplicación, ya que utilizando las herramientas de desarrollo de flutter web no se lograron encontrar. ' +
                                ' Primero, esta el problema de los imports que se puede observar en la imagen siguiente.',
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
                    child: Image(image: AssetImage('images/imports.jpeg'))),
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
                    child: RichText(
                      text: new TextSpan(
                        children: [
                          new TextSpan(
                            text: 'Este roadBlock ocurre al mandarle un parámetro al constructor de un widget una clase diferente, indica que se espera una lista de tipo Tema pero recibe una lista de tipo Tema' +
                                '. Como se puede observar, la corrección no es para nada trivial ya que el problema está en que en un archivo la librería(archivo main.dart) en la cual está la clase Tema se importa como \"lib/main.dart\" mientras que en el otro esta se importa como \"package:appreport/main.dart\". ' +
                                ' Esto ocurre porque al parecer en el momento de generar el build de despliegue las referencias a las librerías tienen que ser idénticas a pesar de que en las herramientas de desarrollo y en las otras plataformas si pueden escribirse de maneras distintas mientras que apunten al mismo archivo. ' +
                                'Lo irónico de todo es que el propio mensaje de error indica, entre comillas, que las librerías apuntan al mismo lugar (\"lib/main.dart\").\n\n' +
                                'Finalmente, el mayor roadBLOCk de todos los que nos encontramos al desarrollar esta aplicación, los BLOCs. A pesar de que es un patrón increíble ya que le permite centralizar toda la lógica de la aplicación en unas pocas clases, la compilación de dart a javascript por parte del equipo de flutter de los' +
                                'stream builders aun no funciona bien. Como se denotó en la sección donde se analiza esta compilación, la entrada y salida de los streams si funciona perfectamente, y en las herramientas de desarrollo todo funciona como si se estuviera programando para cualquier plataforma. El lio, como con los imports, está en el momento de generar el build de despliegue ya que, ' +
                                'a pesar de que se logre compilar todo, al entrar a la pagina web la aplicación no logra encontrar los métodos de los objetos que representan los blocs en la aplicación y se terminan generando infinitos null pointers cuando un widget intenta hacer build().' +
                                '\n\nDebido a este problema con los blocs y la restricción de tiempo para la entrega de este proyecto decidimos quitar el BLOC para el despliegue de la pagina web. Con este cambio, al ingresar a la pagina cada widget maneja el estado de su contador y acceso a internet. Es importante notar que el único feature que no terminó siendo desplegado en la pagina es el de que una acción en ' +
                                ' cualquiera de las secciones actualiza el servidor con el cache de todos los otros temas. Esto si funciona en navegador con el servidor de desarrollo y en la aplicación nativa',
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
                    child: Image(image: AssetImage('images/flutterrun.gif'))),
              ),
            ]),
          );
          children.add(
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
                child: Container(
                    width: width,
                    child: Image(image: AssetImage('images/error.gif'))),
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
                                text: 'Aquí',
                                style: new TextStyle(
                                    fontSize: tamanhoTexto * 0.75,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    try {
                                      html.window.open(
                                          "https://github.com/flutter/flutter/issues/45423",
                                          "_blank");
                                    } catch (error) {}
                                  },
                              ),
                              new TextSpan(
                                text:
                                    ' encontrará el issue del error de los imports.',
                                style: TextStyle(
                                    fontSize: tamanhoTexto * 0.75,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ))),
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
                                text: 'https://github.com/flutter/plugins',
                                style: new TextStyle(
                                    fontSize: tamanhoTexto * 0.75,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    try {
                                      html.window.open(
                                          "https://github.com/flutter/plugins",
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
