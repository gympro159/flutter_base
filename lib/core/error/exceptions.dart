import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_base/core/functions/handle_language.dart';
import 'package:flutter_base/core/resources/resources.dart';
import 'package:flutter_base/features/common/models/response_data_success_model.dart';
import 'package:http/http.dart';

class ServerException implements Exception {}

class CacheException implements Exception {
  final String message;
  CacheException(this.message);
}

handleException(error) {
  if (error.runtimeType == SocketException ||
      error.runtimeType == ClientException) {
    throw Exception(trans(ERROR_CONNECTION_FAILED));
  } else if (error.runtimeType == NetworkImageLoadException) {
    throw Exception(trans(ERROR_LOAD_IMAGE));
  } else if (error.runtimeType == TimeoutException) {
    throw Exception(error.message);
  } else if (error.runtimeType == ResponseDataSuccessModel) {
    throw error;
  } else if (error.runtimeType == FormatException) {
    throw Exception(trans(ERROR_SYSTEM));
  } else
    // throw Exception(error.message != null ? error.message : error);
    throw Exception(error.message);
}
