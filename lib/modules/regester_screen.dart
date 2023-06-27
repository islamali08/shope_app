import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shope_app_mansour/shared/network/local/shared_pref.dart';

import '../shared/componot/component.dart';
import '../shared/componot/constant.dart';
import '../shared/network/network/cupit/appcupit.dart';
import '../shared/network/network/cupit/appstates.dart';
import 'home_screen.dart';

class regesterscreen extends StatefulWidget {
  const regesterscreen({Key? key}) : super(key: key);

  @override
  State<regesterscreen> createState() => _regesterscreenState();
}

class _regesterscreenState extends State<regesterscreen> {

  var formkey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
     ),


      body:  BlocConsumer<appcupit, appstate>(
        listener: (BuildContext context, Object? state) {
          if (state is sucsessregester) {
            if (state.rejestermod.status!) {
              print(state.rejestermod.message);
              print(state.rejestermod.data!.token);

              cashhelper.savedata(key: 'token', value: state.rejestermod.data!.token).then((value) {

                token =state.rejestermod.data!.token! ;

                appcupit.get(context).getfavort();
                appcupit.get(context).getprofile();



                navigateandremove(
                    context,home()

                );
              });



            }else{
              print(state.rejestermod!.message);
              final snackBar = showsnakbar(masseg:state.rejestermod!.message!,
                  state: snakbarstate.succses
              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
            }
          }
        },
        builder: (BuildContext context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Regester',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'regester now to brows our offer',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 30,
                      ),


                      defoltformfild(
                          label: 'name',
                          prefx: Icons.email_outlined,
                          controler: name,
                          validate: (valid) {
                            if (valid!.isEmpty) {
                              return 'pleas inter name';
                            }
                          }),

                      SizedBox(
                        height: 15,
                      ),
                      defoltformfild(
                          label: 'Email',
                          prefx: Icons.email_outlined,
                          controler: email,
                          validate: (valid) {
                            if (valid!.isEmpty) {
                              return 'pleas inter email';
                            }
                          }),
                      SizedBox(height: 15),
                      defoltformfild(
                          label: 'password',
                          prefx: Icons.lock_outline,
                          sufix: appcupit.get(context).sufix,
                          onPressed: () {
                          },
                          controler: pass,
                          validate: (valid) {
                            if (valid!.isEmpty) {
                              return 'password is to short';
                            }
                          }),
                      SizedBox(height: 15),
                      defoltformfild(
                          label: 'phone',
                          prefx: Icons.email_outlined,
                          controler: phone,
                          validate: (valid) {
                            if (valid!.isEmpty) {
                              return 'pleas inter email';
                            }
                          }),
                      SizedBox(height: 15),

                      ConditionalBuilder(
                        condition: state! is! sucsessregester,
                        builder: (context) => defoultboutom(
                            onPressed: () {
                              appcupit.get(context).rejester(

                                name: name.text,
                                  email: email.text,
                                  password: pass.text,
                                phone: phone.text
                              );
                            },
                            child: 'regester'),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),

    );
  }
}
