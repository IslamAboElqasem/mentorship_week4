import 'package:mocktail/mocktail.dart';
import 'package:petfinder_app/Features/Home/data/apis/cat_services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

class MockHTTPClient extends Mock implements http.Client {}

void main() {
  late MockHTTPClient mockHTTPClient;
  late CatService catService;

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    catService = CatService(mockHTTPClient);
  });

  group('CatService Tests', () {
    test(
        'given CatServices class when getCatsResponse function is called and status code is 200 then a usermodel should be returned',
        () async {
      // Arrange
      when(() => mockHTTPClient.get(Uri.parse(
              'https://api.thecatapi.com/v1/images/search?limit=10&&breed_ids=beng&api_key=live_NhHU168ZwOcz8VMdLwQF1XsXSeEtfSjBL7aI1bvBn9X31qgLsw6Ym6BPTv0v3toY')))
          .thenAnswer((Invocation) async {
        return http.Response('''
[
  {
    "breeds": [
      {
        "id": "beng",
        "name": "Bengal",
        "origin": "United States",
        "life_span": "12 - 15"
      }
    ],
    "url": "https://cdn2.thecatapi.com/images/LSaDk6OjY.jpg"
  }
]
''', 200);
      });
      // Act
      final response = catService.getCatsResponse();
      // Assert
      expect(response, isA<Future<List<dynamic>>>());
    });
    test(
      'given CatServices class when getCatsResponse function is called and status code is not 200 then an exception should be thrown',
      () {
        //Arrange
        when(
          () => mockHTTPClient.get(
            Uri.parse(
                'https://api.thecatapi.com/v1/images/search?limit=10&&breed_ids=beng&api_key=live_NhHU168ZwOcz8VMdLwQF1XsXSeEtfSjBL7aI1bvBn9X31qgLsw6Ym6BPTv0v3toY'),
          ),
        ).thenAnswer((Invocation) async {
          return http.Response('{}', 500);
        });
        //Act
        final response = catService.getCatsResponse();
        //Assert
        expect(response, throwsException);
      },
    );
  });
}
