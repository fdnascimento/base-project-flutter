import 'package:flutter/material.dart';
import 'package:mobx_study/components/base_model.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseModelChangeNotifier> extends StatelessWidget {
  final child;

  const BaseView({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<T>(context);
    switch (model.state) {
      case ViewState.Busy:
        return _buildProgressBar();
      case ViewState.Idle:
        return child;
      case ViewState.Error:
        return _buildError();
      default:
        return Container();
    }
  }

  Widget _buildError() {
    return Container();
  }

  Widget _buildProgressBar() {
    return Scaffold(
      appBar: AppBar(
        title: Text("App title"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(
                height: 30,
              ),
              Text(
                "Estamos procesando seu pedido",
                style: TextStyle(color: Colors.blue, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
