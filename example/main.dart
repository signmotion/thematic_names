// ignore_for_file: avoid_print

import 'dart:io';

import 'package:thematic_names/thematic_names.dart';

void main() {
  // get a set of 1000 unique volcano names
  final names = Names.stars(languageCode: SupportedLanguage.english);

  // all 1000 names
  final titles = names.all.map((r) => r.title);
  File('all_names.txt').writeAsStringSync(titles.join(', '));

  // generate 4 names
  for (var i = 0; i < 4; ++i) {
    print(names.next.title);
  }
}
