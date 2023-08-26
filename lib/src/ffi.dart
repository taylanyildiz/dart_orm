import 'dart:ffi';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'dart:io' show Directory;
import 'package:ffi/ffi.dart';

// Dynamic lib
final DynamicLibrary _lib = DynamicLibrary.open(libraryPath);

/// Directory path
get libraryPath => path.join(
      Directory.current.path,
      'include',
      'opencv',
    );

final _getOpenCVVersion = _lib
    .lookup<NativeFunction<Pointer<Utf8> Function()>>('getOpenCVVersion')
    .asFunction<Pointer<Utf8> Function()>();
final _convertImageToGrayImage = _lib
    .lookup<NativeFunction<Void Function(Pointer<Utf8>, Pointer<Utf8>)>>(
        'convertImageToGrayImage')
    .asFunction<void Function(Pointer<Utf8>, Pointer<Utf8>)>();
final _readOpticalForm = _lib
    .lookup<
        NativeFunction<
            Void Function(Pointer<Utf8>, Pointer<Utf8>, Int32, Int32,
                Pointer<Int32>)>>('readOpticalForm')
    .asFunction<
        void Function(
            Pointer<Utf8>, Pointer<Utf8>, int, int, Pointer<Int32>)>();

String getOpenCVVersion() {
  return _getOpenCVVersion().cast<Utf8>().toDartString();
}

void convertImageToGrayImage(String inputPath, String outputPath) {
  _convertImageToGrayImage(inputPath.toNativeUtf8(), outputPath.toNativeUtf8());
}

void readOpticalForm(String inputPath, String outputPath, int questionCount,
    int answerCount, Pointer<Int32> markings) {
  _readOpticalForm(inputPath.toNativeUtf8(), outputPath.toNativeUtf8(),
      questionCount, answerCount, markings);
}
