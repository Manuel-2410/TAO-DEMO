import 'package:flutter/material.dart';
import '../models/mensaje_model.dart';

class MensajesProvider extends ChangeNotifier {

  String busqueda = "";

  MensajeModel? seleccionado;

  void buscar(String valor) {
    busqueda = valor;
    notifyListeners();
  }

  void seleccionar(MensajeModel mensaje) {
    seleccionado = mensaje;
    notifyListeners();
  }
}