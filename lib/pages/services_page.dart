import 'package:auto_test_app/models/users_model.dart';
import 'package:auto_test_app/pages/start_page.dart';
import 'package:auto_test_app/utils/constants_string.dart';
import 'package:auto_test_app/widget/alerts.dart';
import 'package:auto_test_app/widget/widgets.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';

class ServicesPage extends StatefulWidget {
  static const String routeName = 'services_page';

  const ServicesPage({Key? key}) : super(key: key);
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  double priceFinal=0.00;

  @override
  Widget build(BuildContext context) {
    final Object? resp = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _bodyChild(context, resp as Car),
    );
  }

  Widget _bodyChild(BuildContext context, Car car) {
    double cWidth = MediaQuery.of(context).size.width;
    double cHeight = MediaQuery.of(context).size.height;
    return Stack(
      children:  <Widget>[
        const Background(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: _titleCar(car,cHeight,cWidth),
            ),
            SingleChildScrollView(child: Container(child: _listCheck(car))),
            _textPriceButton('Confirmar Precio final: $priceFinal' ,cHeight,cWidth ),
          ],
        ),

      ],
    );
  }

  Widget _titleCar( Car car,double height, double width){
    return  AlignText(height:height ,width:width ,key: const Key('titleCar'),value:' Servicio para '  + car.patente,align: Alignment.topCenter);
  }

  Widget _listCheck( Car car) {
    return CustomCheckBoxGroup(
      buttonTextStyle: const ButtonTextStyle(
        selectedColor: Colors.white,
        unSelectedColor: Colors.black,
        textStyle: TextStyle(
          fontSize: 22,
        ),
      ),
      autoWidth: true,
      enableButtonWrap: true,
      wrapAlignment: WrapAlignment.center,
      unSelectedColor: Theme.of(context).canvasColor,
      buttonLables: car.color == 'gris'? ConstantString.listValueUnpainted : ConstantString.listValuePainted,
      buttonValuesList:  car.color == 'gris'? ConstantString.listValuePriceUnpainted : ConstantString.listValuePricePainted,
      checkBoxButtonValues: (values) {
        List<int> list = values.cast<int>();
        setState(() {priceFinal = list.fold(0, (p, c) => p + c);});
      },
      defaultSelected: const ["Cambio de Aceite"],
      horizontal: true,
      width: 50,
      selectedColor: Theme.of(context).colorScheme.secondary,
      padding: 20,
      enableShape: true,

    );
  }

  Widget _textPriceButton(String value, double height, double width){
    return   GestureDetector(
        onTap:() async {
         await alertOk(context: context,body: value , title: 'Pedido de servicio');
         Navigator.of(context).pushNamed(StartPage.routeName);
         } ,
        child: AlignText(height:height ,width:width ,key: const Key('price'),value: value,align: Alignment.bottomCenter)
    );
  }
}

