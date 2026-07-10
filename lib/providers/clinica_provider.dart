import 'package:flutter/material.dart';
import '../models/tratamiento.dart';

class ClinicaProvider extends ChangeNotifier {

  String busqueda = "";

  Tratamiento? seleccionado;

  void seleccionar(Tratamiento tratamiento) {
    seleccionado = tratamiento;
    notifyListeners();
  }

  void buscar(String texto) {
    busqueda = texto;
    notifyListeners();
  }
}