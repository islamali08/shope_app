import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/favorit_model.dart';
import '../model/getmodelfavorit.dart';
import '../shared/network/network/cupit/appcupit.dart';
import '../shared/network/network/cupit/appstates.dart';
import '../shared/style/color.dart';

class favorit extends StatefulWidget {
  const favorit({Key? key}) : super(key: key);

  @override
  State<favorit> createState() => _favoritState();
}

class _favoritState extends State<favorit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

body: BlocConsumer<appcupit,appstate>(
  listener: (context,lisner){},
  builder: (context,lisner){

    return Scaffold(
        body:ConditionalBuilder(
          condition: lisner is! lodefavoritmodelstate,
          builder: (BuildContext context) =>ListView.separated(
              itemBuilder:(context,index)=> buildfavitem(appcupit.get(context).getfavoritmodele!.data!.data![index],context),
              separatorBuilder: (context,index)=>Divider(),
              itemCount: appcupit.get(context).getfavoritmodele!.data!.data!.length
          ),
          fallback: (BuildContext context) =>CircularProgressIndicator(),



        )
    ) ;
  },

),

    );
  }

}

Widget buildfavitem (getfavoritdata  model,context)=> Padding(
  padding: const EdgeInsets.all(15),
  child: Container(
    height: 120,
    child: Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Container(
              height: 120,
              width: 120,

              child: Image(

                  fit: BoxFit.fill,
                  image: NetworkImage(model.product!.image!)),
            ),
            if (1!= 0)
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

        SizedBox(
          width: 10,

        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               ' ${model.product!.name!}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    '${model.product!.price}',
                    style: TextStyle(fontSize: 13, color: defoltcolor),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  if (model.product!.discount != 0)
                    Text(
                      '${model.product!.oldPrice}',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough),
                    ),
                  Spacer(),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor:
                    appcupit.get(context).favoriyitem[model.product!.id]!? Colors.blue  : Colors.grey,
                    child: IconButton(
                        onPressed: () {

                           appcupit.get(context).postfavorit(id: model.product!.id!);

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
  ),
) ;
