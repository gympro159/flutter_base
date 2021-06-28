import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_base/core/functions/handle_language.dart';
import 'package:flutter_base/core/resources/string_lang.dart';
import 'package:flutter_base/injection_container.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

abstract class NetworkRequest {
  Future<dynamic> getRequest({required String url, String service});
  Future<dynamic> putRequest(
      {required String url, required String body, String service});
  Future<dynamic> postRequest(
      {required String url, String body, String service});
  Future<dynamic> deleteRequest({required String url, String service});
  void closeRequest();
}

typedef Future<http.Response> _RequestMethodChooser(String token);

class NetworkRequestImpl implements NetworkRequest {
  final http.Client client;
  final SharedPreferences sharedPreferences;
  NetworkRequestImpl({required this.client, required this.sharedPreferences});

  @override
  Future<http.Response> getRequest(
      {required String url, String? service}) async {
    return await _requestUrl((token) {
      return client.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept-Language': getLangCode(),
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      ).timeout(
        Duration(seconds: 20),
        onTimeout: () {
          throw TimeoutException(trans(LABEL_TRY_AGAIN));
        },
      );
    });
  }

  @override
  Future<http.Response> putRequest(
      {required String url, required String body, String? service}) async {
    return await _requestUrl((token) {
      return client.put(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept-Language': getLangCode(),
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
          body: body);
    }).timeout(
      Duration(seconds: 20),
      onTimeout: () {
        throw TimeoutException(trans(LABEL_TRY_AGAIN));
      },
    );
  }

  @override
  Future<http.Response> postRequest(
      {required String url, String? body, String? service}) async {
    return await _requestUrl((token) {
      return client
          .post(Uri.parse(url),
              headers: {
                'Content-Type': 'application/json; charset=UTF-8',
                'Accept-Language': getLangCode(),
                HttpHeaders.authorizationHeader: 'Bearer $token',
              },
              body: body)
          .timeout(
        Duration(seconds: 20),
        onTimeout: () {
          throw TimeoutException(trans(LABEL_TRY_AGAIN));
        },
      );
    });
  }

  @override
  Future<http.Response> deleteRequest(
      {required String url, String? service}) async {
    return await _requestUrl((token) {
      return client.delete(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept-Language': getLangCode(),
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      ).timeout(
        Duration(seconds: 20),
        onTimeout: () {
          throw TimeoutException(trans(LABEL_TRY_AGAIN));
        },
      );
    });
  }

  Future<http.Response> _requestUrl(
    _RequestMethodChooser requestMethod,
  ) async {
    try {
      final token = sharedPreferences.getString('token');
      final res = await requestMethod(token!);
      return res;
    } catch (error) {
      throw error;
    }
  }

  void closeRequest() {
    return client.close();
  }
}
