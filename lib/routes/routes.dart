import 'package:flutter/material.dart';

import '../weather/views/home_page.dart';
import '../weather/views/search_page.dart';
import '../weather/views/settings_page.dart';

const String home = '/';
const String search = '/search';
const String settings = '/settings';

Route? generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case home:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case search:
      return MaterialPageRoute(builder: (context) => const SearchPage());
    case settings:
      return MaterialPageRoute(builder: (context) => const SettingsPage());
    default:
      return null;
  }
}
