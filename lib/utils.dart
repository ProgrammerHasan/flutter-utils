library config.globals;
import 'dart:ui';
import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// static strings
class Strings {
  static final myString="";
}

// custom color
class HexColor{
  static int getHexToInt(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }
}

//random colors2
final List<Color> listColors = [
  Colors.blueGrey,
  Colors.deepOrange,
  Colors.black,
  Colors.cyan,
  Colors.lightGreen,
  Colors.teal,
];

Color randomGenerator() {
  return listColors[new Random().nextInt(6)];
}

// english number to bangle
String enNumToBn(int number) {
  return number.toString()
      .replaceAll('0', '০')
      .replaceAll('1', '১')
      .replaceAll('2', '২')
      .replaceAll('3', '৩')
      .replaceAll('4', '৪')
      .replaceAll('5', '৫')
      .replaceAll('6', '৬')
      .replaceAll('7', '৭')
      .replaceAll('8', '৮')
      .replaceAll('9', '৯');
}

// english number to arabic
String enNumToAr(int number) {
  return number.toString()
      .replaceAll('0', '۰')
      .replaceAll('1', '۱')
      .replaceAll('2', '۲')
      .replaceAll('3', '۳')
      .replaceAll('4', '۴')
      .replaceAll('5', '۵')
      .replaceAll('6', '۶')
      .replaceAll('7', '۷')
      .replaceAll('8', '۸')
      .replaceAll('9', '۹');
}

// Check internet connection
var checkInternetStatus;
checkInternetConnect() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      checkInternetStatus = true;
    } else {
      checkInternetStatus = false;
    }
  } on SocketException catch(_) {
    checkInternetStatus = false;
  }
  return checkInternetStatus;
}

// RegExp
String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(
      r"<[^>]*>|1|2|3|4|5",
      multiLine: true,
      caseSensitive: true
  );

  return htmlText.replaceAll(exp, '');
}