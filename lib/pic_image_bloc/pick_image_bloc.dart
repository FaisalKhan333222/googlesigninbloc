import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:faisalbloc/firebase_webapis/auth.dart';
import 'package:meta/meta.dart';

part 'pick_image_event.dart';
part 'pick_image_state.dart';

class PickImageBloc extends Bloc<PickImageEvent, PickImageState> {
  PickImageBloc() : super(PickImageInitialState()) {
    on<PickImageSuccessFullyEvent>((event, emit) async {
      try {
        File? image = await pickImage();
        emit.call(PickImageSuccessfullyState(im: image!));
      } catch (e) {
        emit.call(PickImageErrorState(errorMsg: e.toString()));
      }
    });
  }
}
