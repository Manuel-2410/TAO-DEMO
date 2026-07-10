import 'package:flutter/material.dart';

import '../models/flow_node.dart';

class FlowDetailPanel extends StatelessWidget {
  final FlowNode node;
  final VoidCallback onClose;

  const FlowDetailPanel({super.key, required this.node, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 285,
      constraints: const BoxConstraints(maxHeight: 560),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE0E5EA)),
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: onClose,
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(Icons.close, size: 20),
                    ),
                  ),
                  Text(
                    node.titulo.isEmpty
                        ? (node.etiqueta ?? 'Detalle')
                        : node.titulo,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Descripción',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    node.descripcion,
                    style: const TextStyle(fontSize: 13, height: 1.45),
                  ),
                  if (node.objetivo case final objetivo?) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Objetivo: $objetivo',
                      style: const TextStyle(fontSize: 13, height: 1.45),
                    ),
                  ],
                  if (node.acciones.isNotEmpty) ...[
                    const SizedBox(height: 18),
                    const Text(
                      'Acciones sugeridas',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    ...node.acciones.map(
                      (action) => Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          '•  $action',
                          style: const TextStyle(fontSize: 13, height: 1.35),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onClose,
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF087A38),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                child: const Text('Cerrar'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
