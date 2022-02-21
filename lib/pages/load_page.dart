import 'package:auto_test_app/models/users_model.dart';
import 'package:auto_test_app/utils/constants_string.dart';
import 'package:auto_test_app/widget/widgets.dart';
import 'package:flutter/material.dart';

import 'load_car_page.dart';

class LoadPage extends StatefulWidget {
    static const String routeName = 'load_page';

  const LoadPage({Key? key}) : super(key: key);
  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {


    final nameKey =  GlobalKey();
    final TextEditingController controllerFirstName = TextEditingController();
    final TextEditingController controllerLastName = TextEditingController();
    final TextEditingController controllerId = TextEditingController();
    final TextEditingController controllerEmail = TextEditingController();
    final TextEditingController controllerGender = TextEditingController();
    final _formKey = GlobalKey<FormState>();
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
          children:   <Widget>[
              const Background(),
              _formCl(cWidth,cHeight),
          ],
      );
  }

    Widget _formCl(double width, double height,){
        return  Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
                children: [
                    AlignText(align: Alignment.topCenter,height: height,width: width,key: const Key('textLoad'),value: ConstantString.titleNewPerson),
                    Form(
                        key: _formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Container(
                                    padding:  const EdgeInsets.all(5),
                                    width: width*0.8,
                                    child: TestFormInput(prefixIconColor: Colors.white,textEditingController: controllerFirstName,
                                        onChanged: (value){},
                                        validator:(value) {
                                            if (value == null || value.isEmpty || value.length < 4) {return 'Ingrese dato correcto';}return null;},
                                        onSaved: (value){},key: const Key('TestFormInputFirstName'),obscureText: true,maxLength: 10,hintText: '',autoFocus: false,fontSize: 20,showCursor: true,onTap: (){},textInputType:TextInputType.text ,textInputAction: TextInputAction.next,labelText: 'Ingrese Nombre', focusBorderColor: Colors.blue,)
                                ),
                                Container(
                                    padding:  const EdgeInsets.all(5),
                                    width: width*0.8,
                                    child: TestFormInput(prefixIconColor: Colors.white,textEditingController: controllerLastName,
                                        onChanged: (value){},
                                        validator:(value) {
                                            if (value == null || value.isEmpty || value.length < 5) {return 'Ingrese dato correcto';}return null;},
                                        onSaved: (value){},key: const Key('TestFormInputLastName'),obscureText: true,maxLength: 10,hintText: '',autoFocus: false,fontSize: 20,showCursor: true,onTap: (){},textInputType:TextInputType.text ,textInputAction: TextInputAction.next,labelText: 'Ingrese Apellido', focusBorderColor: Colors.blue,)
                                ),
                                Container(
                                    padding:  const EdgeInsets.all(5),
                                    width: width*0.8,
                                    child: TestFormInput(prefixIconColor: Colors.white,textEditingController: controllerId,
                                        onChanged: (value){},
                                        validator:(value) {
                                            if (value == null || value.isEmpty || value.length < 5) {return 'Ingrese dato correcto';}return null;},
                                        onSaved: (value){},key: const Key('TestFormInputId'),obscureText: true,maxLength: 10,hintText: '',autoFocus: false,fontSize: 20,showCursor: true,onTap: (){},textInputType:TextInputType.number ,textInputAction: TextInputAction.next,labelText: 'Ingrese DNI', focusBorderColor: Colors.blue,)
                                ),
                                Container(
                                    padding:  const EdgeInsets.all(5),
                                    width: width*0.8,
                                    child: TestFormInput(prefixIconColor: Colors.white,textEditingController: controllerEmail,
                                        onChanged: (value){},
                                        validator:(value) {
                                            if (value == null || value.isEmpty || value.length < 5) {return 'Ingrese dato correcto';}return null;},
                                        onSaved: (value){},key: const Key('TestFormInputEmail'),obscureText: true,maxLength: 20,hintText: '',autoFocus: false,fontSize: 20,showCursor: true,onTap: (){},textInputType:TextInputType.emailAddress ,textInputAction: TextInputAction.next,labelText: 'Ingrese Correo', focusBorderColor: Colors.blue,)
                                ),
                                Container(
                                    padding:  const EdgeInsets.all(5),
                                    width: width*0.8,
                                    child: TestFormInput(prefixIconColor: Colors.white,textEditingController: controllerGender,
                                        onChanged: (value){},
                                        validator:(value) {
                                            if (value == null || value.isEmpty || value.length < 5) {return 'Ingrese dato correcto';}return null;},
                                        onSaved: (value){},key: const Key('TestFormInpuGender'),obscureText: true,maxLength: 10,hintText: '',autoFocus: false,fontSize: 20,showCursor: true,onTap: (){},textInputType:TextInputType.text ,textInputAction: TextInputAction.next,labelText: 'Ingrese Genero', focusBorderColor: Colors.blue,)
                                ),
                                Center(child: WidgetButton(context: context,textButton: ConstantString.buttonLoad,onPressedFunction:  _onPressedSearch ,)),
                            ],
                        ),
                    ),
                ],
            ),
        );
    }

    _onPressedSearch() {
        if (_formKey.currentState!.validate()) {
            List<Car> _list = <Car>[];
            User _user = User(id: int.parse(controllerId.text), firstName: controllerFirstName.text, lastName: controllerLastName.text, email: controllerEmail.text, gender: controllerGender.text, card: _list);
            Navigator.of(context).pushNamed(LoadCarPage.routeName, arguments: _user);
        }
    }

}
