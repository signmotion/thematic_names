import 'supported_language.dart';
import 'agis/agis_names.dart' as agis;
import 'planets/planet_names.dart' as planet;
import 'stars/stars_names.dart' as stars;
import 'volcanos/volcano_names.dart' as volcano;

class Names {
  final String title;
  final List<String> data;

  Names(this.title, Set<String> data, {bool randomize = true})
      : assert(title.isNotEmpty, 'The title of names should be set.'),
        assert(data.isNotEmpty, 'The list of names should be not empty.'),
        data = data.toList() {
    if (randomize) {
      this.data.shuffle();
    }
  }

  factory Names.agis({
    SupportedLanguage lc = SupportedLanguage.english,
    bool randomize = true,
  }) =>
      Names(agis.title[lc]!, agis.names[lc]!, randomize: randomize);

  factory Names.planets({
    SupportedLanguage lc = SupportedLanguage.english,
    bool randomize = true,
  }) =>
      Names(planet.title[lc]!, planet.names[lc]!, randomize: randomize);

  factory Names.stars({
    SupportedLanguage lc = SupportedLanguage.english,
    bool randomize = true,
  }) =>
      Names(stars.title[lc]!, stars.names[lc]!, randomize: randomize);

  factory Names.volcanos({
    SupportedLanguage lc = SupportedLanguage.english,
    bool randomize = true,
  }) =>
      Names(volcano.title[lc]!, volcano.names[lc]!, randomize: randomize);

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
    if (i == -1) {
      next;
    }

    final r = data[i];

    return loop == 0 ? r : '$r $loop';
  }

  String get firstFromAll => data.first;

  String get lastFromAll => data.last;

  // Current index.
  int i = -1;

  // How many times did you go through the all names.
  int loop = 0;

  @override
  String toString() => all.join(', ');
}
