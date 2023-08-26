import 'dart:io';

void main(List<String> args) {
  Process.runSync(
    'cmake',
    ['.'],
    workingDirectory: "include/",
  );
  Process.runSync(
    'make',
    [],
    workingDirectory: "include/",
  );
}
