import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '/helper/orm_helper.dart';
import '/orm.dart';
import '/src/ffi.dart';

abstract class Orm {
  Orm._();

  /// Open-CV Version
  static String get version => getOpenCVVersion();

  /// Optical read
  static EntOrm onOptic(int questionCount, int answerCount, String imagePath) {
    EntOrm orm = EntOrm(
      questionCount: questionCount,
      answerCount: answerCount,
      imagePath: imagePath,
    );
    List<String> output = imagePath.split('.');
    output[output.length - 2] = "${output[output.length - 2]}_gray";
    Pointer<Int32> resultBuffer = malloc.allocate<Int32>(
      sizeOf<Int32>() * questionCount,
    );
    readOpticalForm(
      imagePath,
      output.join("."),
      questionCount,
      answerCount,
      resultBuffer,
    );

    for (var i = 0; i < questionCount; i++) {
      List<ORMQuestion> answers = [...orm.answers];
      final type = ORMHelper.intToAnsserType(resultBuffer.elementAt(i).value);
      answers[i] = answers[i].copy(answerType: type);
    }
    malloc.free(resultBuffer);
    orm = orm.copy(imagePath: output.join('.'));
    return orm;
  }
}
