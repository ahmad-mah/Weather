// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'prediction_cubit.dart';

abstract class PredictionState extends Equatable {
  const PredictionState();

  @override
  List<Object> get props => [];
}

class PredictionInitial extends PredictionState {}

class PredictionLoading extends PredictionState {}

class PredictionSuccess extends PredictionState {
  final int prediction;
  const PredictionSuccess(
    this.prediction,
  );
}

class PredictionFailure extends PredictionState {
  final String message;

  const PredictionFailure({required this.message});

  @override
  List<Object> get props => [message];
}
