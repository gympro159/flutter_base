import 'dart:convert';

import 'package:flutter_base/core/error/exceptions.dart';
import 'package:flutter_base/core/resources/resources.dart';
import 'package:flutter_base/core/utils/network_request.dart';
import 'package:flutter_base/features/list_base/data/models/photo_model.dart';
import 'package:flutter_base/injection_container.dart';

abstract class RemoteDatasource {
  Future<List<PhotoModel>> getListPhoto({int? offset});
}

class RemoteDatasourceImpl implements RemoteDatasource {
  @override
  Future<List<PhotoModel>> getListPhoto({int? offset}) async {
    final NetworkRequest networkRequest = singleton<NetworkRequest>();
    try {
      final response = await networkRequest.getRequest(
          url: "${urlTest}photos?page=${offset ?? ''}&limit=10");
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        List<PhotoModel> result =
            (data as List).map((item) => PhotoModel.fromJson(item)).toList();
        return result;
      } else {
        return handleException(data['message']);
      }
    } catch (e) {
      return handleException(e);
    }
  }
}
