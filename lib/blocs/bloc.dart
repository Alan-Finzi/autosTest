import 'dart:async';
import 'package:auto_test_app/utils/validators.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:rxdart/rxdart.dart';



class Bloc with Validators{
    final _modeController    = BehaviorSubject<bool>();

    //get value to Stream
    Stream<bool> get modeStream     => _modeController.stream.transform(validatorsMode);

    //insert value to Stream
    Function(bool) get changeMode    => _modeController.sink.add;

    dispose(){
        _modeController.close();
    }
}