import 'package:dart_helpers/dart_helpers.dart';
import 'package:names/names.dart';
import 'package:test/test.dart';

void main() {
  final agis = Names.agis(randomize: false);
  final bakeries = Names.bakeries(randomize: false);
  final planets = Names.planets(randomize: false);
  final stars = Names.stars(randomize: false);
  final volcanos = Names.volcanos(randomize: false);

  group('Names compliance with the principles. See README.md.', () {
    test('Principle 1: Every set of names contains exactly 1000 names.', () {
      const count = 1000;
      expect(agis.count, count);
      expect(bakeries.count, count);
      expect(planets.count, count);
      expect(stars.count, count);
      expect(volcanos.count, count);
    });

    test(
        'Principle 2: All names for initialize `Names` ordered by abc.'
        'Case insensetivity.', () {
      expect(checkIsSorted(agis.all), true);
      expect(checkIsSorted(bakeries.all), true);
      expect(checkIsSorted(planets.all), true);
      expect(checkIsSorted(stars.all), true);
      expect(checkIsSorted(volcanos.all), true);
    });

    test('Principle 3: Names does not contain numbers.', () {
      expect(checkIsNotContainNumbers(agis.all), true);
      expect(checkIsNotContainNumbers(bakeries.all), true);
      expect(checkIsNotContainNumbers(planets.all), true);
      expect(checkIsNotContainNumbers(stars.all), true);
      expect(checkIsNotContainNumbers(volcanos.all), true);
    });

    test('Principle 4: Names does not contain trailing spaces.', () {
      expect(checkIsNotContainTrailingSpaces(agis.all), true);
      expect(checkIsNotContainTrailingSpaces(bakeries.all), true);
      expect(checkIsNotContainTrailingSpaces(planets.all), true);
      expect(checkIsNotContainTrailingSpaces(stars.all), true);
      expect(checkIsNotContainTrailingSpaces(volcanos.all), true);
    });

    test('Principle 5: Names does not contain double spaces.', () {
      expect(checkIsNotContainDoubleSpaces(agis.all), true);
      expect(checkIsNotContainDoubleSpaces(bakeries.all), true);
      expect(checkIsNotContainDoubleSpaces(planets.all), true);
      expect(checkIsNotContainDoubleSpaces(stars.all), true);
      expect(checkIsNotContainDoubleSpaces(volcanos.all), true);
    });

    test(
        'Principle 6: Any new word in name starts with capital letter.'
        'But we have some exclude words.', () {
      expect(checkIsAnyNewWordStartsWIthCapitalLetter(agis.all), true);
      expect(checkIsAnyNewWordStartsWIthCapitalLetter(bakeries.all), true);
      expect(checkIsAnyNewWordStartsWIthCapitalLetter(planets.all), true);
      expect(checkIsAnyNewWordStartsWIthCapitalLetter(stars.all), true);
      expect(checkIsAnyNewWordStartsWIthCapitalLetter(volcanos.all), true);
    });

    test('Principle 7: Names contains only accepted abc in language.', () {
      expect(checkIsContainsOnlyAcceptedAbcInLanguage(agis.all), true);
      expect(checkIsContainsOnlyAcceptedAbcInLanguage(bakeries.all), true);
      expect(checkIsContainsOnlyAcceptedAbcInLanguage(planets.all), true);
      expect(checkIsContainsOnlyAcceptedAbcInLanguage(stars.all), true);
      expect(checkIsContainsOnlyAcceptedAbcInLanguage(volcanos.all), true);
    });
  });
}

/// \source Package `collection`, method `isSorted()`.
bool checkIsSorted(List<String> l) {
  final iterator = l.iterator;
  if (!iterator.moveNext()) {
    return true;
  }

  var previousElement = iterator.current.toLowerCase();
  while (iterator.moveNext()) {
    final element = iterator.current.toLowerCase();
    if (previousElement.compareTo(element) > 0) {
      print('checkIsSorted() `$previousElement` < `$element`');
      return false;
    }

    previousElement = element;
  }

  return true;
}

bool checkIsNotContainNumbers(List<String> l) {
  for (final name in l) {
    if (name.contains(RegExp(r'[0123456789]'))) {
      print('checkIsNotContainNumbers() `$name`');
      return false;
    }
  }

  return true;
}

bool checkIsNotContainTrailingSpaces(List<String> l) {
  for (final name in l) {
    if (name.trim() != name) {
      print('checkIsNotContainTrailingSpaces() `$name`');
      return false;
    }
  }

  return true;
}

bool checkIsNotContainDoubleSpaces(List<String> l) {
  for (final name in l) {
    if (name.removedDoubleSpaces != name) {
      print('checkIsNotContainDoubleSpaces() `$name`');
      return false;
    }
  }

  return true;
}

bool checkIsAnyNewWordStartsWIthCapitalLetter(List<String> l) {
  const excludes = <String>['a', 'and', 'by', 'in', 'of', 'on', 'or'];
  for (final name in l) {
    final words = name.split(' ');
    for (final word in words) {
      if (word.toUpperCaseFirtsLetter != word && !excludes.contains(word)) {
        print('checkIsAnyNewWordStartsWIthCapitalLetter() `$name`');
        return false;
      }
    }
  }

  return true;
}

bool checkIsContainsOnlyAcceptedAbcInLanguage(List<String> l) {
  for (final name in l) {
    final words = name.split(' ');
    for (final word in words) {
      if (word.contains(acceptedLanguageSymbols[SupportedLanguage.english]!)) {
        print('checkIsContainsOnlyAcceptedAbcInLanguage() `$name`');
        return false;
      }
    }
  }

  return true;
}
