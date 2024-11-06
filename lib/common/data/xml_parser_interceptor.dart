import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:xml2json/xml2json.dart';

class XmlParserInterceptor extends Interceptor {
  XmlParserInterceptor();

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    const bggUri = 'boardgamegeek.com/xmlapi2';
    final uri = response.requestOptions.uri.toString();
    if (uri.contains(bggUri)) {
      final parser = Xml2Json();
      parser.parse(response.data.toString());

      final json = parser.toOpenRally();
      final map = const JsonDecoder().convert(json) as Map<String, dynamic>;
      final flatList = flattenList(map);
      final flatJson = flattenJson(flatList);

      return handler.resolve(response..data = flatJson);
    }
    super.onResponse(response, handler);
  }

  Map<String, dynamic> flattenList(Map<String, dynamic> json) {
    if (json.containsKey('items') &&
        (json['items'] as Map<String, dynamic>).containsKey('item')) {
      final itemsMap = json['items'] as Map<String, dynamic>;
      if (itemsMap.containsKey('item')) json['items'] = itemsMap['item'];
    }

    return json;
  }

  Map<String, dynamic> flattenJson(
    Map<String, dynamic> json, [
    Map<String, dynamic>? result,
  ]) {
    result ??= <String, dynamic>{};

    for (final entry in json.entries) {
      final key = entry.key;
      final value = entry.value;

      if (value is Map && value.containsKey('value') && value.length == 1) {
        result[key] = value['value'];
        continue;
      }

      if (value is Map) {
        result[key] = flattenJson(
          value as Map<String, dynamic>,
          result[key] as Map<String, dynamic>? ?? {},
        );
      } else if (value is List) {
        for (var i = 0; i < value.length; i++) {
          if (value[i] is Map) {
            value[i] = flattenJson(value[i] as Map<String, dynamic>);
          }
        }
        result[key] = value;
      } else {
        result[key] = value;
      }
    }

    return result;
  }
}
