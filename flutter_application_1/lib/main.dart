import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/appdata.dart';
import 'package:flutter_application_2/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => GameData())],
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RouteManager.homePage,
            onGenerateRoute: RouteManager.generateRoute,
          );
        });
  }
}
