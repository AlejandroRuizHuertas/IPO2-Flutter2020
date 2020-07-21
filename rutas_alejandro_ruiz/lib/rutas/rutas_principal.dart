import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:rutas_alejandro_ruiz/rutas/circuitos.dart';
import 'package:rutas_alejandro_ruiz/rutas/guias.dart';
import 'package:rutas_alejandro_ruiz/rutas/contrataciones.dart';
import 'package:rutas_alejandro_ruiz/rutas/promociones.dart';
import 'package:rutas_alejandro_ruiz/rutas/turistas.dart';

class RutasPrincipal extends StatefulWidget {


  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (context) => RutasPrincipal(),
    );
  }

  @override
  _RutasPrincipalState createState() => new _RutasPrincipalState();
}

class _RutasPrincipalState extends State<RutasPrincipal>
    with SingleTickerProviderStateMixin {
        static String _titulo = "AndApp";
  static TextStyle _stTitulo = new TextStyle(
      color: _colorPrincipal,
      fontFamily: "Baloo",
      fontWeight: FontWeight.normal,
      fontSize: 25);

  Text tituloAppBar = new Text(_titulo, style: _stTitulo);
  TabController _controlador;
  ListView _listaMenu;
  static Color _colorPrincipal = new Color(0xfffccc00);
  TextStyle _colorTextoPrincipal = new TextStyle(color: _colorPrincipal);

  TextStyle _textoPerfil =
      new TextStyle(color: new Color(0xfffccc00), fontSize: 20);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controlador = new TabController(vsync: this, initialIndex: 0, length: 5);

    _listaMenu = new ListView(children: <Widget>[
      new Container(
        height: 60.0,
        child: new DrawerHeader(child: new Text("Perfil", style: _textoPerfil)),
        color: new Color(0xff003c1b),
      ),
      new Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        width: 100.0,
        height: 100.0,
        alignment: Alignment.center,
        child: new Container(
            alignment: Alignment.center,
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(const Radius.circular(70.0)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("imagenes/maxim.jpg")))),
      ),
      new ListTile(
        title: new Text("Nombre: Máximo Huertas", style: _colorTextoPrincipal),
      ),
      new ListTile(
        title: new Text("Rol: Guía turístico", style: _colorTextoPrincipal),
      ),
      new ListTile(
        title: new Text("Fecha de último acceso: 08/05/2020",
            style: _colorTextoPrincipal),
      ),
      new Container(
        alignment: Alignment.bottomLeft,
        child: new AboutListTile(
          child: new Text(
            "Sobre AndApp",
            style: _colorTextoPrincipal,
          ),
          applicationIcon: new Icon(Icons.info),
          icon: new Icon(Icons.info, color: _colorPrincipal),
          applicationVersion: "v1.0",
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    
    AppBar ab = new AppBar(
      leading: Icon(Icons.menu, color: Theme.of(context).accentColor),
      title: tituloAppBar,
      actions: <Widget>[
        //Botón para salir
        IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
    return new Scaffold(
      appBar: ab,
      drawer: new Drawer(
          child: Container(color: new Color(0xff00652d), child: _listaMenu)),
      bottomNavigationBar: new Container(
          color: Theme.of(context).primaryColor,
          child: new TabBar(
            tabs: <Widget>[
              //Contratar circuitos
              new Tab(
                icon: new Icon(FontAwesomeIcons.fileContract,
                    color: Theme.of(context).accentColor),
              ),
              //Ver circuitos
              new Tab(
                icon: new Icon(FontAwesomeIcons.mapSigns,
                    color: Theme.of(context).accentColor),
              ),
              //Guías
              new Tab(
                icon: new Icon(FontAwesomeIcons.hiking,
                    color: Theme.of(context).accentColor),
              ),

              //Promociones
              new Tab(
                icon:
                    new Icon(Icons.email, color: Theme.of(context).accentColor),
              ),
              //Turistas
              new Tab(
                icon:
                    new Icon(Icons.group, color: Theme.of(context).accentColor),
              )
            ],
            controller: _controlador,
          )),
      body: new TabBarView(
        controller: _controlador,
        children: <Widget>[
          new Contrataciones(tituloAppBar),
          new Circuitos(),
          new Guias(),
          new Promociones(),
          new Turistas()
        ],
      ),
    );
  }
}
