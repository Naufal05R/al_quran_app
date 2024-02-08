import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ahlul_quran_app/data/model/detail_surah_model.dart';
import 'package:flutter_ahlul_quran_app/data/service_api.dart';

part 'ayah_state.dart';

class AyahCubit extends Cubit<AyahState> {
  AyahCubit(this.apiService) : super(AyahInitial());

  final ApiService apiService;

  void getDetailSurah(int nomorSurah) async {
    emit(AyahLoading());
    final result = await apiService.getDetailSurah(nomorSurah);
    result.fold(
      (l) => emit(AyahError(message: l)),
      (r) => emit(AyahLoaded(detail: r)),
    );
  }
}
