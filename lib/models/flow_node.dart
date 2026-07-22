import 'dart:ui';

enum FlowNodeType { accion, decision, informacion, imagen }

enum FlowAnchor { top, right, bottom, left }

class FlowNode {
  final String id;
  final String titulo;
  final String descripcion;
  final String? etiqueta;
  final String? objetivo;
  final List<String> acciones;
  final List<String> elementos;
  final List<FlowLegendItem> leyenda;
  Offset posicion;
  final Size size;
  final FlowNodeType tipo;
  final Color color;
  final bool mostrarReferencia;
  final String? referenciaImagen;

  FlowNode({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.posicion,
    required this.size,
    required this.tipo,
    required this.color,
    this.etiqueta,
    this.objetivo,
    this.acciones = const [],
    this.elementos = const [],
    this.leyenda = const [],
    this.mostrarReferencia = true,
    this.referenciaImagen,
  });
}

class FlowLegendItem {
  final String texto;
  final Color color;

  const FlowLegendItem(this.texto, this.color);
}

class FlowConnection {
  final String desde;
  final String hacia;
  final String? etiqueta;
  final String descripcion;
  final Color color;
  final FlowAnchor salida;
  final FlowAnchor entrada;
  final List<Offset> puntos;
  final Offset? posicionEtiqueta;

  const FlowConnection({
    required this.desde,
    required this.hacia,
    required this.descripcion,
    this.etiqueta,
    this.color = const Color(0xFF27332D),
    this.salida = FlowAnchor.right,
    this.entrada = FlowAnchor.left,
    this.puntos = const [],
    this.posicionEtiqueta,
  });
}
