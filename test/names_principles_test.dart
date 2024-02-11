// ignore_for_file: avoid_print

import 'package:strings/strings.dart';
import 'package:test/test.dart';
import 'package:thematic_names/thematic_names.dart';

import 'helpers/string_ext.dart';

final list = <Names>[
  Names.agis(randomizeOnInit: false),
  Names.bakeries(randomizeOnInit: false),
  // Names.fantasyCountries(randomizeOnInit: false),
  Names.planets(randomizeOnInit: false),
  Names.stars(randomizeOnInit: false),
  Names.volcanos(randomizeOnInit: false),
];

void main() {
  group('Names compliance with the principles. See README.md.', () {
    test('Principle 1: Every set of names contains exactly 1000 names.', () {
      const count = 1000;
      for (final names in list) {
        expect(names.count, count, reason: names.title);
      }
    });

    test(
        'Principle 2: All names for initialize `Names` ordered by abc.'
        'Case insensetivity.',
        () => checkAllNames(checkIsSorted));

    test('Principle 3: Names does not contain numbers.',
        () => checkAllNames(checkIsNotContainNumbers));

    test('Principle 4: Names does not contain trailing spaces.',
        () => checkAllNames(checkIsNotContainTrailingSpaces));

    test('Principle 5: Names does not contain double spaces.',
        () => checkAllNames(checkIsNotContainDoubleSpaces));

    test(
        'Principle 6: Any new word in name starts with capital letter.'
        'But we have some exclude words.',
        () => checkAllNames(checkIsAnyNewWordStartsWIthCapitalLetter));

    test('Principle 7: Names contains only accepted abc in language.',
        () => checkAllNames(checkIsContainsOnlyAcceptedAbcInLanguage));

    test(
        'Principle 8: The length of names is from 2 characters and does'
        ' not exceed 120 characters.',
        () => checkAllNames(checkLengthBetween2And100Characters));

    test(
        'Principle 9: Any word in the name contains at least 2 characters'
        ' with language-dependent exceptions.',
        () => checkAllNames(
              checkLengthAnyWordContainsAtLeast2CharactersWithSomeExluded,
            ));

    test(
        "Principle 10: The first word in the name has no such word in it:"
        ' sides of the world, directions, distances, etc.',
        () => checkAllNames(checkIsExcludeInFirstWordDirectionDistancesEtc));
  });
}

void checkAllNames(bool Function(Set<String>) checker) {
  for (final names in list) {
    expect(checker(names.all), true, reason: names.title);
  }
}

/// \source Package `collection`, method `isSorted()`.
bool checkIsSorted(Set<String> l) {
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

bool checkIsNotContainNumbers(Set<String> l) {
  for (final name in l) {
    if (name.contains(RegExp(r'[0123456789]'))) {
      print('checkIsNotContainNumbers() `$name`');
      return false;
    }
  }

  return true;
}

bool checkIsNotContainTrailingSpaces(Set<String> l) {
  for (final name in l) {
    if (name.trim() != name) {
      print('checkIsNotContainTrailingSpaces() `$name`');
      return false;
    }
  }

  return true;
}

bool checkIsNotContainDoubleSpaces(Set<String> l) {
  for (final name in l) {
    if (name.removedDoubleSpaces != name) {
      print('checkIsNotContainDoubleSpaces() `$name`');
      return false;
    }
  }

  return true;
}

bool checkIsAnyNewWordStartsWIthCapitalLetter(Set<String> l) {
  const excludes = <String>{'a', 'and', 'by', 'in', 'of', 'on', 'or'};
  for (final name in l) {
    final words = name.split(' ');
    for (final word in words) {
      if (word.toCapitalised() != word && !excludes.contains(word)) {
        print('checkIsAnyNewWordStartsWIthCapitalLetter() `$name`');
        return false;
      }
    }
  }

  return true;
}

bool checkIsContainsOnlyAcceptedAbcInLanguage(Set<String> l) {
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

bool checkLengthBetween2And100Characters(Set<String> l) {
  for (final name in l) {
    if (name.length < 2 && name.length > 120) {
      print('checkLengthBetween2And100Characters() `$name`');
      return false;
    }
  }

  return true;
}

bool checkLengthAnyWordContainsAtLeast2CharactersWithSomeExluded(
  Set<String> l,
) {
  const excludes = <String>{'a', 'and', 'by', 'in', 'of', 'on', 'or'};
  for (final name in l) {
    final words = name.split(' ');
    for (final word in words) {
      if (word.length < 2 && !excludes.contains(word)) {
        print(
          'checkLengthAnyWordContainsAtLeast2CharactersWithSomeExluded() `$name`',
        );
        return false;
      }
    }
  }

  return true;
}

bool checkIsExcludeInFirstWordDirectionDistancesEtc(Set<String> l) {
  const excludes = <String>{
    'above',
    'ahead',
    'behind',
    'below',
    'bottom',
    'down',
    'east',
    'far',
    'great',
    'greater',
    'left',
    'lower',
    'near',
    'nearest',
    'new',
    'newest',
    'north',
    'next',
    'old',
    'oldest',
    'previos',
    'previuos',
    'right',
    'south',
    'top',
    'up',
    'upper',
    'west',
  };
  for (final name in l) {
    final word = name.split(' ').first;
    if (excludes.contains(word.toLowerCase())) {
      print('checkIsExcludeInFirstWordDirectionDistancesEtc() `$name`');
      return false;
    }
  }

  return true;
}
