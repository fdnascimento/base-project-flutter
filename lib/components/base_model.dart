import 'package:flutter/material.dart';

enum ViewState { Idle, Busy, Error }

class BaseModelChangeNotifier with ChangeNotifier {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
