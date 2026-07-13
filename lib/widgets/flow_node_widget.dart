import 'package:flutter/material.dart';

import '../models/flow_node.dart';

class FlowNodeWidget extends StatelessWidget {
  final FlowNode node;
  final VoidCallback onTap;

  const FlowNodeWidget({super.key, required this.node, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: node.posicion.dx,
      top: node.posicion.dy,
      width: node.size.width,
      height: node.size.height,
      child: Semantics(
        button: true,
        label: node.titulo,
        child: node.tipo == FlowNodeType.decision
            ? _DecisionCard(node: node, onTap: onTap)
            : _StandardCard(node: node, onTap: onTap),
      ),
    );
  }
}

class _StandardCard extends StatefulWidget {
  final FlowNode node;
  final VoidCallback onTap;

  const _StandardCard({
    required this.node,
    required this.onTap,
  });

  @override
  State<_StandardCard> createState() => _StandardCardState();
}

class _StandardCardState extends State<_StandardCard> {
  double _scale = 1.0;

  void _animateTap(bool pressed) {
    setState(() {
      _scale = pressed ? 0.96 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isAction = widget.node.tipo == FlowNodeType.accion;
    final isLeadDificil = widget.node.tipo == FlowNodeType.imagen;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            onHighlightChanged: _animateTap,
            borderRadius: BorderRadius.circular(isAction ? 36 : 11),
            child: AnimatedScale(
              scale: _scale,
              duration: const Duration(milliseconds: 150),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.fromLTRB(
                  15,
                  widget.node.etiqueta == null ? 14 : 22,
                  14,
                  12,
                ),
                decoration: BoxDecoration(
                  color: isAction
                      ? widget.node.color
                      : Color.alphaBlend(
                          widget.node.color.withValues(alpha: isLeadDificil ? .10 : .06),
                          Colors.white,
                        ),
                  borderRadius: BorderRadius.circular(isAction ? 36 : 11),
                  border: isAction
                      ? null
                      : Border.all(
                          color: widget.node.color.withValues(
                            alpha: isLeadDificil ? .22 : .55,
                          ),
                          width: isLeadDificil ? 1 : 1.2,
                        ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF14261D).withValues(alpha: .07),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: _NodeContent(node: widget.node, isAction: isAction),
              ),
            ),
          ),
        ),
        if (widget.node.etiqueta case final label?)
          Positioned(
            top: -27,
            left: 0,
            right: 0,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: widget.node.color,
                fontSize: isLeadDificil ? 17 : 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        if (widget.node.mostrarReferencia && widget.node.referenciaImagen != null)
          Positioned(
            right: -28,
            top: widget.node.size.height / 2 - 21,
            child: _ReferenceBadge(
              image: widget.node.referenciaImagen!,
            ),
          ),
      ],
    );
  }
}

class _DecisionCard extends StatefulWidget {
  final FlowNode node;
  final VoidCallback onTap;

  const _DecisionCard({
    required this.node,
    required this.onTap,
  });

  @override
  State<_DecisionCard> createState() => _DecisionCardState();
}

class _DecisionCardState extends State<_DecisionCard> {
  double _scale = 1.0;

  void _animateTap(bool pressed) {
    setState(() {
      _scale = pressed ? 0.95 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            onHighlightChanged: _animateTap,
            borderRadius: BorderRadius.circular(8),
            child: AnimatedScale(
              scale: _scale,
              duration: const Duration(milliseconds: 150),
              child: Center(
                child: Transform.rotate(
                  angle: .785398,
                  child: Container(
                    width: widget.node.size.width * .72,
                    height: widget.node.size.height * .72,
                    decoration: BoxDecoration(
                      color: Color.alphaBlend(
                        widget.node.color.withValues(alpha: .045),
                        Colors.white,
                      ),
                      border: Border.all(color: widget.node.color, width: 1.5),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: widget.node.color.withValues(alpha: .08),
                          blurRadius: 8,
                          offset: const Offset(2, 3),
                        ),
                      ],
                    ),
                    child: Transform.rotate(
                      angle: -.785398,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            widget.node.titulo,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF111827),
                              fontSize: 12.5,
                              height: 1.32,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (widget.node.mostrarReferencia && widget.node.referenciaImagen != null)
          Positioned(
            right: -14,
            top: widget.node.size.height / 2 - 21,
            child: _ReferenceBadge(
              image: widget.node.referenciaImagen!,
            ),
          ),
      ],
    );
  }
}

class _NodeContent extends StatelessWidget {
  final FlowNode node;
  final bool isAction;

  const _NodeContent({required this.node, required this.isAction});

  @override
  Widget build(BuildContext context) {
    final textColor = isAction ? Colors.white : const Color(0xFF111827);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: isAction ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        if (node.titulo.isNotEmpty)
          Text(
            node.titulo,
            textAlign: isAction ? TextAlign.center : TextAlign.left,
            style: TextStyle(
              color: textColor,
              fontSize: node.tipo == FlowNodeType.imagen ? 13 : 14,
              height: 1.35,
              fontWeight: isAction ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        if (node.elementos.isNotEmpty)
          ...node.elementos.map(
            (item) => Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                '• $item',
                style: TextStyle(color: textColor, fontSize: 13, height: 1.28),
              ),
            ),
          ),
        if (node.leyenda.isNotEmpty) ...[
          const SizedBox(height: 12),
          ...node.leyenda.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: item.color,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: item.color.withValues(alpha: .25),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: Text(
                      item.texto,
                      style: const TextStyle(fontSize: 12.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _ReferenceBadge extends StatelessWidget {
  final String image;

  const _ReferenceBadge({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierColor: Colors.black87,
          builder: (_) => Dialog(
            backgroundColor: Colors.transparent,
            child: InteractiveViewer(
              minScale: 1,
              maxScale: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(image),
              ),
            ),
          ),
        );
      },
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF7C8797)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x18000000),
              blurRadius: 5,
            ),
          ],
        ),
        child: const Icon(
          Icons.image_outlined,
          color: Color(0xFF263445),
          size: 21,
        ),
      ),
    );
  }
}
