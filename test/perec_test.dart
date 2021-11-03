import 'package:perec/perec.dart';
import 'package:test/test.dart';

void main() {
  group('Node tests', () {
    test('Node creation', () {
      final node = Node(0, 2, 3, 'test_question', 'test_description');
      expect(node.getId(), 0);
      expect(node.getYesId(), 2);
      expect(node.getNoId(), 3);
      expect(node.getQuestion(), 'test_question');
      expect(node.getDescription(), 'test_description');
    });

    test('Node creation with null values', () {
      final node = Node(0, 0, 0, '', '');
      expect(node.getId(), 0);
      expect(node.getYesId(), 0);
      expect(node.getNoId(), 0);
      expect(node.getQuestion(), '');
      expect(node.getDescription(), '');
    });

    test('Node with yes and no Nodes', () {
      final node = Node(0, 2, 3, 'test_question', 'test_description');
      final yesNode =
          Node(2, 4, 5, 'test_yes_question', 'test_yes_description');
      final noNode = Node(3, 6, 7, 'test_no_question', 'test_no_description');
      node.setYesNode(yesNode);
      node.setNoNode(noNode);
      expect(node.getYesNode(), yesNode);
      expect(node.getNoNode(), noNode);
    });
  });

  group('Node map Tests', () {
    final node = Node(0, 2, 3, 'test_question', 'test_description');
    final yesNode = Node(2, 4, 5, 'test_yes_question', 'test_yes_description');
    final noNode = Node(3, 6, 7, 'test_no_question', 'test_no_description');
    node.setYesNode(yesNode);
    yesNode.setNoNode(noNode);
    final nodeMap = NodeMap(node);
    test('Test Pick yes', () {
      nodeMap.pickYes();
      expect(nodeMap.getCurrent().getId(), 2);
      expect(nodeMap.getCurrent().getYesId(), 4);
      expect(nodeMap.getCurrent().getNoId(), 5);
      expect(nodeMap.getCurrent().getQuestion(), 'test_yes_question');
      expect(nodeMap.getCurrent().getDescription(), 'test_yes_description');
    });

    test('Test Pick no', () {
      nodeMap.pickNo();
      expect(nodeMap.getCurrent().getId(), 3);
      expect(nodeMap.getCurrent().getYesId(), 6);
      expect(nodeMap.getCurrent().getNoId(), 7);
      expect(nodeMap.getCurrent().getQuestion(), 'test_no_question');
      expect(nodeMap.getCurrent().getDescription(), 'test_no_description');
    });
    test('Test Pick No when no node is present', () {
      expect(() => nodeMap.pickNo(), throwsException);
    });
  });
}
