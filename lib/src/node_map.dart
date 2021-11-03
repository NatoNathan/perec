import 'package:perec/src/node.dart';

class NodeMap {
  final Node _head;
  late Node _current;

  NodeMap(this._head) {
    _current = _head;
  }

  Node getCurrent() => _current;
  pickYes() {
    if (_current.getYesNode() == null) {
      throw Exception('No yes node');
    } else {
      _current = _current.getYesNode() as Node;
    }
  }

  pickNo() {
    if (_current.getNoNode() == null) {
      throw Exception('No \'no node\' found');
    } else {
      _current = _current.getNoNode() as Node;
    }
  }
}
