import 'dart:io';

class InGame {
  static int valueCompareGreater(int input1, int input2) {
    int answer;
    if (input1 > input2) {
      answer = 1;
    } else {
      answer = 0;
    }
    return answer;
  }

  static int valueCompareEqual(int input1, int input2) {
    int answer;
    if (input1 == input2) {
      answer = 1;
    } else {
      answer = 0;
    }
    return answer;
  }

  static int valueCompareLess(int input1, int input2) {
    int answer;
    if (input1 < input2) {
      answer = 1;
    } else {
      answer = 0;
    }
    return answer;
  }
}
