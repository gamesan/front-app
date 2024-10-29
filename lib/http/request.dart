// ignore_for_file: avoid_log, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Request {
  static final BaseOptions _options = BaseOptions(
    baseUrl: '',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  static final Dio _dio = Dio(_options);

  static Future<T> _request<T>(String path,
      {String? method, Map? params, data}) async {
    if (params != null) {
      params.forEach((key, value) {
        if (path.contains(key)) {
          path = path.replaceAll(':$key', value.toString());
        }
      });
    }
    // _log(path, '发送的数据是：${data}');
    try {
      Response response = await _dio.request(path,
          data: data, options: Options(method: method));
      if (response.statusCode == 200 || response.statusCode == 201) {
        // _log(
        //   path,
        //   '响应数据类型是：${response.data.runtimeType}；响应数据是：${response.data}',
        // );
        if (response.data is Map) {
          return response.data;
        } else {
          return json.decode(response.data.toString());
        }
      } else {
        _log(path, 'http状态码是：${response.statusCode}');
        _handleHttpError(response.statusCode);
        return Future.error('http状态码错误');
      }
    } on DioError catch (e) {
      _log(path, '请求异常：${_dioError(e)}');
      return Future.error('请求异常');
    } catch (e) {
      _log(path, '未知错误是：${e}');
      return Future.error('未知错误');
    }
  }

  static void _log(String path, String msg) {
    // ignore: avoid_print
    print('打印日志信息---请求地址是：${path}；${msg}');
  }

  static String _dioError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return '网络连接超时，请检查网络设置';
      case DioErrorType.receiveTimeout:
        return '服务器异常，请稍后重试！';
      case DioErrorType.sendTimeout:
        return '网络连接超时，请检查网络设置';
      case DioErrorType.response:
        return '服务器异常，请稍后重试！';
      case DioErrorType.other:
        return '网络异常，请稍后重试！';
      default:
        return 'Dio异常';
    }
  }

  static void _handleHttpError(int? errorCode) {
    String message;
    switch (errorCode) {
      case 400:
        message = '';
        break;
      default:
        message = '请求失败，错误码是：$errorCode';
    }
    EasyLoading.showError(message);
  }

  static Future<T> get<T>(String path, {Map? params}) {
    return _request(path, method: 'get', params: params);
  }

  static Future<T> post<T>(String path, {Map? params, data}) {
    return _request(path, method: 'post', params: params, data: data);
  }
}
