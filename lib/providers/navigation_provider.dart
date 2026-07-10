import 'package:flutter/material.dart';

import '../models/app_section.dart';

class NavigationProvider
    extends ChangeNotifier {

  AppSection current =
      AppSection.home;

  void changeSection(
    AppSection section,
  ) {

    current = section;

    notifyListeners();
  }
}