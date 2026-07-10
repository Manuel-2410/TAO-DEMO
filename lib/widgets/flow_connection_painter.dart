import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../models/flow_node.dart';

class FlowConnectionPainter extends CustomPainter {
  final List<FlowNode> nodes;
  final List<FlowConnection> connections;

  FlowConnectionPainter(this.nodes, this.connections);

  @override
  void paint(Canvas canvas, Size size) {
    final nodesById = {for (final node in nodes) node.id: node};

    for (final connection in connections) {
      final source = nodesById[connection.desde];
      final target = nodesById[connection.hacia];

      // Una conexión incompleta no debe impedir que se pinte el resto.
      if (source == null || target == null) {
        continue;
      }

      final start = _anchor(source, connection.salida);
      final end = _anchor(target, connection.entrada);
      final points = <Offset>[start, ...connection.puntos, end];

      final linePaint = Paint()
        ..color = connection.color
        ..strokeWidth = 1.6
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round;

      final path = Path()..moveTo(points.first.dx, points.first.dy);

      for (var index = 1; index < points.length; index++) {
        path.lineTo(points[index].dx, points[index].dy);
      }

      canvas.drawPath(path, linePaint);
      _drawArrow(canvas, points[points.length - 2], end, connection.color);

      final label = connection.etiqueta;
      if (label != null && label.isNotEmpty) {
        _drawLabel(
          canvas,
          label,
          connection.posicionEtiqueta ?? _middleOf(points),
          connection.color,
        );
      }
    }
  }

  Offset _anchor(FlowNode node, FlowAnchor anchor) {
    switch (anchor) {
      case FlowAnchor.top:
        return Offset(node.posicion.dx + node.size.width / 2, node.posicion.dy);
      case FlowAnchor.right:
        return Offset(
          node.posicion.dx + node.size.width,
          node.posicion.dy + node.size.height / 2,
        );
      case FlowAnchor.bottom:
        return Offset(
          node.posicion.dx + node.size.width / 2,
          node.posicion.dy + node.size.height,
        );
      case FlowAnchor.left:
        return Offset(
          node.posicion.dx,
          node.posicion.dy + node.size.height / 2,
        );
    }
  }

  Offset _middleOf(List<Offset> points) {
    final index = (points.length - 1) ~/ 2;
    return Offset.lerp(points[index], points[index + 1], .5)!;
  }

  void _drawArrow(Canvas canvas, Offset previous, Offset end, Color color) {
    final angle = math.atan2(end.dy - previous.dy, end.dx - previous.dx);
    const arrowSize = 8.0;

    final path = Path()
      ..moveTo(end.dx, end.dy)
      ..lineTo(
        end.dx - arrowSize * math.cos(angle - math.pi / 6),
        end.dy - arrowSize * math.sin(angle - math.pi / 6),
      )
      ..lineTo(
        end.dx - arrowSize * math.cos(angle + math.pi / 6),
        end.dy - arrowSize * math.sin(angle + math.pi / 6),
      )
      ..close();

    canvas.drawPath(path, Paint()..color = color);
  }

  void _drawLabel(Canvas canvas, String text, Offset center, Color color) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          height: 1.2,
          fontWeight: FontWeight.w600,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: 110);

    final background = Rect.fromCenter(
      center: center,
      width: textPainter.width + 12,
      height: textPainter.height + 6,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(background, const Radius.circular(4)),
      Paint()..color = const Color(0xFFF8FAFC),
    );

    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant FlowConnectionPainter oldDelegate) {
    return oldDelegate.nodes != nodes || oldDelegate.connections != connections;
  }
}
