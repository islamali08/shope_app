import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shope_app_mansour/modules/login.dart';
import 'package:shope_app_mansour/modules/search_screen.dart';
import 'package:shope_app_mansour/shared/network/local/shared_pref.dart';
import 'package:shope_app_mansour/shared/network/network/cupit/appcupit.dart';
import 'package:shope_app_mansour/shared/network/network/cupit/appstates.dart';

import '../shared/componot/component.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcupit,appstate>(

      listener: (BuildContext context, Object? state) {  },


      builder: (BuildContext context, state) {

        var cubit = appcupit.get(context) ;
        return  Scaffold(
          appBar: AppBar(
            title: Text('home',
              style: Theme.of(context).textTheme.headline5,
            ),
            actions: [
              IconButton(onPressed: (){
                navigateto(context, search());

              }, icon: Icon(Icons.search))
            ],


          ),
          body: cubit.botomsvreen[cubit.curntindex],

          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){

              cubit.changebottomendix(index);
            },
            currentIndex: cubit.curntindex,
             items: [
               BottomNavigationBarItem(icon: Icon(Icons.home),
                 label: 'Home'
               ),
               BottomNavigationBarItem(icon: Icon(Icons.apps),
                   label: 'Category'
               ),
               BottomNavigationBarItem(icon: Icon(Icons.favorite),
                   label: 'Favorit'
               ),
               BottomNavigationBarItem(icon: Icon(Icons.settings),
                   label: 'Siting'
               ),


             ],
          ),

        );
      },

    );
  }
}
