import 'package:auto_test_app/pages/load_car_page.dart';
import 'package:auto_test_app/providers/provider_users.dart';
import 'package:auto_test_app/utils/constants_string.dart';
import 'package:auto_test_app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:auto_test_app/models/users_model.dart' as user;
class SearchPage extends StatefulWidget {
    static const String routeName = 'search_page';

  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

    final TextEditingController _controllerSearch = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    late List<Map<String, Object>> jsonData;
    late Future<List<user.User>> _value;
    bool showClient = false;
    final _myDuration = const Duration(seconds: 1);
    double _height = 0;
    late user.Car respCar;
    late user.User respCl;
    @override
    initState() {
        super.initState();
        _value = DataProvider().getValuePerson();
    }

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
                _searchColumn(cWidth,cHeight,context)
            ],
        );
    }

    Widget _searchColumn( double width, double height, BuildContext context){
        return   Stack(
            children: [
                Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                            AlignText(height:height ,width:width ,key: const Key('price'),value: ConstantString.searchPerson,align: Alignment.bottomCenter),
                            Center(
                                child: Container(
                                    padding:  const EdgeInsets.all(40),
                                    width: width*0.8,
                                    child: TestFormInput(prefixIconColor: Colors.white,textEditingController: _controllerSearch,
                                        onChanged: (value){},
                                        validator:(value) {
                                            if (value == null || value.isEmpty || value.length < 5) {return 'Ingrese dato correcto';}return null;},
                                        onSaved: (value){},key: const Key('TestFormInputPatente'),obscureText: true,maxLength: 10,hintText: '',autoFocus: false,fontSize: 20,showCursor: true,onTap: (){},textInputType:TextInputType.text ,textInputAction: TextInputAction.search,labelText: 'Ingrese DNI o Patente', focusBorderColor: Colors.blue,)
                                ),
                            ),
                            Center(child: WidgetButton(context: context,textButton: ConstantString.buttonSear,onPressedFunction:  _onPressedSearch ,)),

                        ],
                    ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: AnimatedContainer(
                        curve: Curves.easeInOutQuad,
                        decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                            border: Border(top: BorderSide(color: Colors.blue, width: 1,)),
                        ) ,
                        duration: _myDuration,
                        height:_height ,
                        child: showClient? _searchClient() : Container()
                    ),
                )
            ],
        );

    }


    _onPressedSearch() {
        if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Buscando Cliente o auto')),);
            setState(() {
                showClient= true;
                _height = MediaQuery.of(context).size.height * 0.6;
            });
        }
    }

    _onPressedCancel() {
            setState(() {showClient= false;_height = 0;});
    }

    Widget _searchClient(){
        return FutureBuilder<List<user.User>>(
            future: _value,
            initialData: null,
            builder: (
                BuildContext context,
                AsyncSnapshot<List<user.User>> snapshot,
                ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(color: Colors.black,));
                } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                        return const Text('Error');
                    } else if (snapshot.hasData) {
                        List<user.User> listUsers = snapshot.data!;
                        final resp = searchDniOrPatente(listUsers,_controllerSearch.text);
                        if(resp is user.User){
                            respCl = resp;
                            return SingleChildScrollView(
                                child: Column(
                                    children: [
                                        Column(children: _createCard(respCl)),
                                        Row(
                                            children: [
                                                Padding(
                                                    padding: const EdgeInsets.all(10.0),
                                                    child: WidgetButton(context: context,textButton: ConstantString.buttonLoadcar,onPressedFunction: () {Navigator.of(context).pushNamed(LoadCarPage.routeName, arguments: respCl); },),
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.all(10.0),
                                                    child: WidgetButton(context: context,textButton: ConstantString.buttonCancel,onPressedFunction:_onPressedCancel),
                                                ),
                                            ],
                                        ),
                                    ],
                                ),
                            );
                        }
                        if(resp is user.Car){
                            respCar = resp;
                            return SingleChildScrollView(
                                child: Column(
                                    children: [
                                        CardCar(key: const Key('Keycar'), car: resp),
                                        Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: WidgetButton(context: context,textButton: ConstantString.buttonCancel,onPressedFunction:_onPressedCancel),
                                        ),
                                    ],
                                ),
                            );
                        }
                        return SingleChildScrollView(
                            child: Column(
                                children: [
                                    const Center(child: Text('No existe cliente o auto')),
                                    Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: WidgetButton(context: context,textButton: ConstantString.buttonCancel,onPressedFunction:_onPressedCancel),
                                    ),
                                ],
                            ),
                        );
                    } else {
                        return const Center(child: Text('Sin info'));
                    }
                } else {
                    return Text('State: ${snapshot.connectionState}');
                }
            },
        );
    }




    List<Widget> _createCard(items){
        return  List<Widget>.generate(items.card.length, (int index) {
            return Column(
                children: [
                   CardCl(key: const Key('cl'), index: index, users: items),
                    const Divider(height: 0, color: Colors.grey,)
                ],
            );
        });
    }


    searchDniOrPatente( List<user.User> listUsers, String values){
        if(values == '' ){
            var itemUser = listUsers;
            return itemUser;
        }
        if(values.contains( RegExp(r"[a-z]"))){
            for(int i=0; i<listUsers.length;i++){
               final itemCard  =  listUsers.elementAt(i).card.firstWhereOrNull((element) => element.patente == values);
                if(itemCard!=null){
                    return itemCard;
                }
            }
                return null;
        }else{
            var itemUser =  listUsers.firstWhereOrNull((item) => item.id.toString() == values);
            return itemUser;
        }

    }

}


