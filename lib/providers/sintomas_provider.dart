import 'package:flutter/material.dart';

import '../models/sintoma.dart';

class SintomasProvider extends ChangeNotifier {

  String busqueda = "";
  String categoria = "Todas";

  Sintoma? seleccionado;

  void buscar(String texto) {
    busqueda = texto;
    notifyListeners();
  }

  void seleccionar(Sintoma sintoma) {
    seleccionado = sintoma;
    notifyListeners();
  }
  void cambiarCategoria(
    String value,
  ) {
    categoria = value;
    notifyListeners();
  }
}