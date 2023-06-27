import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shope_app_mansour/model/home_model.dart';
import 'package:shope_app_mansour/shared/network/network/cupit/appcupit.dart';
import 'package:shope_app_mansour/shared/network/network/cupit/appstates.dart';
import 'package:shope_app_mansour/shared/style/color.dart';

import '../model/catigory_model.dart';
import '../shared/componot/component.dart';

class product extends StatefulWidget {
  const product({Key? key}) : super(key: key);

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<appcupit, appstate>(
        listener: (context, state) {
          if(state is sucsessfavoritstate){

            if(state.model!.status==false){
              final snackBar = showsnakbar(masseg:state.model!.message!,
                  state: snakbarstate.eroe
              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);

            }
          }else if(state is erorfavoritstate){
            final snackBar = showsnakbar(masseg:'eror',
                state: snakbarstate.eroe
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          }

        },
        builder: (context, state) {
          return ConditionalBuilder(
              condition: appcupit.get(context).homemodele != null,
              builder: (context) =>
                  broductpilder(appcupit.get(context).homemodele!),
              fallback: (context) =>
                  Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }

  Widget broductpilder(
    homemodel homem,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: homem.data!.banners
                .map((e) => Image(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: NetworkImage(e.image!)))
                .toList(),
            options: CarouselOptions(
                height: 200,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: Duration(seconds: 3),
                scrollDirection: Axis.horizontal,
                autoPlayInterval: Duration(seconds: 3),
                initialPage: 0,
                reverse: false,
                viewportFraction: 1.0),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'category',
                  maxLines: 1,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),
                Container(
                  height: 100,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => productbulder(appcupit
                          .get(context)
                          .catigorymodele!
                          .data!
                          .categorydatal[index]),
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      itemCount: appcupit
                          .get(context)
                          .catigorymodele!
                          .data!
                          .categorydatal
                          .length),
                ),
                Text(
                  'new product',
                  maxLines: 1,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.grey[300],
            child: GridView.count(
              mainAxisSpacing: 1,
              crossAxisSpacing: 1.5,
              childAspectRatio: 1 / 1.60,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(homem.data!.products.length,
                  (index) => productitem(homem.data!.products[index])),
            ),
          )
        ],
      ),
    );
  }

  Widget productitem(productsm produtmodel) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                  width: double.infinity,
                  height: 200,
                  image: NetworkImage(produtmodel.image!)),
              if (produtmodel.discount != 0)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.red,
                  child: Text(
                    'discond',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  produtmodel.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14),
                ),
                Row(
                  children: [
                    Text(
                      '${produtmodel.price.round()}',
                      style: TextStyle(fontSize: 13, color: defoltcolor),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    if (produtmodel.discount != 0)
                      Text(
                        '${produtmodel.old_price.round()}',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                    Spacer(),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor:
                          appcupit.get(context).favoriyitem[produtmodel!.id]!
                              ? defoltcolor
                              : Colors.grey,
                      child: IconButton(
                          onPressed: () {

                            appcupit.get(context).postfavorit(id: produtmodel.id!);

                          },
                          color: Colors.white,
                          icon: Icon(size: 14, Icons.favorite_outline)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget productbulder(categoryelment categorymod) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image(
            fit: BoxFit.cover,
            height: 100,
            width: 100,
            image: NetworkImage(categorymod.image!)),
        Container(
          color: Colors.black.withOpacity(0.6),
          width: 100,
          child: Text(
            categorymod.name!,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
