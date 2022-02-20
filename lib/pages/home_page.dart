import 'package:flutter/material.dart';
import 'package:auto_test_app/utils/constants_string.dart';
import 'package:auto_test_app/widget/widgets.dart';

class HomePage extends StatefulWidget {
    static const String routeName = 'home_page';

  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
      children:  <Widget>[
          const Background(),
          _welcome(context,cWidth,cHeight),
          _textLong(cWidth,cHeight)
      ],
    );
  }


  Widget _welcome(BuildContext context, double width, double height){
      return  Align(
          alignment: Alignment.topCenter ,
          child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Container(
                  height: height *0.1,
                  width: width *0.7,
                  alignment:  Alignment.center,
                  margin: const EdgeInsets.only(left: 40.0, right: 40.0),
                  decoration: BoxDecoration(
                      color:   const Color(0xFF304FFE).withOpacity(0.5),
                      border: Border.all(color: Colors.blue,
                      ),
                      borderRadius:  const BorderRadius.all(Radius.circular(40.0),),
                  ),
                  child: const Text(ConstantString.welcome,style:  TextStyle(fontSize: 30.0,color: Colors.white))
              ),
          ),
      );
  }

  _textLong(double width, double height){

      return Center(
          child: Container (
              padding: const EdgeInsets.all(16.0),
              width: width*0.8,
              height: height*0.5,
              decoration: BoxDecoration(
                  color:   const Color(0xFF304FFE).withOpacity(0.5),
                  border: Border.all(color: Colors.blue,
                  ),
              ),
              child:  Column (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  <Widget>[
                      const Text(ConstantString.title,style:  TextStyle(fontSize: 18.0,color: Colors.white)),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(ConstantString.headerTitle,style:  TextStyle(fontSize: 15.0,color: Colors.white)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                                Text(ConstantString.option1,style:  TextStyle(fontSize: 15.0,color: Colors.white)),
                                Text(ConstantString.option2,style:  TextStyle(fontSize: 15.0,color: Colors.white)),
                                Text(ConstantString.option3,style:  TextStyle(fontSize: 15.0,color: Colors.white)),
                            ],
                        ),
                      ),

                  ],
              ),
          ),
      );
  }


}


