class shopeloginmodel{

  bool? status ;
  String? message ;
  datalogin? data ;

  shopeloginmodel.fromjeson(Map<String,dynamic>jeson){
    status = jeson['status'];
    message = jeson['message'];
    data = jeson['data'] != null ? datalogin.fromjeson(jeson['data']):null ;



  }


}

class datalogin {

  int? id ;
  String? name ;
  String? email;
  String? image ;
  int? points ;
  int? credit ;
  String? token ;

  datalogin.fromjeson(Map<String,dynamic> jeson){

    id=jeson['id'];
    name=jeson['name'];
    email=jeson['email'];
    image=jeson['image'];
    points=jeson['points'];
    credit=jeson['credit'];
    token=jeson['token'];





  }


}