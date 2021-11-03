import 'dart:io';

import 'package:perec/perec.dart';

void main() {
  // Load Decision map
  LoadMap loadMap = LoadMap();
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
    if (currentNode.getYesId() == currentNode.getNoId()) {
      print('You have reach a deadend\nContinue?');
    }
    print('Enter y: yes, n: no or q: quit');
    print('> ');
    // Get the user's input
    final String? input = stdin.readLineSync();
    if (input == 'y') {
      decisionMap.pickYes();
    } else if (input == 'n') {
      if (currentNode.getYesId() != currentNode.getNoId()) {
        decisionMap.pickNo();
      } else {
        quit = true;
      }
    } else if (input == 'q') {
      quit = true;
    } else {
      print('Invalid input');
    }
  }
}
