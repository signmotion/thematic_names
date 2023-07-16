import 'package:names/names.dart';
import 'package:test/test.dart';

void main() {
  group('Names', () {
    test('Loop by volcano names, all other names works same', () {
      final names = Names.volcanos();

      for (int i = 0; i < names.count; ++i) {
        expect(names.next, isNotEmpty);
      }

      expect(names.loop, 0);
      expect(names.next, isNotEmpty);
      expect(names.loop, 1);
    });
  });
}
