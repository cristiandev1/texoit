import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:texoit/core/interfaces/network_service_interface.dart';
import 'package:texoit/core/utils/http_method_enum.dart';

class HttpNetworkService implements INetworkService {
  final http.Client httpClient;

  HttpNetworkService({required this.httpClient});

  @override
  Future<dynamic> request({
    required String url,
    required HttpMethod method,
    Map<String, dynamic>? parameters,
    Map<String, String>? headers,
  }) async {
    http.Response response;

    switch (method) {
      case HttpMethod.get:
        response = await httpClient.get(Uri.parse(url), headers: headers);
        break;
      case HttpMethod.post:
        response = await httpClient.post(Uri.parse(url), headers: headers, body: json.encode(parameters));
        break;
      case HttpMethod.put:
        response = await httpClient.put(Uri.parse(url), headers: headers, body: json.encode(parameters));
        break;
      case HttpMethod.delete:
        response = await httpClient.delete(Uri.parse(url), headers: headers);
        break;
      case HttpMethod.patch:
        response = await httpClient.patch(Uri.parse(url), headers: headers, body: json.encode(parameters));
        break;
      default:
        throw 'Method not supported';
    }

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
    
  }
}
