import 'package:flutter/foundation.dart';

class UserModal extends ChangeNotifier {
  String? passport;
  String? certificate;
  String? license;
  String? image;

  int activeIndex = 0;
  int totalIndex = 4;
  int dotCount = 4;

  changeStep(int index) {
    activeIndex = index;
    notifyListeners();
  }
}
