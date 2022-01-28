import 'package:gsheets/gsheets.dart';
import 'package:deneme/sheets_column.dart';

class GoogleSheetsApi {
  // create credentials
  static const _credentials = r'''
  
    {
  "type": "service_account",
  "project_id": "stok-339412",
  "private_key_id": "9e348bd4776819e48c0d490c4d3e93768f52ee2e",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDMGt1+JMdRol9o\nzUWzy+k4PypfosvBycgYMeISg3p49uG96ZTF7OxBP6ZWR+2+R1B9uZi4h8lhii4s\nXmmhHV8r592IahO0JMLPWHd6y1lzo4/oOMFm71YkIDC/EUmYAt3SJR9Xj+KchoGd\ntdnWtNYmj2n7ojNjgHIpS5MbVS7H+CMI1Pv1GoMiSoAQ1NaVhw/CgL5Yj63HI58N\nqn4Dm1HY8ATMbIlBLJvkKj5rqcpd9vI1463OsHJnjM+OvXCChSlAR6dYCqOB0fMp\nJwOoMQgusfGw/+CwhkO4TL5HRzfQxSP8C6fcHEtG699XlxPjzv+wlyTTakOSnSZ5\nBsJp/V1lAgMBAAECggEAM0ZMfnQe3pM8BMgMyq5fWJIFwyDSr0xRyEI/2QbOrbTX\n4S3dAhwS/hFPaD2JrFOeFPebNkBmhup/zwWo46DNV+pX7P05FfhmOFCxM1gCkNp2\nPJCFhaZ6rXioxldBdb7CmxhYV1b+RvRDe6tDnnyvj+BXb6+/2S9bfqRNwIAV0IZC\nrpD+OKZLJgchaoANs13s5R9Mz5n5/LpongZbS+W/yiZrcry/pWZub3lHdeltAKd6\ntgo0DUSBWFsrzu2o2lxfFHNWKyL6d1iQls2dp2prYZoAxILMq12cdB/CcQySJb34\nzC8ObMtB24/HhNFbGLI838jGxtuag4jEfK8ajJItwQKBgQD0AHsvkLaAYCJ1UF6H\nbeY82SfpeNDtGV3Luzs20bIWYWbUkU3wle1dh8XJzWd4QJySARvr8/059CdVtFh/\ng1elpMqR2AvEvkJS54d1rKVWG7u0QZHKZqpX3zkOfZgVWmbc5lH4FFh8VrihGhkF\nunMM+cZscY1nXCgciPSg3q+p8wKBgQDWJChXEHrXB4g0xWo9cBe9OEVlb2/8x9Os\noREXpFYEvFpUaUQgOTV7OLI3rauC9/cuvIpmL2cdIhkIv2DW/5gYnfBa708kA7NT\n45xASIsnkARiR1H0uyUw+7eIt0oT/zLDUc8qfvgS/9kijbZIOJOW4YS9HWjnq5WB\nRRl7bEGZRwKBgQC5pVAUfY9Nl1dAWNjDQ8ukSjjCu0iCzQT/SEIiUGOmAY+idbeO\nMBQ8UFwdUWnDJa26rJtY5/eny2rOG3wl8IGUJxB07KLvmy6NM1luH+Bf5pPm7uiE\nzZ4XY2Be9RHsVS7kLVz6WkiEudqZwGh/Yj+9BKGCytaiaIygQVeWujd/HwKBgQDV\nKTbyu9fbtoayKRWBRNSMqbgCqfQrB2tA+y/9fbuWiTvNrN+AyBHhr+VPoVQKUfU/\nE7Uc1PDqwidzWrX2LoVjc8xvaKo56mkXB4phPxUt86E5h08gsy3pXZgrwnA+CZmp\nbgUvgyZEG2Q0jiY2LANWfPTaH61ud5GiFXuxLWj7PwKBgFRPZwDteBYT8MjiGcPy\nyumtPlF0nmSJLYv6oJDvrNHKgTvwTQzLfDYpeQAzNPB9lyNZA6yKto0qntHVOB3d\n0BGaw3KcJPYkno2Z5xjY5QI6QYyCirXLlrT8GJNthFx3FVQLEx7OvPIZ9bQKGyNh\n4BxDgNJFqLNEIwKDNLaNdqla\n-----END PRIVATE KEY-----\n",
  "client_email": "boyahane@stok-339412.iam.gserviceaccount.com",
  "client_id": "105957020378846370299",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/boyahane%40stok-339412.iam.gserviceaccount.com"
}

  ''';

  // set up & connect to the spreadsheet
  static const _spreadsheetId = '1AdF2XSyPxCi4Hd4D3NY9Bt7h2a1lU65bdmSZKN0WjQk';
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
      print(e);
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

  static Future insert(List<Map<String, dynamic>> rowList) async {
    _userSheet!.values.map.appendRows(rowList);
  }
}
