
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shope_app_mansour/modules/home_screen.dart';
import 'package:shope_app_mansour/modules/login.dart';
import 'package:shope_app_mansour/shared/componot/constant.dart';
import 'package:shope_app_mansour/shared/network/local/shared_pref.dart';
import 'package:shope_app_mansour/shared/network/network/cupit/appcupit.dart';
import 'package:shope_app_mansour/shared/network/network/cupit/appstates.dart';
import 'package:shope_app_mansour/shared/network/network/dio_helper.dart';
import 'package:shope_app_mansour/shared/style/them.dart';

import 'modules/bage_view.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();
    diohelper.init();
await cashhelper.init() ;

bool onbord = cashhelper.getdata(key: 'onpordin')??false;
   token = cashhelper.getdata(key: 'token')??'';



Widget startwidget ;

if(onbord==true){

  if(token.isNotEmpty){
    startwidget = home();

  }else{

    startwidget = login();
  }


}else{
  startwidget=bageview();
}

  runApp(myapp(startwidget));
}

class myapp extends StatefulWidget {
  Widget startwidget ;

  myapp(this.startwidget);

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(


      create: (BuildContext context) =>appcupit()..getdata()..getcategory()..getfavort()..getprofile(),

      child: BlocConsumer<appcupit,appstate>(
        listener: (BuildContext context, Object? state) {  },


        builder: (BuildContext context, state) {

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightthem,

            home:widget.startwidget,
          );

        },

      ),
    );
  }
}
