import 'dart:convert';

import 'package:dio/dio.dart';

handleCommonError(error) {
  if (error is DioError) {
    final data = error.response?.data is String ? jsonDecode(error.response.data) : error.response?.data;
    if (data == null) {
      return 'You have no network connectivity. Please check your network settings';
    }
    final Map<String, dynamic> errors = data['errors'];
    if (errors != null) {
      return errors.values.toList()[0][0];
    }
    return error.response != null ? (error.response?.data['message'] ?? 'Unknown System Error!') : 'Please check your Internet Connection!';
  }
  //throw is main
  return error;
}