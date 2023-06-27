import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shope_app_mansour/shared/componot/component.dart';
import 'package:shope_app_mansour/shared/network/network/cupit/appcupit.dart';
import 'package:shope_app_mansour/shared/network/network/cupit/appstates.dart';

class siting extends StatefulWidget {
  const siting({Key? key}) : super(key: key);

  @override
  State<siting> createState() => _sitingState();
}

class _sitingState extends State<siting> {


  TextEditingController name =  TextEditingController();
  var phone =  TextEditingController();
  var email =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<appcupit,appstate>(
        listener: (context,state){},

        builder: (context,state){

          var profileinfo = appcupit.get(context).profiledata ;
          name.text = profileinfo!.data!.name! ;
          email.text = profileinfo!.data!.email! ;


          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  defoltformfild(
                      controler: name,
                      label: 'name',
                      prefx: Icons.person


                  ),

                  SizedBox(height: 10,),


                  defoltformfild(
                      controler: email,
                      label: 'email',
                      prefx: Icons.email


                  ),
                  SizedBox(height: 10,),


                  defoltformfild(
                      controler: phone,
                      label: 'phone',
                      prefx: Icons.phone


                  ),

                  SizedBox(height: 10,),


                  defoultboutom(
                    child: 'logout',
                    onPressed: (){

                      siginout(context);

                    }
                  )

                ],
              ),
            ),
          );
        },



      )
    );
  }
}
