class ModeloPromocion {
  String _nombre;
  String _fecha;
  String _descuento;
  String _ruta;
  String _descripcion;

  ModeloPromocion({
    String nombre,
    String fecha,
    String descuento,
    String ruta,
    String descripcion,
  }) {
    this._nombre = nombre;
    this._fecha = fecha;
    this._descuento = descuento;
    this._ruta = ruta;
    this._descripcion = descripcion;
  }
  String get nombre => _nombre;
  String get fecha => _fecha;
  String get descuento => _descuento;
  String get ruta => _ruta;
  String get descripcion => _descripcion;
}
