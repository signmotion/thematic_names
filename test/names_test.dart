import 'package:test/test.dart';
import 'package:thematic_names/thematic_names.dart';

void main() {
  group('Names', () {
    test('First call current name', () {
      final names = Names.stars();

      final first = names.current;
      expect(first, names.firstFromAll);
      expect(names.next.title, isNotEmpty);
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

    test('Loop by all names, all names works same', () {
      final names = Names.volcanos();

      for (var i = 0; i < names.count; ++i) {
        expect(names.next.title, isNotEmpty);
      }

      expect(names.loop, 0);
      expect(names.current, names.lastFromAll);
      names.next;
      expect(names.loop, 1);
      expect(names.current.title, equals('${names.firstFromAll.title} 1'));
    });

    test('Loop by all names without loop-index, all names works same', () {
      final names = Names.volcanos(withLoopNumber: false);

      for (var i = 0; i < names.count; ++i) {
        names.next;
      }

      expect(names.loop, 0);
      names.next;
      expect(names.loop, 1);
      expect(names.current.title, equals(names.firstFromAll.title));
    });

    test('Synopsis and name are agreed upon', () {
      final names = Names.fantasyCountries(randomizeOnInit: false);

      // first
      expect(names.firstFromAll.title, 'Abyssalight');
      expect(
        names.firstFromAll.synopsis,
        'A realm where light shines in the deepest darkness, suggesting hope and exploration.',
      );

      // middle
      names.skip(500);
      expect(names.current.title, 'Moonridge');
      expect(
        names.current.synopsis,
        'A mountain range bathed in moonlight, suggesting magic and mystery.',
      );

      // last
      expect(names.lastFromAll.title, 'Zirconveil');
      expect(
        names.lastFromAll.synopsis,
        'A veil made of zircon, symbolizing protection and beauty.',
      );
    });
  });
}
