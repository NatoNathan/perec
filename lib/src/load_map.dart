import 'dart:io';

import 'package:perec/src/node.dart';
import 'package:perec/src/node_map.dart';

class LoadMap {
  late String _mapFile;
  final List<Node> _nodes = [];

  LoadMap({String mapFile = 'lib/data.csv'}) {
    _mapFile = mapFile;
  }

  load() {
    String data = File(_mapFile).readAsStringSync();
    var lines = data.split('\n');
    for (String line in lines) {
      var lineData = line.split(',');
      if (lineData.length == 5) {
        _nodes.add(Node(
          int.parse(lineData[0]),
          int.parse(lineData[1]),
          int.parse(lineData[2]),
          lineData[3],
          lineData[4],
        ));
      }
    }
  }

  _buildMap() {
    for (Node node in _nodes) {
      node.setYesNode(_findNode(node.getYesId()));
      node.setNoNode(_findNode(node.getNoId()));
    }
  }

  NodeMap getMap({int startId = 0}) {
    _buildMap();
    return NodeMap(_findNode(startId));
  }

  Node _findNode(int id) {
    for (Node node in _nodes) {
      if (node.getId() == id) {
        return node;
      }
    }
    throw Exception('Node not found');
  }
}
