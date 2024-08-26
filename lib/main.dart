import 'package:flutter/material.dart';
import 'package:flutter_api_using_bloc_1/login/ui/login_page.dart';
import 'package:flutter_api_using_bloc_1/navigation/route_generator.dart';
import 'package:flutter_api_using_bloc_1/navigation/routes_key.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(color: Color.fromARGB(255, 0, 150, 65))),
      initialRoute: Routes.screenLogin, // Set the initial route
      onGenerateRoute: RouteGenerator.generateRoute, // Use the R
    );
  }
}
