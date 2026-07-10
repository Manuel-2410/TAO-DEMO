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
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: node.tipo == FlowNodeType.decision
              ? _DecisionCard(node: node)
              : _StandardCard(node: node),
        ),
      ),
    );
  }
}

class _StandardCard extends StatelessWidget {
  final FlowNode node;

  const _StandardCard({required this.node});

  @override
  Widget build(BuildContext context) {
    final isAction = node.tipo == FlowNodeType.accion;
    final isLeadDificil = node.tipo == FlowNodeType.imagen;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.fromLTRB(
            15,
            node.etiqueta == null ? 14 : 22,
            14,
            12,
          ),
          decoration: BoxDecoration(
            color: isAction
                ? node.color
                : Color.alphaBlend(
                    node.color.withValues(alpha: isLeadDificil ? .10 : .06),
                    Colors.white,
                  ),
            borderRadius: BorderRadius.circular(isAction ? 36 : 11),
            border: isAction
                ? null
                : Border.all(
                    color: node.color.withValues(
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
          child: _NodeContent(node: node, isAction: isAction),
        ),
        if (node.etiqueta case final label?)
          Positioned(
            top: -27,
            left: 0,
            right: 0,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: node.color,
                fontSize: isLeadDificil ? 17 : 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        if (node.mostrarReferencia)
          Positioned(
            right: -28,
            top: node.size.height / 2 - 21,
            child: const _ReferenceBadge(),
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
      crossAxisAlignment: isAction
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
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

class _DecisionCard extends StatelessWidget {
  final FlowNode node;

  const _DecisionCard({required this.node});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Center(
          child: Transform.rotate(
            angle: .785398,
            child: Container(
              width: node.size.width * .72,
              height: node.size.height * .72,
              decoration: BoxDecoration(
                color: Color.alphaBlend(
                  node.color.withValues(alpha: .045),
                  Colors.white,
                ),
                border: Border.all(color: node.color, width: 1.5),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: node.color.withValues(alpha: .08),
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
                      node.titulo,
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
        if (node.mostrarReferencia)
          Positioned(
            right: -14,
            top: node.size.height / 2 - 21,
            child: const _ReferenceBadge(),
          ),
      ],
    );
  }
}

class _ReferenceBadge extends StatelessWidget {
  const _ReferenceBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF7C8797)),
        boxShadow: const [BoxShadow(color: Color(0x18000000), blurRadius: 5)],
      ),
      child: const Icon(
        Icons.image_outlined,
        color: Color(0xFF263445),
        size: 21,
      ),
    );
  }
}
