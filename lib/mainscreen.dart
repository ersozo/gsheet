import 'package:flutter/material.dart';

import 'google_sheets_api.dart';
import 'sheets_column.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final List<TextEditingController> _myController =
      List.generate(2, (i) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100.0,
              child: Text('kkjklj'),
            ),
            const SizedBox(
              height: 100.0,
              child: Text('lklkl'),
            ),
            GestureDetector(
              child: Container(
                width: 50.0,
                height: 50.0,
                color: Colors.amber,
              ),
              onTap: () async {
                final feedback = {
                  SheetsColumn.code: _myController[0].text.trim(),
                  SheetsColumn.quantity: _myController[1].text.trim(),
                };
                await GoogleSheetsApi.insert([feedback]);
              },
            )
          ],
        ),
      ),
    );
  }
}
