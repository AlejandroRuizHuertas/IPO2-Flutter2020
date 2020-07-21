class ModeloTurista {
  String _nombre;
  String _telefono;
  String _numIntegrantes;
  String _integrantes;
  String _descripcion;

  ModeloTurista(
      {String nombre,
      String telefono,
      String numIntegrantes,
      String integrantes,
      String descripcion}) {
    this._nombre = nombre;
    this._numIntegrantes = numIntegrantes;
    this._telefono = telefono;
    this._integrantes = integrantes;
    this._descripcion = descripcion;
  }
  String get nombre => _nombre;
  String get numIntegrantes => _numIntegrantes;
  String get telefono => _telefono;
  String get integrantes => _integrantes;
  String get descripcion => _descripcion;
}
