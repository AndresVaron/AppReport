import 'package:flutter/material.dart';

abstract class ConnectivityEvent {}

class RefreshEvent extends ConnectivityEvent {
  final String id;
  RefreshEvent({@required this.id});
  @override
  String toString() => 'RefreshEvent';
}

class AddEvent extends ConnectivityEvent {
  final String id;
  AddEvent({@required this.id});
  @override
  String toString() => 'AddEvent';
}

class LoadScreenEvent extends ConnectivityEvent {
  final String id;
  LoadScreenEvent(this.id);
}
