class ModeloContrato {
  String _id;
  String _fecha;
  String _imagenRuta;
  String _guia;
  String _estado;
  String _turista;

  ModeloContrato(
      {String id,
      String fecha,
      String imagenRuta,
      String guia,
      String estado,
      String turista}) {
    this._id = id;
    this._fecha = fecha;
    this._imagenRuta = imagenRuta;
    this._guia = guia;
    this._estado = estado;
    this._turista = turista;
  }
  String get id => _id;
  String get fecha => _fecha;
  String get imagenRuta => _imagenRuta;
  String get guia => _guia;
  String get estado => _estado;
  String get turista => _turista;
}
