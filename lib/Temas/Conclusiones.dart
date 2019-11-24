import 'dart:async';
import 'package:appreport/Temas/Temas.dart';
import 'package:flutter/gestures.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:flutter/material.dart';
import 'dart:convert';

class Conclusiones extends StatefulWidget {
  const Conclusiones({Key key}) : super(key: key);
  @override
  ConclusionesState createState() => ConclusionesState();
}

class ConclusionesState extends State<Conclusiones> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  InfoTema contador;
  int con;
  final String id = "conclusiones";
  final int index = 15;
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
                      child: Text('Conclusiones',
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
                            text: 'Este año Futter tuvo una gran presencia en el Github Octoverse, el estudio donde se analizó lo que se hizo durante el ultimo año en los 44+ millones de repositorios de github.' +
                                ' Este hecho se puede observar en las imágenes a seguir donde se muestran los trends que ocurrieron. En la primera imagen se puede observar que Flutter es el tercer repositorio con más contribuidores del año, ' +
                                'entre los cuales, luego de nuestro issue, nos podemos incluir. Respectivamente, como se puede notar en la segunda imagen, flutter es el segundo repositorio open-source con mayor porcentaje de crecimiento por contribuidores.',
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
            SizedBox(
              height: tamanhoTexto,
            ),
          );
          children.add(
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
                child: Container(
                    width: width,
                    child: Image(image: AssetImage('images/stats1.jpeg'))),
              ),
            ]),
          );
          children.add(
            SizedBox(
              height: tamanhoTexto,
            ),
          );
          children.add(
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
                child: Container(
                    width: width,
                    child: Image(image: AssetImage('images/stats2.jpeg'))),
              ),
            ]),
          );
          children.add(
            SizedBox(
              height: tamanhoTexto,
            ),
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
                            text: 'Por otro lado, según las mismas estadísticas de github, dart fue el lenguaje con mayor crecimiento este ultimo año, con un  crecimiento de 532%. Esto, según github, como se puede ' +
                                'observar en la imagen a seguir se debe plenamente a la utilización de flutter. Dicho esto, a pesar de que Flutter como framework esta siendo utilizado por grandes empresas como Alibaba,' +
                                ' aun le falta bastante por mejorar. ',
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
            SizedBox(
              height: tamanhoTexto,
            ),
          );
          children.add(
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
                child: Container(
                    width: width,
                    child: Image(image: AssetImage('images/stats3.jpeg'))),
              ),
            ]),
          );
          children.add(
            SizedBox(
              height: tamanhoTexto,
            ),
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
                            text: 'Con respecto a su versión web y los análisis hechos en este reporte, Flutter web está generando unas herramientas con una grande versatilidad, entre estas se encuentra la posibilidad' +
                                ' de embeber una aplicación móvil completa dentro de un único elemento html en cualquier pagina web. Además, su facilidad de despliegue, cuando dart2js funciona bien, implica que en un futuro, cuando' +
                                ' todo esté bien implementado, cualquier aplicación que se concentre en visualizar información podría ser desplegada como una PWA. Esto porque gracias a las herramientas que da Flutter, con tan solo implementar ' +
                                'los features descritos en las secciones anteriores esta se puede considerar una PWA.\n\nPese a que las PWAs podrían revolucionar la industria de las aplicaciones móviles, su compilación en lenguaje nativo nunca dejará de ser necesaria ' +
                                'ya que los browsers tienen grandes limitaciones, especialmente con respecto a los sensores y la privacidad. Sin embargo, a pesar de que esto puede limitar un poco los features que se pueden implementar,' +
                                ' el hecho de que una app se pueda desplegar como una PWA le garantiza al usuario final muchos de los aspectos de seguridad que traen los browsers. Por estas razones consideramos que en un futuro, ' +
                                ' herramientas como flutter web podrán ser de gran utilidad para atraer usuarios, ya que eso les permitirá a las empresas llegar a los usuario sin que ellos tengan que ultrapasar ' +
                                'el gran compromiso que es descargar una aplicación en su celular.\n\nFinalmente, aunque la versión web de flutter tiene mucho potencial, aun le falta mucho por mejorar. Entre estos' +
                                ' aspectos esta la usabilidad en dispositivos de pantallas grandes ya cosas tan triviales como el scrollbar, los mouse hovers, y links a otras paginas, aun no se pueden implementar ' +
                                'con facilidad. Es importante resaltar que flutter web aun esta en technical preview, por lo que es impresionante que en tan solo un año del lanzamiento del framework, ya esté tan avanzada su rama de web.' +
                                ' Estamos seguros de que este logro no solo se debe a los desarrolladores del framework si no que también a la increíble comunidad de open-source que, como se notó anteriormente, han aportado tremendamente. ',
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
