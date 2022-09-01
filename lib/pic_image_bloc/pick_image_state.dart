part of 'pick_image_bloc.dart';

@immutable
abstract class PickImageState {}

class PickImageInitialState extends PickImageState {}

class PickImageSuccessfullyState extends PickImageState {
  File im;
  PickImageSuccessfullyState({required this.im});
}

class PickImageErrorState extends PickImageState {
  String errorMsg;
  PickImageErrorState({required this.errorMsg});
}
