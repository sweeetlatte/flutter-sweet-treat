import 'package:flutter/material.dart';
import 'package:sweettreat/config/const.dart';
import 'package:sweettreat/pages/index.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(backgroundColor: stPrimary),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
