// ignore_for_file: avoid_print

import 'package:thematic_names/thematic_names.dart';

void main() {
  // get a set of 1000 unique volcano names
  final names = Names.volcanos(languageCode: SupportedLanguage.english);

  // all 1000 names
  print(names);

  // generate 4 names
  for (var i = 0; i < 4; ++i) {
    print(names.next);
  }
}
