abstract class ConnectivityState {}

class ConnectivityInitialState extends ConnectivityState {
  @override
  String toString() => 'BlocInitialState';
}

class BlocClickedState extends ConnectivityState {
  @override
  String toString() => 'BlocClickedState';
}
