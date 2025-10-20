import 'package:dio/dio.dart';

class CatService {
  final Dio dio;

  CatService(this.dio);

  Future<List<dynamic>> getCatsResponse() async {
    const url =
        'https://api.thecatapi.com/v1/images/search?limit=10&&breed_ids=beng&api_key=live_NhHU168ZwOcz8VMdLwQF1XsXSeEtfSjBL7aI1bvBn9X31qgLsw6Ym6BPTv0v3toY';

    final response = await dio.get(url);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to load cats');
    }
  }
}
