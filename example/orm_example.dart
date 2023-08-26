import 'package:flutter_orm/orm.dart';

void main() {
  print(Orm.version);
  final result = Orm.onOptic(30, 2, "image_path");
  print(result);
}
