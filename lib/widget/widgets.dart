import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_test_app/models/services_model.dart';
import 'package:auto_test_app/pages/detail_car_page.dart';
import 'package:auto_test_app/pages/detail_service_page.dart';
import 'package:auto_test_app/utils/colors.dart';
import 'package:auto_test_app/models/users_model.dart' as user;
import 'package:auto_test_app/utils/constants_string.dart';
import 'package:flutter/material.dart';


class AutosAppBar extends StatefulWidget {

    final BuildContext context;
    final String title;
    final String fontFamily;
    final Widget leading;
    final List<Widget> actionsAvailables;
    final bool showHelp;
    final Color color;
    final bool shadow;

    const AutosAppBar({required this.context,  required this.title, required this.actionsAvailables,  required this.fontFamily, required this.leading, required this.showHelp, required this.color, this.shadow = true});

    @override
    _AutosAppBarState createState() => _AutosAppBarState();
}

class _AutosAppBarState extends State<AutosAppBar> {
    @override
    Widget build(BuildContext context) {
        return AppBar(
            title: Text(widget.title, style: TextStyle(fontFamily: widget.fontFamily, fontSize: 20.0)),
            backgroundColor: Colors.blue,
            centerTitle: false,
            actions: _actionsAvailables( actions: widget.actionsAvailables, showHelp: widget.showHelp),
            leading: widget.leading,
            shadowColor: widget.shadow ? Colors.black : Colors.transparent,
        );
    }

    List<Widget> _actionsAvailables({ required List<Widget> actions, required bool showHelp} ){
        if(showHelp==true){
            actions.add(_help());
        }
        return actions;
    }


    Widget _help(){
        return GestureDetector(
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: const Icon(Icons.help_outline),
            ),
        );
    }


}




Widget appBar({required BuildContext context, required bool showHelp, required String title, required bool showNotifications, required String fontFamily,  required List<Widget> actionsAvailables, required Widget leading, required Color color, bool shadow = false}){
    if (fontFamily.isEmpty){ fontFamily = "ComicSans";}
    return PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // here the desired height
        child: TextScaleFactorClamper(
            child: AutosAppBar(
                context: context,
                title: title,
                color: color,
                actionsAvailables: actionsAvailables,
                fontFamily: fontFamily,
                leading: leading,
                showHelp: showHelp ,
                shadow: shadow,
            ),
        )
    );
}



class TextScaleFactorClamper extends StatelessWidget {
    const TextScaleFactorClamper({required this.child});
    final Widget child;

    @override
    Widget build(BuildContext context) {
        final mediaQueryData = MediaQuery.of(context);
        final constrainedTextScaleFactor =
        mediaQueryData.textScaleFactor.clamp(1.0, 1.0);
        return MediaQuery(
            data: mediaQueryData.copyWith(
                textScaleFactor: constrainedTextScaleFactor,
            ),
            child: child,
        );
    }
}

class Background extends StatelessWidget {
    const Background({
        Key? key,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Container(
            width: double.infinity,
            height: double.infinity,
            color: 	Colors.white,
            child: const Image(
                image: AssetImage('assets/images/start_page.jpg'),
                fit: BoxFit.cover,
            ),
        );
    }
}



class WidgetButton extends StatelessWidget {
    final Function onPressedFunction;
    final String textButton;
    final BuildContext context;
    const WidgetButton({
        Key? key, required this.onPressedFunction, required this.textButton, required this.context,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return ElevatedButton(
            style: ButtonStyle(shape: MaterialStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0),),
                )
            ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor:  MaterialStateProperty.all<Color>(AppColors.appBlueInit),
            ),
            child:   Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                child: AutoSizeText(textButton, style: const TextStyle(fontSize: 20.0,color: Colors.white),),
            ),
            onPressed:(){ onPressedFunction();},
        );
    }
}


