import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

part 'recognition_state.dart';

class RecognitionCubit extends Cubit<RecognitionState> {
  RecognitionCubit() : super(RecognitionInitial());

  XFile? takedImage;
  String? text;
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImage({required ImageSource source}) async {
    emit(RecognitionLoading());

    XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      emit(RecognitionSuccess());
      return image;
    } else {
      emit(const RecognitionFailure());
    }
    return null;
  }

  Future<String?> recognitionText(File image) async {
    emit(RecognitionLoading());
    try {
      final textRecognizer =
          TextRecognizer(script: TextRecognitionScript.latin);
      final InputImage inputImage = InputImage.fromFilePath(image.path);
      final recognizedText = await textRecognizer.processImage(inputImage);
      emit(RecognitionSuccess());
      return recognizedText.text;
    } on Exception catch (e) {
      emit(RecognitionFailure(message: e.toString()));
    }

    return null;
  }
}
