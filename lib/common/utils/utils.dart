// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class Utils {
  static int statusCode = 0;

  static DateTime parseTime(String dateString) {
    // Split the string into date and time parts
    List<String> parts = dateString.split(' ');
    String datePart = parts[0]; // "24.11.2023"
    String timePart = parts[1]; // "232000"

    // Parse the date part
    List<String> dateParts = datePart.split('.');
    int day = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int year = int.parse(dateParts[2]);

    // Parse the time part
    int hour = int.parse(timePart.substring(0, 2));
    int minute = int.parse(timePart.substring(2, 4));
    int second = int.parse(timePart.substring(4, 6));

    // Create the DateTime object
    DateTime dateTime = DateTime(year, month, day, hour, minute, second);

    return dateTime;
  }

  /// yyyy-MM-dd hh:mm:ss
  static final dateFormatter_yyyy_MM_dd_hh_mm_ss = DateFormat('yyyy-MM-dd hh:mm:ss');

  /// yyyy-MM-dd
  static final dateFormatter_yyyy_MM_dd = DateFormat('yyyy-MM-dd');

  static Future<void> deleteFile(String path) async {
    try {
      final file = File(path);
      await file.delete();
    } catch (err) {
      return;
    }
  }

  static Future<Uint8List?> getBase64PhotoFromFilePath(String path) async {
    try {
      final file = File(path);
      final contents = await file.readAsString();
      return compute((m) => base64Decode(m), contents);
    } catch (err) {
      return null;
    }
  }

  static Future<String?> saveBytesAsBase64Photo(Uint8List imageBytes, String base64Path) async {
    try {
      final base64Photo = await compute((m) => base64Encode(m), imageBytes);
      final base64File = File(base64Path);
      await base64File.writeAsString(base64Photo);

      return base64Path;
    } catch (err) {
      return null;
    }
  }
}
