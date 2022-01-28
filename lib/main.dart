import 'package:deneme/second_screen.dart';
import 'package:flutter/material.dart';
// import 'home.dart';
import 'google_sheets_api.dart';
// import 'first_screen.dart';
import 'second_screen.dart';

void main() async {
  await GoogleSheetsApi().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark(),
      home: Second(),
    );
  }
}
