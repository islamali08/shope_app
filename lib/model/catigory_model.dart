class catigorymodel {
  bool? status;

  categorydata? data;


  catigorymodel.fromjeson(Map<String, dynamic> jeson){
    status = jeson['status'];
    data = categorydata.fromjeson(jeson['data']);
    
  }


}


class categorydata {

List<categoryelment>  categorydatal =[];


  categorydata.fromjeson(Map<String,dynamic> jeson){
    jeson['data'].forEach((elment){
      categorydatal.add(categoryelment.fromjeson(elment));
    });

  }

}

class categoryelment {


  int? id;

  String? name;

  String? image;


  categoryelment.fromjeson(Map<String, dynamic> jeson){
    id = jeson['id'];
    name = jeson['name'];
    image = jeson['image'];
  }


}