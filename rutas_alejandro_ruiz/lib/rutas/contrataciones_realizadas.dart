import "package:flutter/material.dart";
import 'package:rutas_alejandro_ruiz/modelos/modelo_contratos.dart';
import 'package:rutas_alejandro_ruiz/vistas/item_contrato.dart';

class ContratacionesRealizadas extends StatefulWidget {
  @override
  _ContratacionesRealizadasState createState() => new _ContratacionesRealizadasState();
}

class _ContratacionesRealizadasState extends State<ContratacionesRealizadas> {
  List<ModeloContrato> contratos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contratos = <ModeloContrato>[

      ModeloContrato(
          id: "Peñarroya - Presa",
          fecha: "09/05/2020",
          imagenRuta: "imagenes/castillo.jpg",
          guia: "Julián Ruiz",
          estado: "Realizado",
          turista: "Ancianos"),
      ModeloContrato(
          id: "Puertollano - Mina",
          fecha: "09/05/2020",
          imagenRuta: "imagenes/puertollano.jpg",
          guia: "Pepe Guiones",
          estado: "Realizado",
          turista: "Ancianos"),
      ModeloContrato(
          id: "Puertollano - Museo",
          fecha: "11/05/2020",
          imagenRuta: "imagenes/puertollano.jpg",
          guia: "Antonio Recio",
          estado: "Realizado",
          turista: "Fotógrafos"),
      ModeloContrato(
          id: "Argamasilla - Tapas",
          fecha: "12/05/2020",
          imagenRuta: "imagenes/argamasilla.jpg",
          guia: "Julián Ruiz",
          estado: "Realizado",
          turista: "Familia"),
      ModeloContrato(
          id: "Ciudad Real - Catedral",
          fecha: "19/05/2020",
          imagenRuta: "imagenes/ciudadReal.jpg",
          guia: "Encarnita Baptisterio",
          estado: "Realizado",
          turista: "Familia"),
//
         
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
