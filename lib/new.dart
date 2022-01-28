import 'package:intl/intl.dart';

void main(List<String> args) {
  int weight = 6124756545;
  var formatter = NumberFormat('#,##,000');

  var x1 = weight.truncateToDouble();
  var x2 = weight.toDouble();

  // print(x1);
  // print(x2);
  // print(x1 == x2);
  print(formatter.format(weight));
}
