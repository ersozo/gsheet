import 'package:gsheets/gsheets.dart';
import 'package:deneme/sheets_column.dart';

class GoogleSheetsApi {
  // create credentials
  static const _credentials = r'''
      JSON File downloaded 
  ''';

  // set up & connect to the spreadsheet
  static const _spreadsheetId = 'here special ID should be written';

  static final _gsheets = GSheets(_credentials);
  // static Worksheet? _userSheet;
  static Worksheet? _userSheet;

  // initialise the spreadsheet!
  Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);

      _userSheet = await _getWorkSheet(spreadsheet, title: 'Sheet1');
      final firstRow = SheetsColumn.getColumns();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      // ignore: avoid_print
      print('Init Error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  // insert a new row (basically row is a list of maps: keys of a Map are column names.)
  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_userSheet == null) return;
    _userSheet!.values.map.appendRows(rowList);
  }
}
