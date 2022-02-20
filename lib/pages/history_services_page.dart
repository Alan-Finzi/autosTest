import 'package:auto_test_app/models/services_model.dart';
import 'package:auto_test_app/providers/provider_users.dart';
import 'package:auto_test_app/utils/constants_string.dart';
import 'package:auto_test_app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
class HistoryServicesPage extends StatefulWidget {
    static const String routeName = 'history_services_page';

    const HistoryServicesPage({Key? key}) : super(key: key);

    @override
    State<HistoryServicesPage> createState() => _HistoryServicesPageState();
}

class _HistoryServicesPageState extends State<HistoryServicesPage> {

    final TextEditingController _controllerSearch = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    late List<Map<String, Object>> jsonData;
    bool showClient = false;
    final _myDuration = const Duration(seconds: 1);
    double _height = 0;
    late Service respCl;

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
                            AlignText(height:height ,width:width ,key: const Key('price'),value: ConstantString.history,align: Alignment.bottomCenter),
                            Center(
                                child: Container(
                                    padding:  const EdgeInsets.all(40),
                                    width: width*0.8,
                                    child: TestFormInput(prefixIconColor: Colors.white,textEditingController: _controllerSearch,
                                        onChanged: (value){},
                                        validator:(value) {
                                            if (value == null || value.isEmpty || value.length < 5) {return 'Ingrese dato correcto';}return null;},
                                        onSaved: (value){},key: const Key('TestFormInputPatente'),obscureText: true,maxLength: 10,hintText: '',autoFocus: false,fontSize: 20,showCursor: true,onTap: (){},textInputType:TextInputType.number ,textInputAction: TextInputAction.search,labelText: 'Ingrese DNI', focusBorderColor: Colors.blue,)
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
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Buscando Cliente')),);
            setState(() {
                showClient= true;
                _height = MediaQuery.of(context).size.height * 0.4;
            });
        }
    }

    _onPressedCancel() {
        setState(() {showClient= false;_height = 0;});
    }

    Widget _searchClient(){
        return FutureBuilder<List<Service>>(
            future:  DataProvider().getValueServices(),
            initialData: null,
            builder: (
                BuildContext context,
                AsyncSnapshot<List<Service>> snapshot,
                ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(color: Colors.black,));
                } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                        return const Text('Error');
                    } else if (snapshot.hasData) {
                        List<Service> listUsers = snapshot.data!;
                        final resp = searchDniOrPatente(listUsers,_controllerSearch.text);
                        if(resp != null){
                            respCl = resp;
                            return SingleChildScrollView(
                                child: Column(
                                    children: [
                                        Column(children: _createCard(respCl)) ,
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


    List<Widget> _createCard(Service items){
        return  List<Widget>.generate(items.service.length, (int index) {
            return Column(
                children: [
                    CardClService(key: const Key('cl'), index: index, users: items),
                    const Divider(height: 0, color: Colors.grey,)
                ],
            );
        });
    }



    searchDniOrPatente( List<Service> listUsers, String values){
        if(values == null||values == '' ){
            var itemUser = listUsers;
            return itemUser;
        }
        if(values.contains( RegExp(r"[a-z]"))){
            return listUsers;
        }else{
            var itemUser =  listUsers.firstWhereOrNull((item) => item.id.toString() == values);
            return itemUser;
        }
    }

}


