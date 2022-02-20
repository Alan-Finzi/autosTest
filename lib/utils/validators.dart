import 'dart:async';


class Validators{
    final validatorsMode = StreamTransformer<bool, bool>.fromHandlers(
        handleData: (mode,sink){
            if(mode  != null ){
                sink.add(mode);
            }else{
                sink.addError(false);
            }
        }
    );

}