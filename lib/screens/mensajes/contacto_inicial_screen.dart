import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/contacto_inicial_data.dart';
import '../../providers/mensajes_provider.dart';
import '../../widgets/message_card.dart';
import '../../widgets/message_bottom_sheet.dart';


class ContactoInicialScreen extends StatelessWidget {
  const ContactoInicialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MensajesProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CONTACTO INICIAL"),
        ),
        body: Consumer<MensajesProvider>(
          builder: (context, provider, child) {
            final filtrados = mensajesContactoInicial.where((m) {
              return m.titulo.toLowerCase().contains(
                    provider.busqueda.toLowerCase(),
                  );
            }).toList();

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Buscar mensaje",
                    ),
                    onChanged: provider.buscar,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: filtrados.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 2.5,
                    ),
                    itemBuilder: (_, index) {
                      final item = filtrados[index];
                      return MessageCard(
                        titulo: item.titulo,
                        preview: item.mensaje,
                        onTap: () {
                          MessageBottomSheet.show(
                            context,
                            titulo: item.titulo,
                            mensaje: item.mensaje,
                          );
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
}
