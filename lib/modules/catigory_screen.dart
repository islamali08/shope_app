import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shope_app_mansour/shared/network/network/cupit/appcupit.dart';

import '../model/catigory_model.dart';
import '../shared/network/network/cupit/appstates.dart';

class catigory extends StatefulWidget {
  const catigory({Key? key}) : super(key: key);

  @override
  State<catigory> createState() => _catigoryState();
}

class _catigoryState extends State<catigory> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcupit,appstate>(
      listener: (context,lisner){},
      builder: (context,lisner){

        return Scaffold(
            body:ListView.separated(
                itemBuilder:(context,index)=> categoryelm(appcupit.get(context).catigorymodele!.data!.categorydatal[index]),
                separatorBuilder: (context,index)=>Divider(),
                itemCount: appcupit.get(context).catigorymodele!.data!.categorydatal.length
            )
        ) ;
      },

    );
  }


  Widget categoryelm(categoryelment catelm){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Image(
            height: 90,
            width: 90,
            image: NetworkImage(catelm.image!),

          ),
          SizedBox(width: 15,),
          Text(catelm.name!,
            style: TextStyle(
                fontSize: 17
            ),
          ),
          Spacer(),
          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))

        ],

      ),
    );

  }

}
