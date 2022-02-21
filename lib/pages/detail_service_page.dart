import 'package:auto_test_app/models/services_model.dart';
import 'package:flutter/material.dart';
import 'package:auto_test_app/utils/constants_string.dart';
import 'package:auto_test_app/widget/widgets.dart';
import 'package:pluto_grid/pluto_grid.dart';

class DetailServicePage extends StatefulWidget {
    static const String routeName = 'detail_service_page';

    const DetailServicePage({Key? key}) : super(key: key);
    @override
    _DetailServicePageState createState() => _DetailServicePageState();
}

class _DetailServicePageState extends State<DetailServicePage> {

    @override
    Widget build(BuildContext context) {
        final Object? resp = ModalRoute.of(context)?.settings.arguments;
        return Scaffold(
            resizeToAvoidBottomInset: false,
            body: _bodyChild(context, resp as ServiceElement),
        );
    }

    Widget _bodyChild(BuildContext context, ServiceElement service) {
        double cWidth = MediaQuery.of(context).size.width;
        double cHeight = MediaQuery.of(context).size.height;
        return Stack(
            children:  <Widget>[
                const Background(),
                _welcome(context,cWidth,cHeight),
                //PlutoGridExamplePage(),
                _detail(service)
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
                    child: const Text(ConstantString.history,style:  TextStyle(fontSize: 18.0,color: Colors.white))
                ),
            ),
        );
    }

    _detail(ServiceElement service){
        final List<PlutoColumn> columns = <PlutoColumn>[
            PlutoColumn(
                title: 'Tarea',
                field: 'id',
                type: PlutoColumnType.text(),
            ),
            PlutoColumn(
                title: ' Se realizo ',
                field: 'tarea',
                type: PlutoColumnType.text(),
            ),
        ];

        List<PlutoRow> rows = [
            PlutoRow(
                cells: {
                    'tarea': PlutoCell(value: service.cambioDeAceite),
                    'id': PlutoCell(value:'Cambio de Aceite'),
                },
            ),
            PlutoRow(
                cells: {
                    'tarea': PlutoCell(value: service.cambioDeCorrea),
                    'id': PlutoCell(value:'Cambio de Correa'),
                },

            ),
            PlutoRow(
                cells: {
                    'tarea': PlutoCell(value: service.cambioDeFiltro),
                    'id': PlutoCell(value:'Cambio de Filtro'),
                },

            ),
            PlutoRow(
                cells: {
                    'tarea': PlutoCell(value: service.pintura),
                    'id': PlutoCell(value:'Cambio de pintura'),
                },
            ),
        ];
        return Container(

            padding: const EdgeInsets.all(15),
            child: PlutoGrid(
                columns: columns,
                rows: rows,

                configuration: const PlutoGridConfiguration(
                    enableColumnBorder: true,
                ),
            ),
        );

    }
}
