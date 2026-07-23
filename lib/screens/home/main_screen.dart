import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';
import '../../widgets/app_sidebar.dart';
import '../../widgets/content_area.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const AppSidebar(),

          Expanded(child: const ContentArea()),
        ],
      ),
      floatingActionButton: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => FloatingActionButton.small(
          heroTag: 'global-theme-toggle',
          onPressed: themeProvider.toggle,
          tooltip: themeProvider.darkMode
              ? 'Cambiar a modo claro'
              : 'Cambiar a modo oscuro',
          child: Icon(
            themeProvider.darkMode
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined,
          ),
        ),
      ),
    );
  }
}
