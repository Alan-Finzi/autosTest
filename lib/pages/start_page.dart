import 'package:auto_test_app/widget/widget_curve.dart';
import 'package:flutter/material.dart';


class StartPage extends StatelessWidget {
    static const String routeName = 'start_page';

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            body: _bodyChild(context)
        );
    }

    Widget _bodyChild(BuildContext context){
        return Stack(
            children: <Widget>[
                _background(),
                _buttonNext(context)
            ],
        );
    }


    Widget _background(){
        return Container(
            width: double.infinity,
            height: double.infinity,
            color: 	Colors.white,
            child: const Image(
                image: AssetImage('assets/images/start_page.png'),
                fit: BoxFit.cover,
            ),
        );
    }

    Widget _buttonNext(BuildContext context){
        return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Container(
                padding: const EdgeInsets.only(bottom: 60.0),
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(AppColors.buttonNext),
                    ),
                    child:  WidgetRipplesAnimation(width:200,height:50,borderRadiusSize: 20,child: Text('Click aquí para ingresar', style: TextStyle(fontSize: 15.0,color: Colors.white),) ,colorInit: AppColors.appBlueInit , key: Key("_buttonNext"), colorFinish: AppColors.appBlueFinish,),
                    onPressed: (){
                        Navigator.pushNamed(context, HomePage.routeName);
                    },
                )
            ),
        );
    }
}