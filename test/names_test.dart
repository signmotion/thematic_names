import 'package:names/names.dart';
import 'package:test/test.dart';

void main() {
  group('Names', () {
    test('First call current name', () {
      final names = Names.stars();

      final first = names.current;
      expect(first, names.first);
      expect(names.next, isNotEmpty);
      expect(names.current != first, true);
      expect(names.first != names.last, true);
      expect(names.loop, 0);
    });

    test('Loop by names, all names works same', () {
      final names = Names.volcanos();

      for (int i = 0; i < names.count - 1; ++i) {
        expect(names.next, isNotEmpty);
      }

      expect(names.loop, 0);
      expect(names.next, isNotEmpty);
      expect(names.loop, 1);
    });
  });
}
