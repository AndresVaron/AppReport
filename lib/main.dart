import 'package:flutter/material.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Report',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'App Report'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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
        title: Text(widget.title),
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
      ),
    );
  }
}
