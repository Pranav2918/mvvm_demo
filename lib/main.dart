import 'package:flutter/material.dart';
import 'package:mvvm_demo/src/config/route_handler.dart';
import 'package:mvvm_demo/src/config/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splashScreen,
      onGenerateRoute: AppRouteHandler.onGenerateRoute,
    );
  }
}
