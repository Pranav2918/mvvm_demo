import 'package:flutter/material.dart';

AppBar appHeaders(String title){
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text(title),
    elevation: 2.0,
  );
}