class TestFormInput extends StatefulWidget {
    final bool obscureText;
    final bool autoFocus;
    final bool showCursor;
    final int maxLength;
    final Color prefixIconColor;
    final String hintText;
    final String labelText;
    final FormFieldValidator<String>? validator;
    final FormFieldSetter<String>? onSaved;
    final ValueChanged<String>? onChanged;
    final GestureTapCallback? onTap;
    final TextInputAction textInputAction;
    final TextInputType textInputType;
    final TextEditingController textEditingController;
    final Color focusBorderColor;
    final double fontSize;

    const TestFormInput({required Key key, required this.textInputType, required this.validator, required this.onSaved,  required this.prefixIconColor, required this.hintText, required this.obscureText, required this.autoFocus,  required this.textEditingController, required this.onChanged, required this.showCursor, required this.onTap, required this.textInputAction, required this.focusBorderColor, required this.maxLength, required this.fontSize, required this.labelText, }): super(key: key);
    @override
    _TestFormInputState createState() => _TestFormInputState();
}

class _TestFormInputState extends State<TestFormInput> {


    @override
    Widget build(BuildContext context) {
      return  TextFormField(
          controller: widget.textEditingController,
          cursorColor: Colors.black,
          maxLines: 1,
          validator: widget.validator,
          maxLength: widget.maxLength,
          textInputAction: widget.textInputAction,
          keyboardType: widget.textInputType,
          style: const TextStyle(color: Colors.white, fontSize:  20.0 ),
          onChanged: widget.onChanged,
          onTap: widget.onTap,
            decoration: InputDecoration(
                labelText: widget.labelText,
                hintText: widget.hintText,
                filled: true,
                fillColor: const Color(0xFF304FFE).withOpacity(0.5),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                        color: Colors.green,
                        width: 1.0,
                    ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                        color: Colors.purple,
                        width: 2.0,
                    ),
                ),
            ),
            );


    }
}

InputDecoration inputDecoration({Color backgroundColor = Colors.white24, required String hintText, Color hintTextColor = Colors.grey,  required Color focusBorderColor, required String labelText,required String errorText}){
    return InputDecoration(
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
                color: Colors.purple,
                width: 2.0,
            ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
                color: Colors.green,
                width: 3.0,
            ),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
        filled: true,
        fillColor: backgroundColor,
        hintText: hintText,
        hintStyle: TextStyle(color: hintTextColor, fontSize: 18),
        hintMaxLines: 1,
        errorText: errorText ,
    );
}


class CardCar extends StatelessWidget {
    final user.Car car;

    const CardCar({required Key key, required this.car,}) : super(key: key);

    @override
    Widget build(BuildContext context) {

        return Column(
            children: <Widget>[
                Container(
                    color: Colors.blue,
                    child: ListTile(
                        title:const Text('AUTO: ', style: TextStyle(color:  Colors.white )),
                        subtitle:Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                            Text(ConstantString.textPatente + car.patente, style: const TextStyle(color:  Colors.white )),
                                            Text(ConstantString.textMarca +car.marca ,style: const TextStyle(color:  Colors.white)),
                                        ],
                                    ),

                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                            Text(ConstantString.textModelo +car.modelo ,style: const TextStyle(color:  Colors.white)),
                                            Text(ConstantString.textColor +car.color ,style: const TextStyle(color:  Colors.white)),

                                        ],
                                    ),
                                    Text(ConstantString.textYear +car.year ,style: const TextStyle(color:  Colors.white)),
                                ],
                            ),
                        ),
                        trailing: const Padding(
                            padding: EdgeInsets.only(top: 22),
                            child: Icon(Icons.navigate_next,color: Colors.white,size: 50),
                        ),
                        onTap: ()  {
                            Navigator.of(context).pushNamed(DetailCarPage.routeName,arguments:car);
                        },
                    ),
                ),
            ],
        );
    }
}


class CardCl extends StatelessWidget {
    final int index;
    final user.User users;

    const CardCl({required Key key, required this.index,  required this.users, }) : super(key: key);

