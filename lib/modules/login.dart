import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shope_app_mansour/modules/regester_screen.dart';
import 'package:shope_app_mansour/shared/componot/component.dart';
import 'package:shope_app_mansour/shared/componot/constant.dart';
import 'package:shope_app_mansour/shared/network/local/shared_pref.dart';
import 'package:shope_app_mansour/shared/network/network/cupit/appcupit.dart';

import '../shared/network/network/cupit/appstates.dart';
import 'home_screen.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<appcupit, appstate>(
        listener: (BuildContext context, Object? state) {
          if (state is loginsucsice) {
            if (state.shoplogin.status!) {
              print(state.shoplogin.message);
              print(state.shoplogin.data!.token);

              cashhelper
                  .savedata(key: 'token', value: state.shoplogin.data!.token)
                  .then((value) {
                token = state.shoplogin.data!.token!;
                appcupit.get(context).getfavort();
                appcupit.get(context).getprofile();
                appcupit.get(context).getdata();

                navigateandremove(context, home());
              });
            } else {
              print(state.shoplogin.message);
              final snackBar = showsnakbar(
                  masseg: state.shoplogin.message!,
                  state: snakbarstate.succses);

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
                        'LOGIN',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'login now to brows our offer',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 30,
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
                          pass: appcupit.get(context).ispassword,
                          label: 'password',
                          prefx: Icons.lock_outline,
                          sufix: appcupit.get(context).sufix,
                          onPressed: () {
                            appcupit.get(context).changeicon();
                          },
                          controler: pass,
                          validate: (valid) {
                            if (valid!.isEmpty) {
                              return 'password is to short';
                            }
                          }),
                      SizedBox(height: 15),
                      ConditionalBuilder(
                        condition: state! is! lodingstate,
                        builder: (context) =>
                            defoultboutom(
                            onPressed: () {
                              appcupit.get(context).userlogin(
                                  email: email.text, password: pass.text);
                            },
                            child: 'Login'
                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('do not have acount? '),
                          defoulttextboutom(
                              onPressed: () {
                                navigateto(context, regesterscreen());
                              },
                              child: 'sign up')
                        ],
                      )
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
