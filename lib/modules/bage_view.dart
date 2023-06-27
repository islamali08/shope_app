import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shope_app_mansour/modules/login.dart';
import 'package:shope_app_mansour/shared/network/local/shared_pref.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../shared/componot/component.dart';
import '../shared/style/color.dart';
import 'bage_view.dart';

class bageview extends StatefulWidget {
  @override
  State<bageview> createState() => _bageviewState();
}

class _bageviewState extends State<bageview> {
  List<pageviewmodel> pageviewm=[
    pageviewmodel(
        'assets/shope_bageview2.png',
  'title 1',
  'body 1'
        ),
    pageviewmodel(
        'assets/shope_bageview2.png',
        'title 2',
        'body 2'
    ),
    pageviewmodel(
        'assets/shope_bageview2.png',
        'title 3',
        'body 3'
    ),
  ];

  PageController pagecon = PageController();
  bool islast =false ;


 void onpord() {
   cashhelper.savedata(key: 'onpordin', value: true).then((value) {

     navigateandremove(context,login());

   });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){

            onpord();

          }, child: Text('Skip'))
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index){
                  if(index== pageviewm.length-1){
                   setState(() {
                     islast=true ;
                   });
                  }else{
                    islast=false ;
                  }

                },
                      controller: pagecon,
                physics: PageScrollPhysics(),
                itemCount: 3,
                  itemBuilder: (context,index){
                return depagviewitem(pageviewm[index]);
              }),
            ),

            SizedBox(height: 40,),


            Row(

              children: [
                SmoothPageIndicator(
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 4,
                    spacing: 5.0,
                    activeDotColor: defoltcolor
                  ),
                    controller: pagecon, count: pageviewm.length),
                Spacer(),
                FloatingActionButton(onPressed: (){
                           if(islast==true){
                             onpord();                           }
                  pagecon.nextPage(duration: Duration(
                    milliseconds: 750
                  ), curve: Curves.fastLinearToSlowEaseIn);
                },child: Icon(Icons.arrow_forward_ios),)
              ],
            )
          ],
        ),
      ),
    );

  }

  Widget depagviewitem(pageviewmodel pagem){


    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Expanded(child: Image(image: AssetImage(pagem.image))),
        SizedBox(height: 30,),
        Text(pagem.title,
          style: TextStyle(
              fontSize: 35
          ),
        ),
        SizedBox(height: 15,),

        Text(pagem.pody,
          style: TextStyle(
              fontSize: 25
          ),
        ),


        SizedBox(height: 40,),


      ],
    ) ;
  }
}
class pageviewmodel{
  String image ;
  String title ;
  String pody ;

  pageviewmodel(this.image,this.title,this.pody);

}