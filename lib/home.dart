import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'google_sheets_api.dart';
import 'sheets_column.dart';

class Home extends StatefulWidget {
  // Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String result = '';

  final List<TextEditingController> _myController =
      List.generate(2, (i) => TextEditingController());

  get formatter => NumberFormat('#,000');

  // final myController_1 = TextEditingController();
  // final myController_2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'cALC',
            style: TextStyle(
              color: Colors.red,
              fontSize: 50.0,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.red,
                  width: 3.0,
                ),
              ),
              child: Center(
                child: Text(
                  result.toString(),
                  style: const TextStyle(
                    fontSize: 35.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // NUMBER 1
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Number 1',
                    ),
                    controller: _myController[0],
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                // NUMBER 2
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Number 2',
                    ),
                    controller: _myController[1],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(
                      () {
                        var numb_1 = double.parse(_myController[0].text);
                        var numb_2 = double.parse(_myController[1].text);
                        print(_myController[0].text);
                        result =
                            (formatter.format((numb_1 * numb_2))).toString();
                      },
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Text(
                        "calc",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50.0,
                ),
                InkWell(
                  onTap: () {
                    setState(
                      () {
                        result = '0';
                        _myController[0].text = '';
                        _myController[1].text = '';
                      },
                    );
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Text(
                        "C",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
