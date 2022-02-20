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


class PlutoGridExamplePage extends StatefulWidget {
    const PlutoGridExamplePage({Key? key}) : super(key: key);

    @override
    State<PlutoGridExamplePage> createState() => _PlutoGridExamplePageState();
}

class _PlutoGridExamplePageState extends State<PlutoGridExamplePage> {
    final List<PlutoColumn> columns = <PlutoColumn>[
        PlutoColumn(
            title: 'Fecha',
            field: 'id',
            type: PlutoColumnType.text(),
        ),
        PlutoColumn(
            title: 'Name',
            field: 'name',
            type: PlutoColumnType.text(),
        ),
        PlutoColumn(
            title: 'Age',
            field: 'age',
            type: PlutoColumnType.number(),
        ),
        PlutoColumn(
            title: 'Role',
            field: 'role',
            type: PlutoColumnType.select(<String>[
                'Programmer',
                'Designer',
                'Owner',
            ]),
        ),
        PlutoColumn(
            title: 'Joined',
            field: 'joined',
            type: PlutoColumnType.date(),
        ),
        PlutoColumn(
            title: 'Working time',
            field: 'working_time',
            type: PlutoColumnType.time(),
        ),
    ];

    final List<PlutoRow> rows = [
        PlutoRow(
            cells: {
                'id': PlutoCell(value: 'user1'),
                'name': PlutoCell(value: 'Mike'),
                'age': PlutoCell(value: 20),
                'role': PlutoCell(value: 'Programmer'),
                'joined': PlutoCell(value: '2021-01-01'),
                'working_time': PlutoCell(value: '09:00'),
            },
        ),
        PlutoRow(
            cells: {
                'id': PlutoCell(value: 'user2'),
                'name': PlutoCell(value: 'Jack'),
                'age': PlutoCell(value: 25),
                'role': PlutoCell(value: 'Designer'),
                'joined': PlutoCell(value: '2021-02-01'),
                'working_time': PlutoCell(value: '10:00'),
            },
        ),
        PlutoRow(
            cells: {
                'id': PlutoCell(value: 'user3'),
                'name': PlutoCell(value: 'Suzi'),
                'age': PlutoCell(value: 40),
                'role': PlutoCell(value: 'Owner'),
                'joined': PlutoCell(value: '2021-03-01'),
                'working_time': PlutoCell(value: '11:00'),
            },
        ),
    ];

    /// columnGroups that can group columns can be omitted.
    final List<PlutoColumnGroup> columnGroups = [
        PlutoColumnGroup(title: 'Id', fields: ['id'], expandedColumn: true),
        PlutoColumnGroup(title: 'User information', fields: ['name', 'age']),
        PlutoColumnGroup(title: 'Status', children: [
            PlutoColumnGroup(title: 'A', fields: ['role'], expandedColumn: true),
            PlutoColumnGroup(title: 'Etc.', fields: ['joined', 'working_time']),
        ]),
    ];

    /// [PlutoGridStateManager] has many methods and properties to dynamically manipulate the grid.
    /// You can manipulate the grid dynamically at runtime by passing this through the [onLoaded] callback.
    late final PlutoGridStateManager stateManager;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Container(
                padding: const EdgeInsets.all(15),
                child: PlutoGrid(
                    columns: columns,
                    rows: rows,
                    columnGroups: columnGroups,
                    onLoaded: (PlutoGridOnLoadedEvent event) {
                        stateManager = event.stateManager;
                    },
                    onChanged: (PlutoGridOnChangedEvent event) {
                        print(event);
                    },
                    configuration: const PlutoGridConfiguration(
                        enableColumnBorder: true,
                    ),
                ),
            ),
        );
    }
}