import 'dart:async';

import 'package:auto_test_app/models/users_model.dart';
import 'package:auto_test_app/pages/start_page.dart';
import 'package:auto_test_app/utils/constants_string.dart';
import 'package:auto_test_app/widget/widgets.dart';
import 'package:flutter/material.dart';

class LoadCarPage extends StatefulWidget {
    static const String routeName = 'load_car_page';

    const LoadCarPage({Key? key}) : super(key: key);
  @override
  _LoadCarPageState createState() => _LoadCarPageState();
}

class _LoadCarPageState extends State<LoadCarPage> {

    final nameKey =  GlobalKey();
    final TextEditingController controllerMarca = TextEditingController();
    final TextEditingController controllerModelo = TextEditingController();
    final TextEditingController controllerYear = TextEditingController();
    final TextEditingController controllerColor = TextEditingController();
    final TextEditingController controllerPatente = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    bool load= false;

    @override
    Widget build(BuildContext context) {
        final Object? resp = ModalRoute.of(context)?.settings.arguments;
        return Scaffold(
            resizeToAvoidBottomInset: false,
            body: _bodyChild(context, resp as User),
        );
    }

    Widget _bodyChild(BuildContext context, User user) {
        double cWidth = MediaQuery.of(context).size.width;
        double cHeight = MediaQuery.of(context).size.height;
        return Stack(
            children:   <Widget>[
                const Background(),
                _formCl(cWidth,cHeight,user ),
            ],
        );
    }

    Widget _formCl(double width, double height,User user){
        return  Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
                children: [
                    AlignText(align: Alignment.topCenter,height: height,width: width,key: const Key('textLoad'),value: 'cliente : ' + user.lastName),
                    Form(
                        key: _formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Container(
                                    padding:  const EdgeInsets.all(5),
                                    width: width*0.8,
                                    child: TestFormInput(prefixIconColor: Colors.white,textEditingController: controllerMarca,
                                        onChanged: (value){},
                                        validator:(value) {
                                            if (value == null || value.isEmpty || value.length < 3) {return 'Ingrese dato correcto';}return null;},
                                        onSaved: (value){},key: const Key('TestFormInputmarca'),obscureText: true,maxLength: 10,hintText: '',autoFocus: false,fontSize: 20,showCursor: true,onTap: (){},textInputType:TextInputType.text ,textInputAction: TextInputAction.next,labelText: 'Ingrese Marca', focusBorderColor: Colors.blue,)
                                ),
                                Container(
                                    padding:  const EdgeInsets.all(5),
                                    width: width*0.8,
                                    child: TestFormInput(prefixIconColor: Colors.white,textEditingController: controllerModelo,
                                        onChanged: (value){},
                                        validator:(value) {
                                            if (value == null || value.isEmpty || value.length < 2) {return 'Ingrese dato correcto';}return null;},
                                        onSaved: (value){},key: const Key('TestFormInputModelo'),obscureText: true,maxLength: 10,hintText: '',autoFocus: false,fontSize: 20,showCursor: true,onTap: (){},textInputType:TextInputType.text ,textInputAction: TextInputAction.next,labelText: 'Ingrese Modelo', focusBorderColor: Colors.blue,)
                                ),
                                Container(
                                    padding:  const EdgeInsets.all(5),
                                    width: width*0.8,
                                    child: TestFormInput(prefixIconColor: Colors.white,textEditingController: controllerYear,
                                        onChanged: (value){},
                                        validator:(value) {
                                            if (value == null || value.isEmpty || value.length < 3) {return 'Ingrese dato correcto';}return null;},
                                        onSaved: (value){},key: const Key('TestFormInputyear'),obscureText: true,maxLength: 4,hintText: '',autoFocus: false,fontSize: 20,showCursor: true,onTap: (){},textInputType:TextInputType.number ,textInputAction: TextInputAction.next,labelText: 'Ingrese Año', focusBorderColor: Colors.blue,)
                                ),
                                Container(
                                    padding:  const EdgeInsets.all(5),
                                    width: width*0.8,
                                    child: TestFormInput(prefixIconColor: Colors.white,textEditingController: controllerColor,
                                        onChanged: (value){},
                                        validator:(value) {
                                            if (value == null || value.isEmpty || value.length < 3) {return 'Ingrese dato correcto';}return null;},
                                        onSaved: (value){},key: const Key('TestFormInputColor'),obscureText: true,maxLength: 20,hintText: '',autoFocus: false,fontSize: 20,showCursor: true,onTap: (){},textInputType:TextInputType.emailAddress ,textInputAction: TextInputAction.next,labelText: 'Ingrese Color', focusBorderColor: Colors.blue,)
                                ),
                                Container(
                                    padding:  const EdgeInsets.all(5),
                                    width: width*0.8,
                                    child: TestFormInput(prefixIconColor: Colors.white,textEditingController: controllerPatente,
                                        onChanged: (value){},
                                        validator:(value) {
                                            if (value == null || value.isEmpty || value.length < 4) {return 'Ingrese dato correcto';}return null;},
                                        onSaved: (value){},key: const Key('TestFormInputPatente'),obscureText: true,maxLength: 20,hintText: '',autoFocus: false,fontSize: 20,showCursor: true,onTap: (){},textInputType:TextInputType.emailAddress ,textInputAction: TextInputAction.next,labelText: 'Ingrese Patente', focusBorderColor: Colors.blue,)
                                ),
                                load?
                                    Container() :
                                Center(child: WidgetButton(context: context,textButton: ConstantString.buttonLoadcar,onPressedFunction:  _onPressedSearch ,)),
                            ],
                        ),
                    ),
                ],
            ),
        );
    }

    _onPressedSearch() {
        if (_formKey.currentState!.validate()) {
            setState(() {load = true;});
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cargando nuevo cliente y su auto')),);
            Timer(const Duration(seconds: 7), () =>  Navigator.of(context).pushNamed(StartPage.routeName));
        }
    }


}

