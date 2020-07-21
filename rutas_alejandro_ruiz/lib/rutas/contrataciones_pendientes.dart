import "package:flutter/material.dart";
import 'package:rutas_alejandro_ruiz/modelos/modelo_contratos.dart';
import 'package:rutas_alejandro_ruiz/vistas/item_contrato.dart';

class ContratacionesPendientes extends StatefulWidget {
  @override
  _ContratacionesPendientesState createState() =>
      new _ContratacionesPendientesState();
}

class _ContratacionesPendientesState extends State<ContratacionesPendientes> {
  List<ModeloContrato> contratos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contratos = <ModeloContrato>[
      ModeloContrato(
          id: "Barrio del Carmen",
          fecha: "05/06/2020",
          imagenRuta: "imagenes/puertollano.jpg",
          guia: "Er Richar",
          estado: "Pendiente",
          turista: "Fotógrafos"),
      ModeloContrato(
          id: "Argamasilla - Iglesia",
          fecha: "06/06/2020",
          imagenRuta: "imagenes/argamasilla.jpg",
          guia: "Pepe Pepito",
          estado: "Pendiente",
          turista: "Fotógrafos"),
      ModeloContrato(
          id: "Peñarroya - Presa",
          fecha: "09/06/2020",
          imagenRuta: "imagenes/castillo.jpg",
          guia: "Julián Ruiz",
          estado: "Pendiente",
          turista: "Ancianos"),
      ModeloContrato(
          id: "Cinco Casas - Placas solares",
          fecha: "11/06/2020",
          imagenRuta: "imagenes/cincocasas.jpg",
          guia: "Antonio Recio",
          estado: "Pendiente",
          turista: "Familia"),
      ModeloContrato(
          id: "Alcázar - Estación de Tren",
          fecha: "12/06/2020",
          imagenRuta: "imagenes/alcazar.jpg",
          guia: "Pepe Guiones",
          estado: "Pendiente",
          turista: "Familia"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView.builder(
          itemCount: contratos.length,
          itemBuilder: (context, int item) =>
              new ItemContrato(contratos[item])),
    );
  }
}
