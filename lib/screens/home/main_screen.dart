import 'package:flutter/material.dart';

import '../../widgets/app_sidebar.dart';
import '../../widgets/content_area.dart';

class MainScreen
    extends StatelessWidget {

  const MainScreen({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {

    return Scaffold(
      body: Row(
        children: [

          const AppSidebar(),

          Expanded(
            child:
                const ContentArea(),
          ),
        ],
      ),
    );
  }
}