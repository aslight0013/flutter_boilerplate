import 'dart:async';
import 'dart:convert';

import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'exceptions/network_exceptions.dart';

@Singleton()
class RestClient {
  // instantiate json decoder for json serialization
  final JsonDecoder _decoder = JsonDecoder();

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(String path) {
    return http
        .get(Uri.https(Endpoints.baseUrl, path))
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw NetworkException(
            message: "Error fetching data from server", statusCode: statusCode);
      }

      print(res);
      return _decoder.convert(res);
    });
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(String path,
      {Map<String, String>? headers, body, encoding}) {
    return http
        .post(
      Uri.https(Endpoints.baseUrl, path),
      body: body,
      headers: headers,
      encoding: encoding,
    )
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw NetworkException(
            message: "Error fetching data from server", statusCode: statusCode);
      }
      return _decoder.convert(res);
    });
  }

  // Put:----------------------------------------------------------------------
  Future<dynamic> put(String path,
      {Map<String, String>? headers, body, encoding}) {
    return http
        .put(
      Uri.https(Endpoints.baseUrl, path),
      body: body,
      headers: headers,
      encoding: encoding,
    )
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw NetworkException(
            message: "Error fetching data from server", statusCode: statusCode);
      }
      return _decoder.convert(res);
    });
  }

  // Delete:----------------------------------------------------------------------
  Future<dynamic> delete(String path,
      {Map<String, String>? headers, body, encoding}) {
    return http
        .delete(
      Uri.https(Endpoints.baseUrl, path),
      body: body,
      headers: headers,
      encoding: encoding,
    )
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw NetworkException(
            message: "Error fetching data from server", statusCode: statusCode);
      }
      return _decoder.convert(res);
    });
  }
}
