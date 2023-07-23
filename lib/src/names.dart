import 'supported_language.dart';
import 'agis/names.dart' as agis;
import 'bakeries/names.dart' as bakeries;
import 'planets/names.dart' as planet;
import 'stars/names.dart' as stars;
import 'volcanos/names.dart' as volcano;

typedef SL = SupportedLanguage;

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

  factory Names.agis({SL lc = SL.english, bool randomize = true}) =>
      Names(agis.title[lc]!, agis.names[lc]!, randomize: randomize);

  factory Names.bakeries({SL lc = SL.english, bool randomize = true}) =>
      Names(bakeries.title[lc]!, bakeries.names[lc]!, randomize: randomize);

  factory Names.planets({SL lc = SL.english, bool randomize = true}) =>
      Names(planet.title[lc]!, planet.names[lc]!, randomize: randomize);

  factory Names.stars({SL lc = SL.english, bool randomize = true}) =>
      Names(stars.title[lc]!, stars.names[lc]!, randomize: randomize);

  factory Names.volcanos({SL lc = SL.english, bool randomize = true}) =>
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
