import 'package:flutter/material.dart';
import 'package:mvvm_demo/src/config/constants.dart';
import 'package:mvvm_demo/src/config/routes.dart';
import 'package:mvvm_demo/src/config/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushNamed(AppRoutes.loginScreen, arguments: {
        "name":"Pranav",
        "dob":"18th December"
      });
    }).onError((error, stackTrace) {
      //TODO: Handle Error
    });
    super.initState();
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(child: Image.network(AppImages.splashImage, height: 250.0, width: 250.0)),
    );
  }
}