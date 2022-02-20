import 'package:auto_test_app/widget/widgets.dart';
import 'package:flutter/material.dart';

class PricesPage extends StatelessWidget {
    static const String routeName = 'prices_page';

  const PricesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          body: _bodyChild(context),
      );
  }

    Widget _bodyChild(BuildContext context) {
        double cWidth = MediaQuery.of(context).size.width;
        double cHeight = MediaQuery.of(context).size.height;
        return Stack(
            children:  const <Widget>[
                Background(),
            ],
        );
    }
}
