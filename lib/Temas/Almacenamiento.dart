import 'dart:async';
import 'package:appreport/Temas/Temas.dart';
import 'package:flutter/gestures.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:flutter/material.dart';
import 'dart:convert';

class Almacenamiento extends StatefulWidget {
  const Almacenamiento({Key key}) : super(key: key);
  @override
  AlmacenamientoState createState() => AlmacenamientoState();
}

class AlmacenamientoState extends State<Almacenamiento> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  InfoTema contador;
  int con;
  final String id = "almacenamiento";
  final int index = 1; //TODO
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
                20); //Cambiar esto para que quepan todos los títulos en web.
          }
          var children = <Widget>[
            SizedBox(
              height: tamanhoTexto * 2,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: constraints.maxWidth / 10,
                    right: constraints.maxWidth / 10),
                child: Container(
                  width: constraints.maxWidth / 10 * 8,
                  child: Center(
                      child: Text('Almacenamiento',
                          style: TextStyle(fontSize: tamanhoTexto * 1.5))),
                ),
              ),
              SizedBox(
                height: tamanhoTexto * 2,
              ),
            ]),
          ];
          //Aqui se agrega todo el contenido.
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
                                'Debido a que uno de los propósitos de esta app es que fuera una PWA, y que a pesar de que Flutter lo vende',
                            style: TextStyle(
                                fontSize: tamanhoTexto * 0.75,
                                color: Colors.black),
                          ),
                          new TextSpan(
                            text:
                                ' en su pagina principal(https://flutter.dev/web) como si fuera un feature ya implementado, como se puede observar en la ultima linea de https://flutter.dev/docs/deployment/web',
                            style: TextStyle(
                                fontSize: tamanhoTexto * 0.75,
                                color: Colors.black),
                          ),
                          new TextSpan(
                            text: ', los archivos de configuración de una PWA aun no se generan. Dicho esto, para desarrollar esta aplicación y ' +
                                'poder considerar el producto final una PWA, para la versión web se implemento un manejo del cache del browser. Este almacenamiento local de los "Ups" se puede observar en las siguientes imágenes.',
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
                    child: Image(image: AssetImage('images/storage.jpeg'))),
              ),
            ]),
          );
          children.add(
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
                child: Container(
                    width: width,
                    child: Image(image: AssetImage('images/storagesave.jpeg'))),
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
                            text: 'Además, en estas imágenes se puede observar que es utilizó la libreria de shared_preferences para el almacenamiento en las nativas. Lo ideal sería que en un futuro Flutter le ' +
                                'implemente a shared_preferences el manejo del cache del browser ya que las dos cosas consisten en guardar una tupla (llave,valor) en la memoria del dispositivo.' +
                                'Para esta ocasión se utilizo local_storage en el browser ya que esta es la manera que mas tiempo dura guardada en el browser.\n\n Es importante notar que para esto fue necesario utilizar la libreria de dart:html que nos permite manipular los componentes de una pagina web. ' +
                                'En un futuro, esto no se debería poder hacer, ya que esto implica que se ramifique el código de la aplicación en sus respectivos formatos(web,móvil,etc).', //Problemas de html y hablar de la bd
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
            height: tamanhoTexto * 2,
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
                            text: 'Por otro lado, para facilitar el acceso a la información, se creo una pequeña base de datos de contadores a la cual la aplicación accede para aumentar los contadores y preguntar el ' +
                                'estado de estos. Esta base de datos se puede encontrar en un spreadsheet de google drive.Cualquiera puede acceder a esta y verificar que si está conectada con la aplicación.' +
                                '\n\nConsecuentemente, al hablar de almacenamiento es importante tener en cuenta de que al instalarla en un dispositivo las imágenes del documento se van junto.' +
                                ' Mientras que en la pagina estas quedan guardadas en el servidor que y el almacenamiento de estas sobre el dispositivo depende plenamente del navegador.' +
                                '\n\nFinalmente, cabe notar que a pesar de que Chrome móvil tiene una opción de guardar la pagina para su uso offline la mayoría de las funcionalidades se pierden junto con los' +
                                ' iconos de flutter.',
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
                    child: Image(image: AssetImage('images/db.jpeg'))),
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
                                text: 'Aquí',
                                style: new TextStyle(
                                    fontSize: tamanhoTexto * 0.6,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    try {
                                      html.window.open(
                                          "https://docs.google.com/spreadsheets/d/1ic2uYfMXJ5twAmeiN3izgW6LLee-88YM_KIZJEOSScw/edit?usp=sharing",
                                          "_blank");
                                    } catch (error) {}
                                  },
                              ),
                              new TextSpan(
                                text:
                                    ' está nuestra base de datos montada en un spreadsheet.',
                                style: TextStyle(
                                    fontSize: tamanhoTexto * 0.6,
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
                                text: 'https://flutter.dev/web',
                                style: new TextStyle(
                                    fontSize: tamanhoTexto * 0.6,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    try {
                                      html.window.open(
                                          "https://flutter.dev/web", "_blank");
                                    } catch (error) {}
                                  },
                              ),
                            ],
                          ),
                        ))),
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
                                text: 'https://flutter.dev/docs/deployment/web',
                                style: new TextStyle(
                                    fontSize: tamanhoTexto * 0.6,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    try {
                                      html.window.open(
                                          "https://flutter.dev/docs/deployment/web",
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
            height: tamanhoTexto,
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
