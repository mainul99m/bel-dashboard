
import 'dart:convert';
import 'dart:typed_data';

import 'package:csv/csv.dart';
import 'package:universal_html/html.dart';

class DataService{
  static void saveCsv(List<List<dynamic>> data, String filename) {

    try {
      String csv = const ListToCsvConverter().convert(data); // Now this will work!
      Uint8List bytes = utf8.encode(csv);
      final blob = Blob([bytes], 'text/csv;charset=utf-8');
      final url = Url.createObjectUrlFromBlob(blob);
      final anchor = AnchorElement(href: url)
        ..setAttribute('download', filename)
        ..style.display = 'none';

      if (document.body != null) {
        document.body!.children.add(anchor);
        anchor.click();
        document.body!.children.remove(anchor);
        Url.revokeObjectUrl(url);
      } else {
        print('Error: document.body is null. Cannot initiate download.');
      }
    } catch (e) {
      print('Error during CSV download: $e');
    }
  }
}