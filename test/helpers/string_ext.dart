/// Copied from `dart_helpers`.
extension StringExt on String {
  String get removedDoubleSpaces => replaceAll(RegExp(r'\s+'), ' ');

  String get removedDoubleChars {
    var r = '';
    for (var i = 0; i < length; ++i) {
      if (i == 0 || this[i] != this[i - 1]) {
        r += this[i];
      }
    }

    return r;
  }
}
