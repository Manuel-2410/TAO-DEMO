import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/sintomas_data.dart';
import '../../models/sintoma.dart';
import '../../providers/sintomas_provider.dart';
import '../../widgets/sintoma_card.dart';
import '../../widgets/category_chip.dart';

class SintomasScreen extends StatelessWidget {
  const SintomasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SintomasProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("SÍNTOMAS"),
        ),
        body: Consumer<SintomasProvider>(
          builder: (context, provider, child) {
            final filtrados = sintomas.where((s) {
              final coincideBusqueda = s.nombre
                  .toLowerCase()
                  .contains(provider.busqueda.toLowerCase());

              final coincideCategoria =
                  provider.categoria == "Todas" ||
                  s.categoria == provider.categoria;

              return coincideBusqueda && coincideCategoria;
            }).toList();

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Buscar síntoma",
                    ),
                    onChanged: provider.buscar,
                  ),
                ),

                /// 🔹 Bloque de categorías debajo del buscador
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryChip(
                        text: "Todas",
                        selected: provider.categoria == "Todas",
                        onTap: () {
                          provider.cambiarCategoria("Todas");
                        },
                      ),
                      const SizedBox(width: 10),
                      CategoryChip(
                        text: "Dolor",
                        selected: provider.categoria == "Dolor",
                        onTap: () {
                          provider.cambiarCategoria("Dolor");
                        },
                      ),
                      const SizedBox(width: 10),
                      CategoryChip(
                        text: "Emocional",
                        selected: provider.categoria == "Emocional",
                        onTap: () {
                          provider.cambiarCategoria("Emocional");
                        },
                      ),
                      const SizedBox(width: 10),
                      CategoryChip(
                        text: "Digestivo",
                        selected: provider.categoria == "Digestivo",
                        onTap: () {
                          provider.cambiarCategoria("Digestivo");
                        },
                      ),
                      const SizedBox(width: 10),
                      CategoryChip(
                        text: "Neurológico",
                        selected: provider.categoria == "Neurológico",
                        onTap: () {
                          provider.cambiarCategoria("Neurológico");
                        },
                      ),
                      const SizedBox(width: 10),
                      CategoryChip(
                        text: "Reproductivo",
                        selected: provider.categoria == "Reproductivo",
                        onTap: () {
                          provider.cambiarCategoria("Reproductivo");
                        },
                      ),
                      const SizedBox(width: 10),
                      CategoryChip(
                        text: "Metabolismo",
                        selected: provider.categoria == "Metabolismo",
                        onTap: () {
                          provider.cambiarCategoria("Metabolismo");
                        },
                      ),
                      const SizedBox(width: 10),
                      CategoryChip(
                        text: "Clínico",
                        selected: provider.categoria == "Clínico",
                        onTap: () {
                          provider.cambiarCategoria("Clínico");
                        },
                      ),
                      
                    ],
                  ),
                ),

                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: filtrados.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: .8,
                    ),
                    itemBuilder: (context, index) {
                      final Sintoma item = filtrados[index];
                      return SintomaCard(
                        sintoma: item,
                        onTap: () {
                          provider.seleccionar(item);
                          mostrarDetalle(context, item);
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void mostrarDetalle(BuildContext context, Sintoma sintoma) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(sintoma.nombre),
            const SizedBox(height: 8),
            Chip(
              label: Text(sintoma.categoria),
            ),
          ],
        ),
        content: SizedBox(
          width: 500,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  sintoma.descripcion,
                  style: const TextStyle(height: 1.45),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Cómo ayuda",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  sintoma.comoayuda,
                  style: const TextStyle(height: 1.45),
                ),

                const SizedBox(height: 24),

                const Divider(),

                const SizedBox(height: 18),

                const Text(
                  "Método SPIN",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                _buildSpinCard(
                  color: const Color(0xFF1E88E5),
                  letra: "S",
                  titulo: "Situación",
                  texto: sintoma.situacion,
                ),

                const SizedBox(height: 12),

                _buildSpinCard(
                  color: const Color(0xFFF9A825),
                  letra: "P",
                  titulo: "Problema",
                  texto: sintoma.problema,
                ),

                const SizedBox(height: 12),

                _buildSpinCard(
                  color: const Color(0xFFE53935),
                  letra: "I",
                  titulo: "Implicación",
                  texto: sintoma.implicacion,
                ),

                const SizedBox(height: 12),

                _buildSpinCard(
                  color: const Color(0xFF43A047),
                  letra: "N",
                  titulo: "Necesidad",
                  texto: sintoma.necesidad,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

    Widget _buildSpinCard({
    required Color color,
    required String letra,
    required String titulo,
    required String texto,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: .35),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              letra,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  texto,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
