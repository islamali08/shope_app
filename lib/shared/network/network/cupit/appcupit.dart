import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shope_app_mansour/modules/home_screen.dart';
import 'package:shope_app_mansour/modules/login.dart';
import 'package:shope_app_mansour/shared/network/network/cupit/appstates.dart';
import 'package:shope_app_mansour/shared/network/network/dio_helper.dart';

import '../../../../model/catigory_model.dart';
import '../../../../model/favorit_model.dart';
import '../../../../model/getmodelfavorit.dart';
import '../../../../model/getmodelfavorit.dart';
import '../../../../model/getmodelfavorit.dart';
import '../../../../model/getmodelfavorit.dart';
import '../../../../model/getmodelfavorit.dart';
import '../../../../model/getmodelfavorit.dart';
import '../../../../model/home_model.dart';
import '../../../../model/login_model.dart';
import '../../../../model/rejestermodel.dart';
import '../../../../modules/catigory_screen.dart';
import '../../../../modules/favorit_screen.dart';
import '../../../../modules/product_screen.dart';
import '../../../../modules/siting_screen.dart';
import '../../../componot/constant.dart';

class appcupit extends Cubit<appstate> {
  appcupit() : super(initialstate());

  static appcupit get(context) => BlocProvider.of(context);
  shopeloginmodel? lodmodel;

  void userlogin({
    String? email,
    String? password,
  }) {
    emit(lodingstate());
    diohelper.postdata(
        url: endpoint,
        data: {'email': email, 'password': password}).then((value) {
      print('${value.data}');
      lodmodel = shopeloginmodel.fromjeson(value.data);
      print(lodmodel!.message);


      emit(loginsucsice(lodmodel!));
    }).catchError((onError) {
      print(onError.toString());
      emit(logineror(onError.toString()));
    });
  }



  shopeloginmodel? rejestermod ;
  void rejester({
    String? name,
    String? email,
    String? password,
    String? phone,
  }) {
    emit(loderegesterstate());
    diohelper.postdata(
        url: registerendpoit,
        data: {

          'name': name,
          'email': email,
          'password': password,
          'phone': phone

        }).then((value) {
      print('${value.data}');

      rejestermod = shopeloginmodel.fromjeson(value.data);


      print(rejestermod!.data!.token);


      emit(sucsessregester(rejestermod!));
    }).catchError((onError) {
      print(onError.toString());
      emit(erorregesterstate());
    });
  }






  IconData sufix = Icons.visibility_outlined;

  bool ispassword = true;

  void changeicon() {
    ispassword = !ispassword;
    sufix = ispassword ? Icons.visibility_outlined : Icons.visibility_off;
    emit(visipltystate());
  }

  int curntindex = 0;
  List<Widget> botomsvreen = [product(), catigory()  , favorit(), siting()];

  void changebottomendix(int index) {
    curntindex = index;

    emit(changebottomendex());
  }

  homemodel? homemodele;
 Map<int,bool> favoriyitem ={};
  void getdata() {
    emit(homestate());
    diohelper.getdata(token: token, url: homeendpoit).then((value) {
      homemodele = homemodel.formjeson(value.data);
      // print(homemodele!.data!.banners[2].image);'

      homemodele!.data!.products.forEach((element) => favoriyitem.addAll(
          {
            element.id!: element.in_favorites!}
      )
      );

      print(favoriyitem.toString());
      emit(sucsesshomestate());
    }).catchError((onError) {
      print(onError.toString());
      emit(erorhomestate());
    });
  }

  catigorymodel? catigorymodele;

  void getcategory() {
    emit(categorystate());

    diohelper.getdata(
      url: categoryendpoit,
    ).then((value) {
      catigorymodele = catigorymodel.fromjeson(value.data);
      print(catigorymodele!.data!.categorydatal[0].name);

      emit(sucsesscategorystate());



    }).catchError((onError){
      print(onError.toString());

      emit(erorcategorystate());

    });
  }

  favoritmodel? favoritmod ;

  void postfavorit({

   required int id,

  }){

    favoriyitem[id]=!favoriyitem[id]! ;
    emit(sucsessfavoritchange());


    diohelper.postdata(
              url: favoritendpoit,
              data: {'product_id':id},
              outh: token,


            ).then((value) {
              favoritmod = favoritmodel.fromjeson(value.data);

              print(favoritmod!.message);
              print(favoritmod!.status);

              if(favoritmod!.status==false){
                favoriyitem[id]=!favoriyitem[id]! ;






              }else{

                getfavort();

              }
              emit(sucsessfavoritstate(favoritmod!));

            }).catchError((onError){
              print(onError.toString());
              favoriyitem[id]=!favoriyitem[id]! ;

              emit(erorfavoritstate());

            });

  }



  getfavoritmodel? getfavoritmodele;



  void getfavort() {

    emit(lodefavoritmodelstate());

    diohelper.getdata(
      url: favoritendpoit,
      token: token
    ).then((value) {
      getfavoritmodele = getfavoritmodel.fromJson(value.data);

      print(value.data);
      print('${getfavoritmodele!.data!.data![0].product!.name} kkkkkkkkkkkkk');


      emit(sucsessfavoritmodelchange());



    }).catchError((onError){
      print(onError.toString());

      emit(erorfavoritmodelstate());

    });
  }

  shopeloginmodel? profiledata ;
  void getprofile() {

    emit(lodeprofilestate());

    diohelper.getdata(
        url: profileendpoit,
        token: token
    ).then((value) {
      profiledata = shopeloginmodel.fromjeson(value.data);

      print(profiledata!.data!.name);


      emit(sucsessprofile());



    }).catchError((onError){
      print(onError.toString());

      emit(erorprofilestate());

    });
  }




}
