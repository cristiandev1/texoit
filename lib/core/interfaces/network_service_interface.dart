import 'package:texoit/core/utils/http_method_enum.dart';

abstract class INetworkService {
  Future<dynamic> request({
    required String url,
    required HttpMethod method,
    Map<String, dynamic>? parameters,
    Map<String, String>? headers,
  });
}
