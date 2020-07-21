import "package:flutter/material.dart";
import 'package:rutas_alejandro_ruiz/add_mod/add_mod_contratos.dart';
import 'package:rutas_alejandro_ruiz/modelos/modelo_contratos.dart';
import 'package:rutas_alejandro_ruiz/rutas/contrataciones_pendientes.dart';
import 'package:rutas_alejandro_ruiz/rutas/contrataciones_realizadas.dart';


class Contrataciones extends StatefulWidget {
  Text tituloAppBar;
  Contrataciones(Text tituloAppBar);


  @override
  _ContratacionesState createState() => new _ContratacionesState();
}

class _ContratacionesState extends State<Contrataciones>
    with SingleTickerProviderStateMixin {
  List<ModeloContrato> contratos;
  TabController _controlador;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controlador = new TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
            floatingActionButton: FloatingActionButton(
        onPressed: () {
                      Route ruta = new MaterialPageRoute(
              builder: (context) => new AddModContrato());
          Navigator.push(context, ruta);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: getTabBar(),
        ),
      ),
      body: getTabBarPages());
  }
  Widget getTabBar() {
  return TabBar(controller: _controlador, labelColor: Theme.of(context).accentColor, tabs: [
    Tab(text: "Pendientes"),
    Tab(text: "Realizadas"),

  ]);
}

Widget getTabBarPages() {
  return TabBarView(controller: _controlador, children: <Widget>[
new ContratacionesPendientes(),
new ContratacionesRealizadas()
  ]);
}
}
