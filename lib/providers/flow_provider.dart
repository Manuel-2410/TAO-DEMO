import 'package:flutter/material.dart';

import '../models/flow_node.dart';

class FlowProvider extends ChangeNotifier {
  FlowNode? seleccionado;
  final List<FlowNode> nodes;

  FlowProvider(this.nodes);

  void seleccionar(FlowNode node) {
    seleccionado = node;
    notifyListeners();
  }

  void cerrarDetalle() {
    seleccionado = null;
    notifyListeners();
  }

  void moverNodo(String id, Offset nuevaPosicion) {
    final node = nodes.firstWhere((item) => item.id == id);
    node.posicion = nuevaPosicion;
    notifyListeners();
  }
}
