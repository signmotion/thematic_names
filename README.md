# Thematic Unique Name Generator

![Cover - Names](https://raw.githubusercontent.com/signmotion/thematic_names/master/images/cover.webp)

Generate an **infinite** number of **thematic calibrated unique** names.
Well-tested Dart package.

## Features

Contains exactly 1000 unique, calibrated (see the Principles below) names for

- artificial general intelligence (AGIs) `Names.agis()`
- bakeries `Names.bakeries()`
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

6. Any new word in name starts with capital letter. Exclude words: ['a', 'and', 'by', 'in', 'of', 'on', 'or'].

7. Names contains only accepted abc in the language.

## Welcome

Welcome to add your own sets of 1000 unique names for... anything on any language)

When you create your own nameset, please, include it in the `names_principles_test.dart` file.

## License

[MIT](LICENSE)

## TODO

- Example with external own set of names.
