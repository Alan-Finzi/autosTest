import 'package:auto_test_app/models/users_model.dart';
import 'package:auto_test_app/pages/services_page.dart';
import 'package:auto_test_app/pages/start_page.dart';
import 'package:auto_test_app/utils/constants_string.dart';
import 'package:auto_test_app/widget/alerts.dart';
import 'package:auto_test_app/widget/widgets.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class DetailCarPage extends StatefulWidget {
    static const String routeName = 'detail_car_page';
  const DetailCarPage({Key? key}) : super(key: key);
    @override
  _DetailCarPageState createState() => _DetailCarPageState();
}

class _DetailCarPageState extends State<DetailCarPage> {


    @override
    Widget build(BuildContext context) {
        final Object? resp = ModalRoute.of(context)?.settings.arguments;
        return
            Stack(
                children: [
                    const Background(),
                    Center(
                        child: SingleChildScrollView(
                            child: Column(
                                children: [
                                    CardFormUser(car:resp as Car,key: const Key('cardForm'),),
                                    WidgetButton(context: context,onPressedFunction: (){ Navigator.of(context).pushNamed(ServicesPage.routeName,arguments: resp);},
                                        textButton: ConstantString.buttonConfirm,)
                                ],
                            ),
                        ),
                    ),
                ],
            );
    }
}



class CardFormUser extends StatefulWidget {
    final Car car;
    const CardFormUser({required Key key, required this.car,}) : super(key: key);
    @override
    _CardFormUserState createState() => _CardFormUserState();
}

class _CardFormUserState extends State<CardFormUser> {
    bool _showEdit = false;
    final _ctrMarca         = TextEditingController();
    final _ctrModelo     = TextEditingController();
    final _ctrColor      = TextEditingController();
    final _ctrPatente   = TextEditingController();
    final _ctrYear      = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Card(
            child: ExpansionTileCard(
                leading: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: (){setState(() {_showEdit = !_showEdit;});}
                ),
                title: const Text("Información del Auto",),
                children: <Widget>[
                    ListTile(
                        title: const Text('Patente',),
                        subtitle: _showEdit ? TextFormField(
                            decoration: InputDecoration(hintText:  widget.car.patente),
                            controller: _ctrPatente,
                        ) : Text(widget.car.patente),
                    ),
                    ListTile(
                        title: const Text('Modelo',),
                        subtitle: _showEdit ? TextFormField(
                            decoration: InputDecoration(hintText:widget.car.modelo),
                            controller: _ctrModelo,
                        ) : Text(widget.car.modelo),
                    ),
                    ListTile(
                        title: const Text('Marca',),
                        subtitle: _showEdit ? TextFormField(
                            decoration: InputDecoration(hintText:  widget.car.marca),
                            controller: _ctrMarca,
                        ) : Text(widget.car.marca),
                    ),
                    ListTile(
                        title: const Text('Color',),
                        subtitle: _showEdit ? TextFormField(
                            decoration: InputDecoration(hintText:  widget.car.color),
                            controller: _ctrColor,
                        ) : Text(widget.car.color),
                    ),
                    ListTile(
                        title: const Text('Año',),
                        subtitle: _showEdit ? TextFormField(
                            decoration: InputDecoration(hintText:  widget.car.year),
                            controller: _ctrYear,
                        ) : Text(widget.car.year),
                    ),
                    _showEdit ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RaisedButton(
                            textColor: Colors.white,
                            color: Colors.blue,
                            child: const Text('Guardar'),
                            onPressed: () async {
                                alertOk(context: context,body:  'OK', title: 'El cambio se realizó correctamente');
                                setState((){ _showEdit = !_showEdit; });
                                if(_ctrMarca.text!=''){widget.car.marca = _ctrMarca.text;}
                                if(_ctrModelo.text!=''){widget.car.modelo = _ctrModelo.text;}
                                if(_ctrColor.text!=''){widget.car.color = _ctrColor.text;}
                                if(_ctrPatente.text!=''){widget.car.patente = _ctrPatente.text;}
                                if(_ctrYear.text!=''){widget.car.year = _ctrYear.text;}
                            }
                        ),
                          RaisedButton(
                              textColor: Colors.white,
                              color: Colors.blue,
                              child: const Text('Eliminar Auto'),
                              onPressed: () async {
                                  await alertOk(context: context,body:  'OK', title: 'Se borro el auto');
                                  Navigator.of(context).pushNamed(StartPage.routeName);
                              }
                          )
                      ],
                    ) : Container(),
                ]
            )
        );
    }
}