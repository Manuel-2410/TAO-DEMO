import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/tratamiento.dart';
import '../../providers/clinica_provider.dart';
import '../../widgets/tratamiento_card.dart';
import '../../widgets/tratamiento_detail_card.dart';

class C5Y10Screen extends StatelessWidget {
  final String titulo;
  final List<Tratamiento> tratamientos;

  const C5Y10Screen({
    super.key,
    required this.titulo,
    required this.tratamientos,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ClinicaProvider(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 134, 5),
        appBar: AppBar(
          title: Text(titulo),
        ),
        body: Consumer<ClinicaProvider>(
          builder: (context, provider, child) {
            final filtrados = tratamientos.where((t) {
              return t.titulo.toLowerCase().contains(
                    provider.busqueda.toLowerCase(),
                  );
            }).toList();

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Buscar tratamiento",
                    ),
                    onChanged: provider.buscar,
                  ),
                  const SizedBox(height: 25),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filtrados.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: .9,
                    ),
                    itemBuilder: (context, index) {
                      final item = filtrados[index];
                      return TratamientoCard(
                        tratamiento: item,
                        onTap: () {
                          provider.seleccionar(item);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  if (provider.seleccionado != null)
                    TratamientoDetailCard(
                      tratamiento: provider.seleccionado!,
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
