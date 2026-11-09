import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';

Future<void> downloadResumeImpl() async {
  final byteData =
  await rootBundle.load('assets/mohd_usama_resume.pdf');

  final bytes = byteData.buffer.asUint8List();

  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/mohd_usama_resume.pdf');

  await file.writeAsBytes(bytes, flush: true);

  await OpenFilex.open(file.path);
}
