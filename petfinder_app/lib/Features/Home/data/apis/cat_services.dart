import 'dart:convert';

import 'package:http/http.dart' as http;

class CatService {
  final http.Client client;

  CatService(this.client);

  Future<List<dynamic>> getCatsResponse() async {
    const url =
        'https://api.thecatapi.com/v1/images/search?limit=10&&breed_ids=beng&api_key=live_NhHU168ZwOcz8VMdLwQF1XsXSeEtfSjBL7aI1bvBn9X31qgLsw6Ym6BPTv0v3toY';

    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load cats');
    }
  }
}
