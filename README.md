# Thematic Unique Name Generator

![Cover - Thematic Names](https://raw.githubusercontent.com/signmotion/thematic_names/master/images/cover.webp)

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/signmotion/id_gen/master/LICENSE)

Generate an **infinite** number of **thematic calibrated unique** names.
Easy-to-use and well-tested Dart package.

## Features

Contains exactly 1000 unique, calibrated (see the **Principles** below) names for

- artificial general intelligence (AGIs) `Names.agis()`
- bakeries `Names.bakeries()`
- fantasyCountries `Names.fantasyCountries()`
- planets `Names.planets()`
- stars `Names.stars()`
- volcanos `Names.volcanos()`

on the English language (now). You can easily add your own language.
See enum `SupportedLanguage`.

To generate unique names, the name generator `ThematicNames` adds a number to the name each time
it reaches 1000 names.

## Usage

### Get a set of base 1000 unique volcano names

```dart
final names = Names.volcanos();
```

### Output all available thematic names

```dart
print(names);
```

### Generate 4 names

```dart
for (var i = 0; i < 4; ++i) {
  print(names.next);
}
```

## Principles

These rules are enforced for each set of names.

1. Every set of names contains exactly 1000 unique thematic names.

2. All names for initialize class `Names` ordered by abc. Case insensetivity.

3. Names doesn't contain numbers.

4. Names doesn't contain trailing spaces.

5. Names doesn't contain double spaces.

6. Any new word in name starts with capital letter with language-dependent exceptions. Excluded words: ['a', 'and', 'by', 'in', 'of', 'on', 'or'].

7. Names contains only accepted abc in the language.

8. The length of names is from 2 characters and does not exceed 120 characters.

9. Any word in the name contains at least 2 characters with language-dependent exceptions. Exluded words: see the principle 6.

10. The first word in the name has no such word in it: ['above', 'ahead', 'behind', 'below', 'bottom', 'down', 'east', 'far', 'great', 'greater', 'left', 'lower', 'near', 'nearest', 'new', 'newest', 'north', 'next', 'old', 'oldest', 'previos', 'previuos', 'right', 'south', 'top', 'up', 'upper', 'west']].

## Welcome

Welcome to add your own sets of 1000 unique names for... anything on any language.

[The shared table](https://docs.google.com/spreadsheets/d/1a47-yqtVmVB8MjgfKIscmcX0LKxt5xPRe4OlyflZ51g/copy)
can help do it. Also you can use [this sheets](https://docs.google.com/spreadsheets/d/191DerwdKESDnRZ0aRoJXcIFa6o4ak8eO6XUawBlmRhQ/copy)
for multiply substitutes words.

When you create your own nameset, please, include it in the `names_principles_test.dart` file.

This package is open-source, stable and well-tested. Development happens on
[GitHub](https://github.com/signmotion/id_gen). Feel free to report issues
or create a pull-request there.

General questions are best asked on
[StackOverflow](https://stackoverflow.com/questions/tagged/id_gen).

## TODO

- Principles and tests for synopses.
- Example with external own set of names.
- Names and synopses in other languages.
