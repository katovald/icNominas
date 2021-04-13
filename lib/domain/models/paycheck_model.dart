class Paycheck {
  List<Percepcion> _percepciones;
  List<Deduccion> _deducciones;

  String _fechaInicio;
  String _fechaFin;

  bool _pre;

  get percepciones => _percepciones;
  set percepciones(List<dynamic> value) {
    _percepciones = value;
  }

  get deducciones => _deducciones;
  set deducciones(List<dynamic> value) {
    _deducciones = value;
  }

  get fechaInicio => _fechaInicio;
  set fechaInicio(String value) {
    _fechaInicio = value;
  }

  get fechaFin => _fechaFin;
  set fechaFin(String value) {
    _fechaFin = value;
  }

  get pre => _pre;
  set pre(bool value) {
    _pre = value;
  }

  Paycheck();
}

class Percepcion {
  String _concepto;
  double _unidad;
  double _excento;
  double _gravado;

  Percepcion();
}

class Deduccion {
  String _concepto;
  double _unidad;
  double _monto;

  Deduccion();
}