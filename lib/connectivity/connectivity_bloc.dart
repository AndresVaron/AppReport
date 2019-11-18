import 'dart:async';
import './connectivity.dart';
import 'package:bloc/bloc.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  @override
  ConnectivityState get initialState => ConnectivityInitialState();

  @override
  Stream<ConnectivityState> mapEventToState(
    ConnectivityEvent event,
  ) async* {
    if (event is BlocClickedEvent) {
      print("BlocClicked!");
    }
  }
}
