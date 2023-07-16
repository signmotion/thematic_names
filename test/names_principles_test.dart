import 'package:dart_helpers/dart_helpers.dart';
import 'package:names/names.dart';
import 'package:test/test.dart';

void main() {
  group('Names compliance with the principles. See README.md.', () {
    test('Principle 1: Every set of names contains exactly 1000 names.', () {
      expect(Names.volcanos().count, 1000);
    });

    test('Principle 2: All names for initialize `Names` ordered by abc.', () {
      final all = Names.volcanos(randomize: false).all;
      expect(checkIsSorted(all), true);
    });

    test('Principle 3: Names does not contain numbers.', () {
      final all = Names.volcanos(randomize: false).all;
      expect(checkIsNotContainNumbers(all), true);
    });

    test('Principle 4: Names does not contain trailing spaces.', () {
      final all = Names.volcanos(randomize: false).all;
      expect(checkIsNotContainTrailingSpaces(all), true);
    });

    test('Principle 5: Names does not contain double spaces.', () {
      final all = Names.volcanos(randomize: false).all;
      expect(checkIsNotContainDoubleSpaces(all), true);
    });

    test('Principle 6: Any new word in name starts with capital letter.', () {
      final all = Names.volcanos(randomize: false).all;
      expect(checkIsAnyNewWordStartsWIthCapitalLetter(all), true);
    });
  });
}

/// \source Package `collection`, method `isSorted()`.
bool checkIsSorted(List<String> l) {
  final iterator = l.iterator;
  if (!iterator.moveNext()) {
    return true;
  }

  var previousElement = iterator.current;
  while (iterator.moveNext()) {
    final element = iterator.current;
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
  for (final name in l) {
    final words = name.split(' ');
    for (final word in words) {
      if (word.toUpperCaseFirtsLetter != word) {
        print('checkIsAnyNewWordStartsWIthCapitalLetter() `$name`');
        return false;
      }
    }
  }

  return true;
}
