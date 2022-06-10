import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/game_page.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import '../models/draw.dart';

class RouteManager {
  static const String homePage = '/';
  static const String secondPage = '/Second';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
      case secondPage:
        return MaterialPageRoute(
          builder: (context) => SecondPage(
            index1: DrawCard.draw(),
            index2: DrawCard.draw(),
          ),
        );
      default:
        throw FormatException('Route Not Found');
    }
  }
}
