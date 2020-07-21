import "package:flutter/material.dart";
import "package:rutas_alejandro_ruiz/rutas/rutas_principal.dart";

class Login extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (context) => Login(),
    );
  }

  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: formularioLogin(),
    );
  }

  Widget formularioLogin() {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image(
                  image: AssetImage('imagenes/escalada.png'),
                  width: 150,
                  height: 150,
                )
              ],
            ),
            Container(
              width: 300.0,
              child: Form(
                //Aquí meter el SingleChildScrollView
                key: _key,
                child: Column(
                  children: <Widget>[
                    //email
                    TextFormField(
                      validator: (text) {
                        //Aquí comprobamos si el correo está bien
                        print(text);
                        if (text != "1234") {
                          return "El correo es incorrecto";
                        }
                        if (text.length == 0) {
                          return "No puede dejar el correo vacío";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 50,
                      controller: new TextEditingController(),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Ingrese su correo',
                        hintStyle:
                            TextStyle(color: Theme.of(context).accentColor),
                        labelText: 'Correo',
                        labelStyle:
                            TextStyle(color: Theme.of(context).accentColor),
                        counterText: '',
                        icon: Icon(Icons.email,
                            size: 32.0, color: Theme.of(context).accentColor),
                      ),
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                    //contraseña
                    TextFormField(
                      validator: (text) {
                        //Aquí comprobamos si la contraseña está bien
                        if (text != "1234") {
                          return "La contraseña es incorrecta";
                        }
                        if (text.length == 0) {
                          return "No puede dejar la contraseña vacía";
                        }
                        return null;
                      },
                      controller: new TextEditingController(),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      maxLength: 20,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Theme.of(context).accentColor),
                      decoration: InputDecoration(
                        hintText: 'Ingrese su Contraseña',
                        hintStyle:
                            TextStyle(color: Theme.of(context).accentColor),
                        labelText: 'Contraseña',
                        labelStyle:
                            TextStyle(color: Theme.of(context).accentColor),
                        counterText: '',
                        icon: Icon(Icons.lock,
                            size: 32.0, color: Theme.of(context).accentColor),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (_key.currentState.validate()) {
                          Navigator.push(context, RutasPrincipal.route());
                        }
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        size: 42.0,
                        color: Theme.of(context).accentColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        color: Theme.of(context).primaryColor);
  }
}
