import 'dart:io';

import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rutas_alejandro_ruiz/modelos/modelo_circuitos.dart';

class AddModCircuito extends StatefulWidget {
// Propiedad inmutable
  ModeloCircuito circuito;
  AddModCircuito({this.circuito});
  @override
  _AddModCircuitoState createState() => _AddModCircuitoState();
}

class _AddModCircuitoState extends State<AddModCircuito> {
  File imageFile;
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: formulario(context));
  }

  Widget formulario(BuildContext context) {
    //Si el circuito está vacío es que es nuevo
    if (widget.circuito == null) {
      widget.circuito = new ModeloCircuito(
          imagenCircuito: "imagenes/tomelloso.jpg",
          descripcion: "",
          monumentos: "",
          nombre: "",
          precio: "");
    }
    return new Scaffold(
        appBar: new AppBar(
          iconTheme: IconThemeData(
              color: Theme.of(context).accentColor 
              ),
          title: new Text("Nuevo circuito",
              style: TextStyle(color: Theme.of(context).accentColor)),
        ),
        body: new Container(
            padding: const EdgeInsets.all(8.0),
            child: new Form(
                key: _key,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _mostrar_imagen(widget.circuito.imagenCircuito),
                      _tfNombre(),
                      _tfPrecio(),
                      _tfDescripcion(),
                      _tfMonumentos(),
                      _btnEnviar()
                    ],
                  ),
                ))));
  }

  Widget _mostrar_imagen(String imagenRuta) {
    if (imageFile == null) {
      return new Container(
          width: 400,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(20.0)),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(imagenRuta))),
          alignment: Alignment.bottomRight,
          child: _btnSubirFoto());
    } else {
      return new Container(
          width: 400,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(20.0)),
              image: DecorationImage(
                  fit: BoxFit.cover, image: Image.file(imageFile).image)),
          alignment: Alignment.bottomRight,
          child: _btnSubirFoto());
    }
  }

  Widget _btnSubirFoto() {
    return ClipOval(
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          child: SizedBox(
              width: 50,
              height: 50,
              child: Icon(FontAwesomeIcons.image,
                  color: Theme.of(context).accentColor)),
          onTap: () {
            _openGallery();
          },
        ),
      ),
    );
  }
    void _openGallery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = picture;
    });
  }

  Widget _tfNombre() {
    var txt = TextEditingController();
    txt.text = widget.circuito.nombre;
    return TextFormField(
      controller: txt,
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value.isEmpty) {
          return 'Introduzca un valor válido';
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: "Introduzca el nombre del circuito",
          labelText: "Nombre",
          counterText: '',
          labelStyle: new TextStyle(color: Colors.black)),
    );
  }

  Widget _tfPrecio() {
    var txt = TextEditingController();
    txt.text = widget.circuito.precio;

    return TextFormField(
      controller: txt,

      validator: (value) {
        if (value.isEmpty) {
          return 'Introduzca un valor válido';
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: "Introduzca el precio del circuito",
          labelText: "Precio",
          counterText: '',
          labelStyle: new TextStyle(color: Colors.black)),
    );
  }

  Widget _tfDescripcion() {
    var txt = TextEditingController();
    txt.text = widget.circuito.descripcion;
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: txt,

      validator: (value) {
        if (value.isEmpty) {
          return 'Introduzca un valor válido';
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: "Introduzca la descripción del circuito",
          labelText: "Descripción",
          counterText: '',
          labelStyle: new TextStyle(color: Colors.black)),
    );
  }

  Widget _tfMonumentos() {
    var txt = TextEditingController();
    txt.text = widget.circuito.monumentos;
    return TextFormField(
      controller: txt,

      validator: (value) {
        if (value.isEmpty) {
          return 'Introduzca un valor válido';
        }
        return null;
      },
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
          hintText: "Introduzca el nombre de los monumentos del circuito",
          labelText: "Monumentos",
          counterText: '',
          labelStyle: new TextStyle(color: Colors.black)),
    );
  }

  Widget _btnEnviar() {
    return new RaisedButton(
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      onPressed: () {
        if (_key.currentState.validate()) {
          Fluttertoast.showToast(
            msg: "Circuito creado",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: new Color(0xff007e39),
            textColor: Theme.of(context).accentColor,
            fontSize: 18.0,
          );
          Navigator.of(context).pop();
        }
      },
      child: Text('ENVIAR',
          style: new TextStyle(color: Theme.of(context).accentColor)),
    );
  }
}
