class rejestermodel{

  bool? status ;
  String? message ;
  rejesterdata? data ;

  rejestermodel.fromjeson(Map<String,dynamic>jeson){
    status = jeson['status'];
    message = jeson['message'];
    data = jeson['data'] != null ? rejesterdata.fromjeson(jeson['data']):null ;




  }


}

class rejesterdata {

  int? id ;
  String? name ;
  String? email;
  String? image ;
  String? phone ;
  String? token ;

  rejesterdata.fromjeson(Map<String,dynamic> jeson){

    id=jeson['id'];
    name=jeson['name'];
    email=jeson['email'];
    image=jeson['image'];
    phone=jeson['phone'];

    token=jeson['token'];





  }


}