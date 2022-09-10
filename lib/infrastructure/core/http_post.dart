import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class Networking {
  Future<Either<String, dynamic>> networking(
      String uRL, Map<String, dynamic> body) async {
    try {
      final url = Uri.parse(uRL);
      http.Response response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        var decodeData = jsonDecode(response.body);
        return right(decodeData);
      } else {
        return left(
            "An unexpected error occurred while signing in. Please try again");
      }
    } catch (e) {
      return left(
          "An unexpected error occurred while signing in. Please try again");
      print(e);
    }
  }
}
