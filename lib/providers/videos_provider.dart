import 'package:flutter/material.dart';

import '../models/video_model.dart';

class VideosProvider extends ChangeNotifier {

  String busqueda = "";

  VideoModel? seleccionado;

  void buscar(String valor) {
    busqueda = valor;
    notifyListeners();
  }

  void seleccionar(VideoModel video) {
    seleccionado = video;
    notifyListeners();
  }
}