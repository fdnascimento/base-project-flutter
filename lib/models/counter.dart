import 'package:mobx_study/components/base_model.dart';

class CounterModel extends BaseModelChangeNotifier {
  int _value = 0;
  int get count => _value;

  void increment() {
    this.setState(ViewState.Busy);
    _value++;    
    notifyListeners();    
  }
}
