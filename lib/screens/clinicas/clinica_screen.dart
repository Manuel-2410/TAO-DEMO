import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/tratamiento.dart';
import '../../providers/clinica_provider.dart';
import '../../widgets/tratamiento_card.dart';
import '../../widgets/tratamiento_detail_card.dart';

class ClinicaScreen extends StatefulWidget {
    final String titulo;
    final List<Tratamiento> tratamientos;

    const ClinicaScreen({
      super.key,
      required this.titulo,
      required this.tratamientos,
    });

    @override
    State<ClinicaScreen> createState() => _ClinicaScreenState();
  }

  class _ClinicaScreenState extends State<ClinicaScreen> {

    final ScrollController scrollController = ScrollController();

    @override
    void dispose() {
      scrollController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ClinicaProvider(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text(widget.titulo),
        ),
        body: Consumer<ClinicaProvider>(
          builder: (context, provider, child) {
            final filtrados = widget.tratamientos.where((t) {
              return t.titulo.toLowerCase().contains(
                    provider.busqueda.toLowerCase(),
                  );
            }).toList();

            return SingleChildScrollView(
              controller: scrollController,
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

                        Future.delayed(const Duration(milliseconds: 100), () {

                          scrollController.animateTo(

                            scrollController.position.maxScrollExtent,

                            duration: const Duration(milliseconds: 700),

                            curve: Curves.easeInOut,

                          );

                        });

                      },
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  AnimatedSwitcher(

                duration: const Duration(milliseconds: 350),

                transitionBuilder: (child, animation) {

                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween(
                        begin: const Offset(0, .15),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  );

                },

                child: provider.seleccionado == null

                    ? const SizedBox()

                    : TratamientoDetailCard(
                        key: ValueKey(provider.seleccionado!.titulo),
                        tratamiento: provider.seleccionado!,
                      ),

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
