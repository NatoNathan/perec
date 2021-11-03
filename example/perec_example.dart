import 'dart:io';

import 'package:perec/perec.dart';

void main() {
  // Load Decision map
  LoadMap loadMap = LoadMap(mapFile: '../lib/data.csv');
  loadMap.load();
  final NodeMap decisionMap = loadMap.getMap();

  // Traverse through the decision map
  bool quit = false;
  while (!quit) {
    // Get the current node
    final Node currentNode = decisionMap.getCurrent();
    if (currentNode.getDescription() != '-') {
      print(currentNode.getDescription());
    }
    if (currentNode.getQuestion() != '-') {
      print(currentNode.getQuestion());
    }
    if (currentNode.getYesId() == 0 && 0 == currentNode.getNoId()) {
      print('You have reach a deadend\n (q: quit, y/n: continue)');
    }
    print('Enter y: yes, n: no or q: quit');
    stdout.write('> ');
    // Get the user's input
    final String? input = stdin.readLineSync();
    if (input == 'y') {
      decisionMap.pickYes();
    } else if (input == 'n') {
      decisionMap.pickNo();
    } else if (input == 'q') {
      quit = true;
    } else {
      print('Invalid input');
    }
    print('');
  }
}
