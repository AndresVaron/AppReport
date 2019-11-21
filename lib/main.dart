import 'package:appreport/Temas/Temas.dart';
import 'package:flutter/material.dart';

void main() async {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  final List<Tema> temas = <Tema>[
    Tema(nombre: "Tema 1", id: "tema1", widget: new Tema1()),
    Tema(nombre: "RoadBLOCks", id: "roadblocks", widget: new RoadBLOCks()),
    Tema(nombre: "La App", id: "laapp", widget: new LaApp()),
    Tema(nombre: "Tema 4", id: "tema4", widget: new Tema1()),
    Tema(nombre: "Tema 5", id: "tema5", widget: new Tema1()),
    Tema(nombre: "Tema 6", id: "tema6", widget: new Tema1()),
    Tema(nombre: "Tema 7", id: "tema7", widget: new Tema1()),
    Tema(nombre: "Tema 8", id: "tema8", widget: new Tema1()),
    Tema(nombre: "Tema 9", id: "tema9", widget: new Tema1()),
    Tema(nombre: "Tema 10", id: "tema10", widget: new Tema1()),
  ];

  runApp(MyApp(temas, _navigatorKey));
}

class MyApp extends StatelessWidget {
  final List<Tema> temas;
  final GlobalKey<NavigatorState> navigatorKey;
  MyApp(this.temas, this.navigatorKey);

  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routes = {
      '/': (context) => MyHomePage(title: 'App Report', temas: temas),
    };
    temas.forEach((tema) {
      routes["/" + tema.id] = (context) => tema.widget;
    });
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'App Report',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.temas}) : super(key: key);
  final String title;
  final List<Tema> temas;

  @override
  _MyHomePageState createState() => _MyHomePageState(temas: temas);
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Tema> temas;
  _MyHomePageState({this.temas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          double tamanhoTexto = 20; //CambiarEsto para tamano min en celular
          if (constraints.maxWidth > 600) {
            tamanhoTexto = (constraints.maxHeight /
                20); //Cambiar esto para que quepan todos los titulos en web.
          }
          var children = <Widget>[
            SizedBox(
              height: tamanhoTexto * 4,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: constraints.maxWidth / 10,
                    right: constraints.maxWidth / 10),
                child: Container(
                  width: constraints.maxWidth / 10 * 8,
                  child: Center(
                      child: Text('Flutter Web',
                          style: TextStyle(fontSize: tamanhoTexto * 1.5))),
                ),
              )
            ]),
            SizedBox(
              height: tamanhoTexto * 1.5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: constraints.maxWidth / 10,
                    right: constraints.maxWidth / 10),
                child: Container(
                  width: constraints.maxWidth / 10 * 8,
                  child: Center(
                      child: Text('Universidad de los Andes',
                          style: TextStyle(fontSize: tamanhoTexto * 0.75))),
                ),
              )
            ]),
            SizedBox(
              height: tamanhoTexto * 0.25,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: constraints.maxWidth / 10,
                    right: constraints.maxWidth / 10),
                child: Container(
                  width: constraints.maxWidth / 10 * 8,
                  child: Center(
                      child: Text('Const. Aplicaciones Móviles',
                          style: TextStyle(fontSize: tamanhoTexto * 0.75))),
                ),
              )
            ]),
            SizedBox(
              height: tamanhoTexto * 0.5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: constraints.maxWidth / 10,
                    right: constraints.maxWidth / 10),
                child: Container(
                  width: constraints.maxWidth / 10 * 8,
                  child: Center(
                      child: Text('201920',
                          style: TextStyle(fontSize: tamanhoTexto * 0.75))),
                ),
              )
            ]),
            SizedBox(
              height: tamanhoTexto * 0.75,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: constraints.maxWidth / 10,
                    right: constraints.maxWidth / 10),
                child: Container(
                  width: constraints.maxWidth / 10 * 8,
                  child: Center(
                      child: Text('Andres Varon y Leonel Naranjo',
                          style: TextStyle(fontSize: tamanhoTexto * 0.75))),
                ),
              )
            ]),
            SizedBox(
              height: tamanhoTexto * 1,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: constraints.maxWidth / 5,
                    right: constraints.maxWidth / 5),
                child: Container(
                  width: constraints.maxWidth / 10 * 6,
                  child: Text(
                      '{INTRO} A Seguir, encontrará los temas analizados. ????',
                      style: TextStyle(fontSize: tamanhoTexto * 0.5)),
                ),
              )
            ]),
            SizedBox(
              height: tamanhoTexto * 1.25,
            ),
          ];
          temas.forEach((tema) {
            children.add(SizedBox(
              height: tamanhoTexto / 2,
            ));
            children.add(Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: constraints.maxWidth / 10,
                        right: constraints.maxWidth / 10),
                    child: Container(
                      width: constraints.maxWidth / 10 * 8,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/" + tema.id);
                        },
                        color: const Color(0xffbdbdbd),
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(tema.nombre,
                              style: TextStyle(fontSize: tamanhoTexto)),
                        ),
                      ),
                    ),
                  )
                ]));
          });
          children.add(SizedBox(
            height: tamanhoTexto / 2,
          ));
          return (ListView(children: children));
        }));
  }
}

class Tema {
  final String nombre;
  final String id;
  final Widget widget;
  Tema({@required this.nombre, @required this.id, @required this.widget});
}
