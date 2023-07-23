import 'package:names/names.dart';
import 'package:test/test.dart';

void main() {
  group('Names', () {
    test('First call current name', () {
      final names = Names.stars();

      final first = names.current;
      expect(first, names.firstFromAll);
      expect(names.next, isNotEmpty);
      expect(names.current != first, true);
      expect(names.loop, 0);
    });

    test('First call next name', () {
      final names = Names.stars();

      final first = names.next;
      expect(first, names.firstFromAll);
      expect(names.current, first);
      expect(names.loop, 0);
    });

    test('Loop by names, all names works same', () {
      final names = Names.volcanos();

      for (int i = 0; i < names.count; ++i) {
        expect(names.next, isNotEmpty);
      }

      expect(names.loop, 0);
      expect(names.current, names.lastFromAll);
      names.next;
      expect(names.loop, 1);
      expect(names.current, startsWith(names.firstFromAll));
    });
  });
}
