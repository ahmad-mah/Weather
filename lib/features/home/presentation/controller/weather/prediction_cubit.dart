import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/usecases/get_weather_prediction_usecase.dart';

part 'prediction_state.dart';

class PredictionCubit extends Cubit<PredictionState> {
  PredictionCubit(this.getWeatherPredictionUsecase)
      : super(PredictionInitial());

  final GetWeatherPredictionUsecase getWeatherPredictionUsecase;

  void getPrediction(dynamic position) async {
    emit(PredictionLoading());
    final prediction = await getWeatherPredictionUsecase.execute(position);

    prediction.fold(
      (failure) => emit(PredictionFailure(message: failure.message)),
      (prediction) => emit(PredictionSuccess(prediction)),
    );
  }
}
