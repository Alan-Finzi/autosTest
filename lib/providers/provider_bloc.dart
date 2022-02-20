import 'package:auto_test_app/blocs/bloc.dart';
import 'package:flutter/material.dart';
export 'package:auto_test_app/blocs/bloc.dart';



class ProviderBloc extends InheritedWidget{
    final loginBloc = Bloc();

    ProviderBloc({required Key key, required Widget child}) : super (key : key,child:child);

    @override
    bool updateShouldNotify(InheritedWidget oldWidget)=>true;

    static Bloc of ( BuildContext context ){
        return context.dependOnInheritedWidgetOfExactType<ProviderBloc>()!.loginBloc;
    }

}