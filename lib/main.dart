import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/navigation_provider.dart';
import 'providers/flow_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/home/main_screen.dart';
import 'theme/app_theme.dart';
import 'data/lead_flow_data.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (_) =>
              NavigationProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) =>
              ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FlowProvider(
            flowNodes,
          ),
        ),
      ],
  
      child: const TaoApp(),
    ),
  );
}


class TaoApp extends StatelessWidget {
  const TaoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TAO Acupuntura',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainScreen(),
    );
  }
}

