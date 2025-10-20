import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petfinder_app/Features/Home/data/model/cat_model.dart';
import 'package:petfinder_app/Features/Home/data/repo/cat_repository.dart';

part 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  final CatRepository repository;

  CatCubit(this.repository) : super(CatInitial());

  Future<void> getCats() async {
    emit(CatLoading());
    try {
      final cats = await repository.getCats();
      emit(CatSuccess(cats));
    } catch (e) {
      emit(CatError(e.toString()));
    }
  }
}
