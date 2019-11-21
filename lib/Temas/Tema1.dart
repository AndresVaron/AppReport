import 'package:appreport/connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tema1 extends StatefulWidget {
  @override
  Tema1State createState() => Tema1State();
}

class Tema1State extends State<Tema1> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
      if (state.toString() == "BlocInitialState") {
        BlocProvider.of<ConnectivityBloc>(context)
            .add(RefreshEvent(id: "tema1"));
      }
      return Scaffold(
          appBar: AppBar(
              title: Center(child: Text("Ups: " + state.contador.toString())),
              actions: <Widget>[
                // action button
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    BlocProvider.of<ConnectivityBloc>(context)
                        .add(RefreshEvent(id: "tema1"));
                  },
                )
              ]),
          body: BlocListener<ConnectivityBloc, ConnectivityState>(
              listener: (BuildContext context, ConnectivityState state) {
                if (state is ContadorErrorState) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("No hay conexión a Internet"),
                    action: SnackBarAction(
                      label: 'Reintentar',
                      onPressed: () {
                        BlocProvider.of<ConnectivityBloc>(context)
                            .add(RefreshEvent(id: "tema1"));
                      },
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 5),
                  ));
                }
              },
              child: Center(
                child: Column(
                  //Esto es lo que se cambia
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have pushed the button this many times:',
                    ),
                  ],
                ),
              )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<ConnectivityBloc>(context)
                  .add(AddEvent(id: "tema1"));
            },
            tooltip: 'Increment',
            child: Icon(Icons.arrow_upward),
          ));
    });
  }
}
