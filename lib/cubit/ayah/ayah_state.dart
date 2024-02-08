part of 'ayah_cubit.dart';

class AyahState extends Equatable {
  const AyahState();

  @override
  List<Object> get props => [];
}

class AyahInitial extends AyahState {}

class AyahLoading extends AyahState {}

class AyahLoaded extends AyahState {
  // final List<SurahModel> detail;
  final DetailSurahModel detail;

  const AyahLoaded({required this.detail});

  @override
  List<Object> get props => [detail];
}

class AyahError extends AyahState {
  final String message;

  const AyahError({required this.message});

  @override
  List<Object> get props => [message];
}
