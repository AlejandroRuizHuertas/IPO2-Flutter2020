class ModeloGuia {
  String _nombre;
  String _imagenGuia;
  String _telefono;
  String _puntuacion;
  String _turno;

  ModeloGuia(
      {String nombre,
      String imagenGuia,
      String telefono,
      String puntuacion,
      String turno}) {
    this._nombre = nombre;
    this._imagenGuia = imagenGuia;
    this._telefono = telefono;
    this._puntuacion = puntuacion;
    this._turno = turno;
  }
  String get nombre => _nombre;
  String get imagenGuia => _imagenGuia;
  String get telefono => _telefono;
  String get puntuacion => _puntuacion;
  String get turno => _turno;
}
