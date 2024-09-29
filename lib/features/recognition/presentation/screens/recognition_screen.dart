import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iamge_to_text/core/style.dart';
import 'package:iamge_to_text/features/recognition/presentation/cubit/recognition_cubit.dart';
import 'package:iamge_to_text/features/recognition/presentation/widgets/default_button.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/loading_widget.dart';

class RecognitionScreen extends StatefulWidget {
  const RecognitionScreen({super.key});

  @override
  State<RecognitionScreen> createState() => _RecognitionScreenState();
}

class _RecognitionScreenState extends State<RecognitionScreen> {
  XFile? takedImage;
  String? text;

  @override
  Widget build(BuildContext context) {
    RecognitionCubit recognitionCubit = RecognitionCubit();
    return BlocProvider(
      create: (context) => RecognitionCubit(),
      child: Scaffold(
          body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: AppStyle.backgroundDecoration,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: BlocBuilder<RecognitionCubit, RecognitionState>(
            bloc: recognitionCubit,
            builder: (context, state) {
              if (state is RecognitionLoading) {
                return const LoadingWidget();
              }
              if (state is RecognitionFailure) {
                return Text('error:${state.message}');
              }
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Container(
                      height: 350,
                      decoration: AppStyle.contanierDecoration,
                      child: takedImage == null
                          ? SizedBox(
                              height: 350,
                              width: double.infinity,
                              child: IconButton(
                                  onPressed: () async {
                                    takedImage = await recognitionCubit
                                        .pickImage(source: ImageSource.camera);

                                    text =
                                        await recognitionCubit.recognitionText(
                                            File(takedImage!.path));
                                  },
                                  icon: const Icon(
                                    Icons.add_a_photo,
                                    size: 50,
                                  )),
                            )
                          : Container(
                              height: 350,
                              width: double.infinity,
                              decoration: AppStyle.contanierDecoration,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.file(
                                  File(takedImage!.path),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    DefaultButton(
                      textButton: 'Take image from camera',
                      onPressed: () async {
                        takedImage = await recognitionCubit.pickImage(
                            source: ImageSource.camera);

                        text = await recognitionCubit
                            .recognitionText(File(takedImage!.path));
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DefaultButton(
                      textButton: 'Upload image from gallery',
                      onPressed: () async {
                        takedImage = await recognitionCubit.pickImage(
                            source: ImageSource.gallery);

                        text = await recognitionCubit
                            .recognitionText(File(takedImage!.path));
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SelectableText(text ?? '', style: AppStyle.style16),
                    const Spacer(),
                  ]);
            },
          ),
        ),
      )),
    );
  }
}
