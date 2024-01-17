# Thematic Unique Name Generator

This package generates an **infinite** number of **thematic unique** names.

![Cover - Names](https://raw.githubusercontent.com/signmotion/thematic_names/master/images/cover.webp)

## Features

Contains exactly 1000 unique names for

- artificial general intelligence (AGIs) -> `Names.agis()`
- bakeries -> `Names.bakeries()`
- planets -> `Names.planets()`
- stars -> `Names.stars()`
- volcanos -> `Names.volcanos()`

on the English language (now). You can easily add your own language.
See enum `SupportedLanguage`.

To generate unique names, the name generator `ThematicNames` adds a number to the name each time
it reaches 1000 names.

## Examples

Get a set of base 1000 unique volcano names:

```dart
final names = Names.volcanos();
```

Output all available thematic names:

```dart
print(names);
```

Generate 4 names:

```dart
for (var i = 0; i < 4; ++i) {
  print(names.next);
}
```

## Principles

These rules are enforced for each set of names.

1. Every set of names contains exactly 1000 names.

2. All names for initialize class `Names` ordered by abc. Case insensetivity.

3. Names does not contain numbers.

4. Names does not contain trailing spaces.

5. Names does not contain double spaces.

6. Any new word in name starts with capital letter. Exclude words: ['a', 'and', 'by', 'in', 'of', 'on', 'or'].

7. Names contains only accepted abc in language.

## Welcome

Welcome to add your own sets of 1000 unique names for... anything on any language)

When you create your own nameset, please, include it in the `names_principles_test.dart` file.

## TODO

- Example with external own set of names.
