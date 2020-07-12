import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import 'constants.dart';

class DioClient {
  Dio get dio {
    final _dio = Dio(BaseOptions(baseUrl: BASE_URL))
      ..interceptors.add(
        DioCacheManager(CacheConfig()).interceptor,
      );

    return _dio;
  }

  Future<Response> get(String path) async {
    return await dio.get(
      path,
      options: buildCacheOptions(Duration(days: 5), forceRefresh: true),
    );
  }
}
