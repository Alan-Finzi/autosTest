import 'package:auto_test_app/utils/colors.dart';
import 'package:flutter/material.dart';


Future alertYesNo({required BuildContext context, required String title, required String body}){
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
            return AlertDialog(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                shape: Border.all(color: AppColors.appBlueInit,),
                title: Text(title),
                content: ListTile(title: Text(body)),
                actions: <Widget>[
                    TextButton(
                        child: const Text('offline'),
                        onPressed: () {Navigator.pop(context, false);},
                    ),
                    TextButton(
                        child: const Text('online'),
                        onPressed: () {Navigator.pop(context, true);},
                    )
                ],
            );
        },
    );
}

Future alertOk({required BuildContext context, required String title, required String body}){
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
            return AlertDialog(
                shape: Border.all(color: AppColors.buttonNext,),
                title: Text(title),
                content: Text(body),
                actions: <Widget>[
                    TextButton(
                        child: const Text('Ok'),
                        onPressed: () {Navigator.pop(context, 'OK');},
                    )
                ],
            );
        },
    );
}