    @override
    Widget build(BuildContext context) {

        return Column(
            children: <Widget>[
                Container(
                    color: Colors.white24,
                    child: ListTile(
                        title:  Text('Cliente: '+ users.firstName+ ' '+ users.lastName,style: const TextStyle(fontSize: 10),),
                        subtitle:Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Text(ConstantString.textPatente + users.card.elementAt(index).patente, style: const TextStyle(color:  Colors.amber )),
                                    Text(ConstantString.textMarca + users.card.elementAt(index).marca + ' '+ users.card.elementAt(index).modelo,style: const TextStyle(color:  Colors.amber))
                                ],
                            ),
                        ),
                        trailing: const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Icon(Icons.navigate_next,color: Colors.amber),
                        ),
                        onTap: ()  {
                            Navigator.of(context).pushNamed(DetailCarPage.routeName,arguments:users.card.elementAt(index));
                        },
                    ),
                ),
            ],
        );
    }
}

class CardClServicePatente extends StatelessWidget {
    final int index;
    final Service users;

    const CardClServicePatente({required Key key, required this.index,  required this.users, }) : super(key: key);

    @override
    Widget build(BuildContext context) {

        return Column(
            children: <Widget>[
                Container(
                    color: Colors.white24,
                    child: ListTile(
                        title:  Text(ConstantString.textCliente +'${users.id}', style: const TextStyle(fontSize: 10),),
                        subtitle:Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Text(ConstantString.textPatente+ users.service.elementAt(index).patente, style: const TextStyle(color:  Colors.amber )),
                                    Text(ConstantString.textDate + users.service.elementAt(index).fecha + ' ',style: const TextStyle(color:  Colors.amber))
                                ],
                            ),
                        ),
                        trailing: const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Icon(Icons.navigate_next,color: Colors.amber),
                        ),
                        onTap: ()  {
                            Navigator.of(context).pushNamed(DetailServicePage.routeName,arguments:users.service.elementAt(index));
                        },
                    ),
                ),
            ],
        );
    }
}


class CardClService extends StatelessWidget {
    final int index;
    final Service users;

    const CardClService({required Key key, required this.index,  required this.users, }) : super(key: key);

    @override
    Widget build(BuildContext context) {

        return Column(
            children: <Widget>[
                Container(
                    color: Colors.white24,
                    child: ListTile(
                        title:  Text('Fecha del servicio : ${users.service.elementAt(index).fecha.replaceAll('.', '/')}',style: const TextStyle(fontSize: 12),),
                        subtitle:Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Text(ConstantString.textPatente + users.service.elementAt(index).patente, style: const TextStyle(color:  Colors.amber )),
                                ],
                            ),
                        ),
                        trailing: const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Icon(Icons.navigate_next,color: Colors.amber),
                        ),
                        onTap: ()  {
                            Navigator.of(context).pushNamed(DetailServicePage.routeName,arguments:users.service.elementAt(index));
                        },
                    ),
                ),
            ],
        );
    }
}


class AlignText extends StatefulWidget {
    final double height;
    final double width;
    final String value;
    final AlignmentGeometry align;
    const AlignText({
        Key? key, required this.height, required this.width, required this.value, required this.align,
    }) : super(key: key);

  @override
  State<AlignText> createState() => _AlignTextState();
}

class _AlignTextState extends State<AlignText> {
    @override
    Widget build(BuildContext context) {
        return Align(
            alignment: widget.align,
            child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Container(
                    height: widget.height *0.1,
                    width: widget.width *0.7,
                    alignment:  Alignment.center,
                    margin: const EdgeInsets.only(left: 40.0, right: 40.0),
                    decoration: BoxDecoration(
                        color:   const Color(0xFF304FFE).withOpacity(0.5),
                        border: Border.all(color: Colors.blue,
                        ),
                        borderRadius:  const BorderRadius.all(Radius.circular(40.0),),
                    ),
                    child:  AutoSizeText(widget.value,style:  const TextStyle(fontSize: 18.0,color: Colors.white),maxLines: 2,minFontSize: 10,)
                ),
            ),
        );
    }
}
