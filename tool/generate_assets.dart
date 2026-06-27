import 'dart:io';

void main() {
  final assetsDir = Directory('assets');
  final output = File('lib/generated/assets.dart');

  final files = assetsDir
      .listSync(recursive: true)
      .whereType<File>()
      .where((e) => !e.path.contains('.DS_Store'))
      .toList()
    ..sort((a, b) => a.path.compareTo(b.path));

  final buffer = StringBuffer();

  buffer.writeln('// ignore_for_file: prefer_single_quotes');
  buffer.writeln('class Assets {');
  buffer.writeln('  Assets._();');
  buffer.writeln();

  for (final file in files) {
    final path = file.path.replaceAll('\\', '/');

    final variable = buildVariable(path);

    buffer.writeln('  /// Assets for $variable');
    buffer.writeln('  /// $path');
    buffer.writeln(
      '  static const String $variable = "$path";',
    );
    buffer.writeln();
  }

  buffer.writeln('}');

  output.createSync(recursive: true);
  output.writeAsStringSync(buffer.toString());

  print('✅ assets.dart generated successfully.');
}

String buildVariable(String path) {
  final withoutAssets = path.replaceFirst('assets/', '');

  final pieces = withoutAssets.split('/');

  final buffer = StringBuffer('assets');

  for (final part in pieces) {
    final noExt = part.replaceAll(RegExp(r'\.[^.]+$'), '');

    final words = noExt.split(RegExp(r'[-_ ]+'));

    for (final word in words) {
      if (word.isEmpty) continue;

      buffer.write(
        word[0].toUpperCase() + word.substring(1),
      );
    }
  }

  return buffer.toString();
}