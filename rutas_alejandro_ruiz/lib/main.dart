import "package:flutter/material.dart";

import "package:rutas_alejandro_ruiz/rutas/login.dart";

void main() {

  runApp(new MaterialApp(
      home: new Login(),
      title: "Andapp",
      theme: new ThemeData(
          primaryColor: new Color(0xff00652d),
          accentColor: new Color(0xfffccc00),
          textTheme: new TextTheme(
            body1: new TextStyle(
              fontFamily: "IBMPlexSans",
              fontWeight: FontWeight.bold
            ),
            body2: new TextStyle(
              fontFamily: "Poppy",
              fontWeight: FontWeight.normal
            )
          )
          ),
      debugShowCheckedModeBanner: false,
    ));    
}


