import 'package:flutter/material.dart';
import 'draw.dart';

class GameData with ChangeNotifier {
  int _score = 0;
  String _returnThis = '';
  String _card = 'assets/cards/backcard.jpg';
  List<String> _outCome = ['Your Wrong', 'Your Right', ''];
  int _card1 = DrawCard.draw();
  int _card2 = DrawCard.draw();

  String get outCome => _returnThis;
  int get playerScore => _score;
  String get cardFlip => _card;
  int get index1 => _card1;
  int get index2 => _card2;

  set index1Reset(int data) {
    _card1 = data;
    notifyListeners();
  }

  set index2Reset(int data) {
    _card2 = data;
    notifyListeners();
  }

  set scorePlayer(int data) {
    _score = data;
    notifyListeners();
  }

  set flipCard(int data) {
    _card = DrawCard.imageCard(data);
    notifyListeners();
  }

  set toBackCard(String data) {
    _card = data;
    notifyListeners();
  }

  set outComeState(int data) {
    _returnThis = _outCome[data];
    notifyListeners();
  }
}
