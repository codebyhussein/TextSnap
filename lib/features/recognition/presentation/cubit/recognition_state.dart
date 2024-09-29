part of 'recognition_cubit.dart';

abstract class RecognitionState extends Equatable {
  const RecognitionState();

  @override
  List<Object> get props => [];
}

class RecognitionInitial extends RecognitionState {}

class RecognitionLoading extends RecognitionState {}

class RecognitionSuccess extends RecognitionState {}

class RecognitionFailure extends RecognitionState {
  final String? message;
  const RecognitionFailure({this.message});
}
