import 'name_r.dart';
import 'supported_language.dart';
import 'agis/names.dart' as agis;
import 'bakeries/names.dart' as bakeries;
import 'fantasy_countries/names.dart' as fantasy_countries;
import 'planets/names.dart' as planet;
import 'stars/names.dart' as stars;
import 'volcanos/names.dart' as volcano;

/// Entrance point for generate names.
class Names {
  /// Generate names for artificial general intelligence (AGIs).
  factory Names.agis({
    SupportedLanguage languageCode = SupportedLanguage.english,
    bool randomizeOnInit = true,
    bool preserveOrderAfterEnd = true,
  }) =>
      Names(
        agis.title[languageCode]!,
        agis.names[languageCode]!,
        randomizeOnInit: randomizeOnInit,
        preserveOrderAfterEnd: preserveOrderAfterEnd,
      );

  /// Generate names for bakeries.
  factory Names.bakeries({
    SupportedLanguage languageCode = SupportedLanguage.english,
    bool randomizeOnInit = true,
    bool preserveOrderAfterEnd = true,
  }) =>
      Names(
        bakeries.title[languageCode]!,
        bakeries.names[languageCode]!,
        randomizeOnInit: randomizeOnInit,
        preserveOrderAfterEnd: preserveOrderAfterEnd,
      );

  /// Generate names for fantasy countries.
  // factory Names.fantasyCountries({
  //   SupportedLanguage languageCode = SupportedLanguage.english,
  //   bool randomizeOnInit = true,
  //   bool preserveOrderAfterEnd = true,
  // }) =>
  //     Names(
  //       fantasy_countries.title[languageCode]!,
  //       fantasy_countries.names[languageCode]!,
  //       randomizeOnInit: randomizeOnInit,
  //       preserveOrderAfterEnd: preserveOrderAfterEnd,
  //     );

  /// Generate names for planets.
  factory Names.planets({
    SupportedLanguage languageCode = SupportedLanguage.english,
    bool randomizeOnInit = true,
    bool preserveOrderAfterEnd = true,
  }) =>
      Names(
        planet.title[languageCode]!,
        planet.names[languageCode]!,
        randomizeOnInit: randomizeOnInit,
        preserveOrderAfterEnd: preserveOrderAfterEnd,
      );

  /// Generate names for stars.
  factory Names.stars({
    SupportedLanguage languageCode = SupportedLanguage.english,
    bool randomizeOnInit = true,
    bool preserveOrderAfterEnd = true,
  }) =>
      Names(
        stars.title[languageCode]!,
        stars.names[languageCode]!,
        randomizeOnInit: randomizeOnInit,
        preserveOrderAfterEnd: preserveOrderAfterEnd,
      );

  /// Generate names for volcanos.
  factory Names.volcanos({
    SupportedLanguage languageCode = SupportedLanguage.english,
    bool randomizeOnInit = true,
    bool preserveOrderAfterEnd = true,
  }) =>
      Names(
        volcano.title[languageCode]!,
        volcano.names[languageCode]!,
        randomizeOnInit: randomizeOnInit,
        preserveOrderAfterEnd: preserveOrderAfterEnd,
      );

  Names(
    this.title,
    Set<NameR> data, {
    this.randomizeOnInit = true,
    this.preserveOrderAfterEnd = true,
  })  : assert(title.isNotEmpty, 'The title of names should be set.'),
        assert(data.isNotEmpty, 'The list of names should be not empty.'),
        _data = data {
    _init();
  }

  void _init() {
    ++_loop;

    if (randomizeOnInit) {
      if (loop == 0 || loop > 0 && !preserveOrderAfterEnd) {
        _data = {
          ...[..._data]..shuffle(),
        };
      }
    }

    // set the iterator to the first element
    it = _data.iterator;
  }

  /// Title of this set.
  final String title;

  /// All names of this set.
  Set<NameR> _data;

  /// Shuffle the names after create an object or reinitialize it.
  /// See [preserveOrderAfterEnd], [_init].
  final bool randomizeOnInit;

  /// Preserve initialized order of the names when have reached the end of
  /// the name list.
  /// Have not an effect when [randomizeOnConstruct] == `false`.
  final bool preserveOrderAfterEnd;

  /// All names by created theme.
  /// See the factories.
  Set<NameR> get all => Set.unmodifiable(_data);

  /// Count of names for created theme.
  /// Always equals 1000. See [names_principles_test.dart].
  int get count => _data.length;

  /// Next name. Infinity list.
  NameR get next {
    if (!it.moveNext()) {
      _init();
    }

    return current;
  }

  /// Current name.
  NameR get current {
    late NameR r;
    try {
      r = it.current;
    } catch (_) {
      it.moveNext();
      r = it.current;
    }

    return (
      name: _loop == 0 ? r.name : '${r.name} $_loop',
      synopsis: r.synopsis,
    );
  }

  NameR get firstFromAll => _data.first;

  NameR get lastFromAll => _data.last;

  // The pointer to the current name.
  late Iterator<NameR> it;

  // How many times did we go through the all names.
  int _loop = -1;
  int get loop => _loop;

  @override
  String toString() => '$title: ${all.join(", ")}';
}
