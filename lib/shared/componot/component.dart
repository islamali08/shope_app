import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shope_app_mansour/shared/network/local/shared_pref.dart';

import '../../modules/login.dart';

Future navigateto(context, widget) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return widget;
  }));
}

Future navigateandremove(context, widget) {
  return Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) {
      return widget;
    }),
    (route) => false,
  );
}

Widget defoltformfild(
    {TextEditingController? controler,
    String? Function(String?)? validate,
    IconData? sufix,
    String? label,
    void Function()? onPressed,
    IconData? prefx,
      bool pass=false ,
    String? lable}) {
  return TextFormField(
    controller: controler,
    validator: validate,
    obscureText: pass,
    decoration: InputDecoration(

        enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1.5)),
        border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
        label: Text(label!),
        suffixIcon: IconButton(
          icon: Icon(sufix),
          onPressed: onPressed,
        ),
        labelText: lable,
        prefixIcon: Icon(prefx)),
  );
}

Widget defoultboutom({String? child, void Function()? onPressed}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 45),
      ),
      onPressed: onPressed,
      child: Text(
        child!,
        style: TextStyle(fontSize: 25),
      ));
}


Widget defoulttextboutom ({void Function()? onPressed, String? child}){

  return TextButton(onPressed: onPressed, child: Text(child!));
}


SnackBar showsnakbar(

{
 required String masseg ,
  required snakbarstate state
}
    ){

  return SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.white,

    content: AwesomeSnackbarContent(
      color:snakcolor(state) ,
      title: 'opss',
      message:
      masseg,

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: ContentType.failure,
    ),
  );
}

enum snakbarstate {succses,eroe,worning}

Color snakcolor (snakbarstate state){
  Color? snakbarcolor ;

  switch(state){
    case snakbarstate.succses :
      snakbarcolor= Colors.green ;
      break ;
    case snakbarstate.eroe :
      snakbarcolor= Colors.red ;
      break ;
    case snakbarstate.worning :
      snakbarcolor= Colors.orange ;
      break ;


  }

  return snakbarcolor! ;


}


void siginout (context){

  cashhelper.removedata(key: 'token').then((value) {
    return navigateandremove(context,login());
  });
}
