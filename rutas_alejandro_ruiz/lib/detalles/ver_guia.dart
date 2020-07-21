import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rutas_alejandro_ruiz/add_mod/add_mod_guias.dart';
import 'package:rutas_alejandro_ruiz/modelos/modelo_guia.dart';
import 'package:url_launcher/url_launcher.dart';

class DetallesGuia extends StatefulWidget {
// Propiedad inmutable
  final ModeloGuia guia;
  DetallesGuia({this.guia});
  @override
  _DetallesGuiaState createState() => _DetallesGuiaState();
}

class _DetallesGuiaState extends State<DetallesGuia> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          iconTheme: IconThemeData(color: Theme.of(context).accentColor),
          title: new Text(widget.guia.nombre,
              style: new TextStyle(color: Theme.of(context).accentColor)),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.build,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                Route ruta = new MaterialPageRoute(
                    builder: (context) => new AddModGuia(guia: widget.guia));
                Navigator.push(context, ruta);
              },
            )
          ],
        ),
        body: new Container(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              children: <Widget>[
                _mostrar_imagen(widget.guia.imagenGuia),
                _mostrar_fila_icono(Icon(FontAwesomeIcons.hiking), " Nombre: ",
                    widget.guia.nombre),
                _mostrar_llamada(" Teléfono: ", widget.guia.telefono, context),
                new Divider(
                  height: 18.0,
                ),
                _mostrar_estrellitas(widget.guia.puntuacion, context),
                                new Divider(
                  height: 18.0,
                ),
                _mostrar_fila_icono(Icon(FontAwesomeIcons.clock)," Turno: ", widget.guia.turno),
              ],
            )));
  }

  //Aquí uso en ambos casos IBM Plex porque al usar IBM Plex y Poppy hay 1 píxel de diferencia
  Widget _mostrar_fila(String nombre, String apellido, BuildContext context) {
    return new Container(
        margin: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: <Widget>[
            new Divider(
              height: 18.0,
            ),
            Row(
              children: <Widget>[
                new Text(
                  nombre,
                  style: new TextStyle(
                      fontSize: 20,
                      fontFamily: Theme.of(context).textTheme.body1.fontFamily),
                ),
                new Text(
                  apellido,
                  style: new TextStyle(
                      fontSize: 20,
                      fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                      fontWeight: FontWeight.normal),
                ),
              ],
            )
          ],
        ));
  }

  Widget _mostrar_fila_icono(Widget icono, String nombre, String apellido) {
    return new Container(
        margin: const EdgeInsets.only(top: 15.0),
        child: Row(
          children: <Widget>[
            icono,
            new Text(
              nombre,
              style: new TextStyle(
                fontSize: 20,
              ),
            ),
            new Text(
              apellido,
              style: new TextStyle(
                  fontSize: 20,
                  fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ));
  }

  Widget _mostrar_estrellitas(String puntuacion, BuildContext context) {
    return Row(
      children: <Widget>[
        new Icon(FontAwesomeIcons.star),
        new Text(
          " Puntuación:  ",
          style: new TextStyle(
            fontSize: 20,
          ),
        ),
        Container(
            height: 20,
            width: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: int.parse(puntuacion[0]),
                itemBuilder: (context, int item) => Icon(
                      Icons.star,
                      color: Theme.of(context).accentColor,
                    ))),
      ],
    );
  }

  Widget _mostrar_llamada(
      String nombre, String apellido, BuildContext context) {
    String phone = "tel:" + apellido;
    _callPhone() async {
      if (await canLaunch(phone)) {
        await launch(phone);
      } else {
        throw 'Could not Call Phone';
      }
    }

    return new Container(
      margin: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: <Widget>[
          new Divider(
            height: 18.0,
          ),
          Row(
            children: <Widget>[
              new Icon(Icons.phone),
              new Text(
                nombre,
                style: new TextStyle(
                  fontSize: 20,
                ),
              ),
              new FlatButton(
                  onPressed: () {
                    _callPhone();
                  },
                  child: new Text(
                    apellido,
                    style: new TextStyle(
                        fontSize: 20,
                        fontFamily:
                            Theme.of(context).textTheme.body1.fontFamily,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).accentColor,
                        decoration: TextDecoration.underline),
                        
                  )),
            ],
          )
        ],
      ),
    );
  }

  Widget _mostrar_imagen(String imagenRuta) {
    return new Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(const Radius.circular(200.0)),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(imagenRuta))),
      alignment: Alignment.bottomRight,
    );
  }

  Widget _mostrar_individual(String texto) {
    return new Container(
      margin: const EdgeInsets.only(top: 15.0),
      child: Text(
        texto,
        style: new TextStyle(
          fontSize: 20,
        ),
      ),
    );
    ;
  }
}
