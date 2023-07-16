import 'supported_language.dart';
import 'volcanos/volcano_names.dart' as volcano;

class Names {
  final String title;
  final List<String> data;

  Names(this.title, this.data, {bool randomize = true})
      : assert(title.isNotEmpty, 'The title of names should be set.'),
        assert(data.isNotEmpty, 'The list of names should be not empty.') {
    if (randomize) {
      data.shuffle();
    }
  }

  factory Names.volcanos({
    SupportedLanguage lc = SupportedLanguage.english,
    bool randomize = true,
  }) =>
      Names(volcano.title[lc]!, volcano.names[lc]!.toList());

  List<String> get all => data;

  int get count => data.length;

  /// Next name. Infinity list.
  String get next {
    ++i;
    if (i >= count) {
      i = 0;
      ++loop;
    }

    return current;
  }

  /// Current name.
  String get current {
    final r = data[i];

    return loop == 0 ? r : '$r $loop';
  }

  // Current index.
  int i = -1;

  // How many times did you go through the all names.
  int loop = 0;

  @override
  String toString() => all.join(', ');
}
