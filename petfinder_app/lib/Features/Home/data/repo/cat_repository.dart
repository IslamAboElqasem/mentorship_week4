import 'package:petfinder_app/Features/Home/data/apis/cat_services.dart';
import 'package:petfinder_app/Features/Home/data/model/cat_model.dart';

class CatRepository {
  final CatService service;

  CatRepository(this.service);

  Future<List<CatModel>> getCats() async {
    final responseData = await service.getCatsResponse();
    return responseData
        .map<CatModel>((json) => CatModel.fromJson(json))
        .toList();
  }
}
