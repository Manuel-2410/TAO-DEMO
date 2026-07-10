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
              return s.nombre.toLowerCase().contains(
                    provider.busqueda.toLowerCase(),
                  );
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
                  Text(sintoma.descripcion),
                  const SizedBox(height: 20),
                  const Text(
                    "Cómo ayuda",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(sintoma.comoayuda),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
