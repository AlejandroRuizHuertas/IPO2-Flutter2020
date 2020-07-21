class ModeloCircuito {
  String _nombre;
  String _imagenCircuito;
  String _precio;
  String _descripcion;
  String _monumentos;

  ModeloCircuito(
      {String nombre,
      String imagenCircuito,
      String precio,
      String descripcion,
      String monumentos}) {
    this._nombre = nombre;
    this._imagenCircuito = imagenCircuito;
    this._precio = precio;
    this._descripcion = descripcion;
    this._monumentos = monumentos;
  }
  String get nombre => _nombre;
  String get imagenCircuito => _imagenCircuito;
  String get precio => _precio;
  String get descripcion => _descripcion;
  String get monumentos => _monumentos;
}
