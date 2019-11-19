import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;

class Tema1 extends StatefulWidget {
  final String nombre;

  const Tema1({Key key, this.nombre}) : super(key: key);

  @override
  Tema1State createState() => Tema1State(nombre);
}

class Tema1State extends State<Tema1> {
  final String nombre;

  int _counter = 0;

  Tema1State(this.nombre);
  void initState() {
    _counter = checkLocal();
    super.initState();
  }

  int checkLocal() {
    try {
      String storedCounter = html.window.localStorage['counter'];
      if (storedCounter != null) {
        return int.parse(storedCounter);
      }
    } catch (error) {
      print("ERRORINIT:");
      print(error);
    }
    return 0;
  }

  void _incrementCounter() {
    try {
      html.window.localStorage['counter'] = (_counter + 1).toString();
    } catch (error) {
      print("ERRORINCREMENT:");
      print(error);
    }
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(nombre)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ));
  }
}
