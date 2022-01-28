import 'package:flutter/material.dart';
import 'google_sheets_api.dart';
import 'package:deneme/sheets_column.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final List<TextEditingController> _myController =
      List.generate(1, (i) => TextEditingController());
  String? info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/vestel-logo.png'),
              const SizedBox(
                width: 2.0,
              ),
              const Text(
                'STOK TAKİP',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                '${_myController[0].text} $info',
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Container(
              width: 290.0,
              height: 50.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 3.0,
                ),
                color: Colors.amber[200],
                borderRadius: BorderRadius.circular(
                  15.0,
                ),
              ),
              child: Center(
                child: TextField(
                  controller: _myController[0],
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    width: 140.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Center(
                      child: Text(
                        'E K L E',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  onTap: () async {
                    final feedback = {
                      SheetsColumn.code: _myController[0].text.trim(),
                      SheetsColumn.quantity: 1,
                    };
                    await GoogleSheetsApi.insert([feedback]);

                    setState(
                      () {
                        _myController[0];
                        info = 'eklendi.';
                      },
                    );
                  },
                ),
                const SizedBox(
                  width: 10.0,
                ),
                GestureDetector(
                  child: Container(
                    width: 140.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Ç I K A R T',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  onTap: () async {
                    final feedback = {
                      SheetsColumn.code: _myController[0].text.trim(),
                      SheetsColumn.quantity: -1,
                    };
                    await GoogleSheetsApi.insert([feedback]);
                    setState(
                      () {
                        _myController[0];
                        info = 'çıkartıldı.';
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
