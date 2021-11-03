import 'package:perec/perec.dart';
import 'package:test/test.dart';

void main() {
  group('Load map tests', () {
    LoadMap loadMap = LoadMap();
    loadMap.load();
    NodeMap map = loadMap.getMap();
    test('Load map', () {
      expect(map, isNotNull);
    });
    test('Get current node', () {
      Node currentNode = map.getCurrent();
      expect(currentNode, isNotNull);
      expect(currentNode.getId(), 0);
      expect(currentNode.getQuestion(), 'Is Mr X in his office?');
      expect(currentNode.getDescription(), 'Go to see Mr X');
    });
    test('Test pick yes', () {
      map.pickYes();
      Node yesNode = map.getCurrent();
      expect(yesNode, isNotNull);
      expect(yesNode.getId(), 1);
      expect(yesNode.getQuestion(), 'Does he look up?');
      expect(yesNode.getDescription(), 'Knock on the door');
    });
    test('pick no', () {
      map.pickNo();
      Node noNode = map.getCurrent();
      expect(noNode, isNotNull);
      expect(noNode.getId(), 31);
      expect(noNode.getQuestion(), '-');
      expect(noNode.getDescription(), 'Think Hard - Firmly decide');
    });
  });
}
