export './Flutter.dart';
export './Dilema.dart';
export './Competidores.dart';
export './Google.dart';
export './Dart.dart';
export './LaApp.dart';
export './Patrones.dart';
export './Performance.dart';
export './Almacenamiento.dart';
export './Conectividad.dart';
export './Seguridad.dart';
export './UiUx.dart';
export './RoadBLOCks.dart';
export './Conclusiones.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InfoTema {
  int contador;
  final int index;
  int contadorTemp;
  Timer timer;
  InfoTema({@required this.index, this.contador, this.contadorTemp});
}

bool hasConnection() {
  return html.window.navigator.onLine;
}

Future<http.Response> upVote(InfoTema contador) async {
  print(contador);
  return http.get(
      'https://script.google.com/macros/s/AKfycbxdkQD1GDUJdnqqfcz6AQ-VqfeGqr11xppX3ucAkaA-4qKwmSU/exec?index=' +
          contador.index.toString() +
          "&ups=" +
          contador.contadorTemp.toString());
}

Future<http.Response> update(String index) async {
  return http.get(
      'https://script.google.com/macros/s/AKfycbxdkQD1GDUJdnqqfcz6AQ-VqfeGqr11xppX3ucAkaA-4qKwmSU/exec?tema=' +
          index);
}
