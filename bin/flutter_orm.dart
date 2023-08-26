import 'dart:io' show Directory;
import 'package:path/path.dart' as path;
import 'dart:io';

void main(List<String> args) {
  final dir = path.join(Directory.current.path, "include");
  Process.runSync(
    'cmake',
    ['.'],
    workingDirectory: dir,
  );
  Process.runSync(
    'make',
    [],
    workingDirectory: dir,
  );
}
