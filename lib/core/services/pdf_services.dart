import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PDFService {
  final String url;
  final BuildContext context;

  PDFService({
    @required this.context,
    @required this.url,
  });

  Future<File> createFileOfPdfUrl() async {
    print("Start download file from internet!");
    try {
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      return file;
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }
  }

  showPdf() async {
    try {
      // File file = await createFileOfPdfUrl();
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => PDFScreen(path: file.path),
      //   ),
      // );
    } catch (e) {
      throw e;
    }
  }
}
