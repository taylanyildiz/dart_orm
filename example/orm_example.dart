import 'package:flutter_orm/orm.dart';

void main(List<String> args) {
  print(Orm.version);
  final result = Orm.onOptic(30, 2, "/Users/taylan/Downloads/image.jpeg");
  print(result);
}
