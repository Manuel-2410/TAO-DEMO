import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_section.dart';
import '../providers/navigation_provider.dart';

class AppSidebar extends StatelessWidget {

  const AppSidebar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 250,

      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,

          colors: [
            Color(0xFF14371D),
            Color(0xFF0B2411),
          ],
        ),
      ),

      child: Column(
        children: [

          const SizedBox(height: 50),

          const Text(
            "TAO",

            style: TextStyle(
              color: Colors.white,
              fontSize: 52,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const SizedBox(height: 40),

          menu(
            context,
            Icons.home,
            "Inicio",
            AppSection.home,
          ),

          menu(
            context,
            Icons.local_hospital,
            "Zona Río",
            AppSection.clinicaZonaRio,
          ),

          menu(
            context,
            Icons.apartment,
            "5 y 10",
            AppSection.clinicaCincoDiez,
          ),

          menu(
            context,
            Icons.message,
            "Contacto",
            AppSection.contacto,
          ),

          menu(
            context,
            Icons.chat,
            "Seguimiento",
            AppSection.seguimiento,
          ),

          menu(
            context,
            Icons.account_tree,
            "Ventas",
            AppSection.procesoVentas,
          ),

          menu(
            context,
            Icons.psychology,
            "Síntomas",
            AppSection.sintomas,
          ),

          menu(
            context,
            Icons.play_circle,
            "Videos",
            AppSection.videos,
          ),
        ],
      ),
    );
  }

  Widget menu(
    BuildContext context,
    IconData icon,
    String title,
    AppSection section,
  ) {
    final selected =
        context.watch<NavigationProvider>().current == section;

    return ListTile(
      selected: selected,
      selectedTileColor: Colors.white.withValues(
        alpha: 0.12,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onTap: () {
        context.read<NavigationProvider>().changeSection(
              section,
            );
      },
      leading: Icon(
        icon,
        color: Colors.white,
      ),

      title: Text(
        title,

        style:
            const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
