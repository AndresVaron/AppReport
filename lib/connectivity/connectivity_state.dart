import 'package:flutter/material.dart';

abstract class ConnectivityState {
  final int contador;
  ConnectivityState({@required this.contador});
}

class ConnectivityInitialState extends ConnectivityState {
  ConnectivityInitialState() : super(contador: 0);
  @override
  String toString() => 'BlocInitialState';
}

class ContadorState extends ConnectivityState {
  final int contador;
  ContadorState({this.contador}) : super(contador: contador);
  @override
  String toString() => 'ContadorState';
}

class ContadorErrorState extends ConnectivityState {
  final int contador;
  ContadorErrorState({this.contador}) : super(contador: contador);
  @override
  String toString() => 'ContadorErrorState';
}
