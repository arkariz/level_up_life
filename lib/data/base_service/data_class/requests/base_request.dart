// ignore_for_file: avoid_dynamic_calls, implementation_imports

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

import 'package:level_up_life/data/base_service/utils/enums.dart';
import 'package:level_up_life/data/base_service/utils/typedefs.dart';
part 'post_request.dart';
part 'get_request.dart';
part 'put_request.dart';
part 'patch_request.dart';
part 'delete_request.dart';
part 'multipart_request.dart';

class BaseRequest {

  Future<dynamic> request({
    Dio? dio,
    required Method method,
    required JSON headers,
    required String url,
    required JSON data,
    List<JSON>? listData,
    bool isReturnJson = false,
    String filePath = '',
    String field = '',
    List<int> fileBytes = const [],
    ContentType contentType = ContentType.json,
  }) async {
    return handleDeasyRequest(
      dio: dio,
      method: method,
      url: url,
      header: headers,
      data: data,
      listData: listData,
      isReturnJson: isReturnJson,
      filePath: filePath,
      field: field,
      fileBytes: fileBytes,
      contentType: contentType
    );
  }

  final Map<
      Method,
      Future<dynamic> Function(
          Dio dio,
          String url,
          JSON headers,
          JSON data,
          List<JSON>? listData,
          bool isReturnJson,
          String filePath,
          String field,
          List<int> fileBytes,
          ContentType contentType
          )> _enumHandlers = {
    Method.POST: (Dio dio,
        String url,
        JSON headers,
        JSON data,
        List<JSON>? listData,
        bool isReturnJson,
        String filePath,
        String field,
        List<int> fileBytes,
        ContentType contentType
        ) async {
      return PostRequest(
        dio,
        url: url,
        headers: headers,
        data: data,
        listData: listData,
        isReturnJson: isReturnJson,
      );
    },
    Method.GET: (Dio dio,
        String url,
        JSON headers,
        JSON data,
        List<JSON>? listData,
        bool isReturnJson,
        String filePath,
        String field,
        List<int> fileBytes,
        ContentType contentType
        ) async {
      return GetRequest(dio,
          url: url, headers: headers, data: data, isReturnJson: isReturnJson);
    },
    Method.PUT: (Dio dio,
        String url,
        JSON headers,
        JSON data,
        List<JSON>? listData,
        bool isReturnJson,
        String filePath,
        String field,
        List<int> fileBytes,
        ContentType contentType
        ) async {
      return PutRequest(dio, url: url, headers: headers, data: data);
    },
    Method.DELETE: (Dio dio,
        String url,
        JSON headers,
        JSON data,
        List<JSON>? listData,
        bool isReturnJson,
        String filePath,
        String field,
        List<int> fileBytes,
        ContentType contentType
        ) async {
      return DeleteRequest(dio, url: url, headers: headers, data: data);
    },
    Method.PATCH: (Dio dio,
        String url,
        JSON headers,
        JSON data,
        List<JSON>? listData,
        bool isReturnJson,
        String filePath,
        String field,
        List<int> fileBytes,
        ContentType contentType
        ) async {
      return PatchRequest(dio, url: url, headers: headers, data: data);
    },
    Method.MULTIPART: (Dio dio,
        String url,
        JSON headers,
        JSON data,
        List<JSON>? listData,
        bool isReturnJson,
        String filePath,
        String field,
        List<int> fileBytes,
        ContentType contentType
        ) async {
      return MultipartRequest(dio,
          url: url,
          headers: headers,
          data: data,
          isReturnJson: isReturnJson,
          field: field,
          filePath: filePath,
          fileBytes: fileBytes,
          contentType: contentType
          );
    },
  };

  Future<dynamic> handleDeasyRequest({
    required Method method,
    required Dio? dio,
    required String url,
    required JSON header,
    JSON? data,
    List<JSON>? listData,
    bool isReturnJson = true,
    String filePath = '',
    String field = '',
    List<int> fileBytes = const [],
    ContentType contentType = ContentType.image,
  }) async {
    final handler = _enumHandlers[method];

    if (handler == null) {
      throw ArgumentError('Invalid method: $method');
    }

    return await handler(dio!, url, header, data ?? {}, listData, isReturnJson, filePath, field, fileBytes, contentType);
  }
}
