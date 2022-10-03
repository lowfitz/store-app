import 'dart:developer';

import 'package:storeapp/Constant/myLoading.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static late Dio mydio;

   init() {
    mydio = Dio(
      BaseOptions(
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
          },
          baseUrl: 'https://pos.mobile.reeras.site/',
          receiveDataWhenStatusError: true,
          connectTimeout: 30000,
          receiveTimeout: 30000,
          sendTimeout: 30000),
    )..interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
        ),
      );
  }

  static Future<Response?> postData(
    BuildContext context, {
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    String? token,
    bool loading = false,
    bool isForm = false,
  }) async {
    mydio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      if (loading) {
        MyLoading.show(context);
      }
      final response = await mydio.post(url,
          queryParameters: query,
          data: isForm ? FormData.fromMap(body ?? {}) : body);
      if (loading) {
        MyLoading.dismis(context);
      }
      return response;
    } on DioError catch (e) {
      getDioError(e: e, context: context);
    }
  }

  static Future<Response?> putData(
    BuildContext context, {
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    String? token,
    bool loading = false,
    bool isForm = false,
  }) async {
    mydio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      if (loading) {
        MyLoading.show(context);
      }
      final response = await mydio.put(url,
          queryParameters: query,
          data: isForm ? FormData.fromMap(body ?? {}) : body);
      if (loading) {
        MyLoading.dismis(context);
      }
      return response;
    } on DioError catch (e) {
      getDioError(e: e, context: context);
    }
  }

  static Future<Response?> deleteData(
    BuildContext context, {
    required String url,
    Map<String, dynamic>? query,
    String? token,
    bool loading = false,
  }) async {
    mydio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      if (loading) {
        MyLoading.show(context);
      }

      final response = await mydio.delete(url, queryParameters: query);
      if (loading) {
        MyLoading.dismis(context);
      }
      return response;
    } on DioError catch (e) {
      getDioError(e: e, context: context);
    }
  }

  static Future<Response?> getData(
    BuildContext context, {
    required String url,
    Map<String, dynamic>? query,
    String? token,
    bool loading = false,
  }) async {
    mydio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      if (loading) {
        MyLoading.show(context);
      }
      final response = await mydio.get(url, queryParameters: query);
      print("from dio");

      if (loading) {
        MyLoading.dismis(context);
      }

      return response;
    } on DioError catch (e) {
      getDioError(e: e, context: context);
    }
  }

  static getDioError({required DioError e, required BuildContext context}) {
    log("---------------autherrr");
    MyLoading.dismis(context);

    if (DioErrorType.receiveTimeout == e.type ||
        DioErrorType.connectTimeout == e.type) {
      log('case 1');
      log('Server is not reachable. Please verify your internet connection and try again');
    } else if (DioErrorType.response == e.type) {
      log('case 2');
      log('Server reachable. Error in resposne');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.response?.data["msg"] ?? "error")));

      log("hello im errroe");
      if (e.response!.statusCode == 401) {
        // OverLays.snack(context,
        //     text: e.response!.data["message"], state: SnakState.failed);
      }
    } else if (DioErrorType.other == e.type) {
      SnackBar(
        content: Text('Failed'),
      );
      if (e.message.contains('SocketException')) {
        log('Network error');
        log('case 3');
      }
    } else {
      // show snak server error

      log('case 4');
      log('Problem connecting to the server. Please try again.');
    }
    return null;
  }
}
