class favoritmodel {
  bool? status;

  String? message;

  favoritdata? data;

  favoritmodel.fromjeson(Map<String,dynamic>jeson){
    status = jeson['status'];
    message = jeson['message'];
    data = favoritdata.fromjeson(jeson['data']);




  }


}

class favoritdata {
  int?id;

  int?price;
  int?old_price;

  int?discount;

  String?image;


  favoritdata.fromjeson(Map<String, dynamic> jeson){
    id = jeson['id'];
    price = jeson['price'];
    old_price = jeson['old_price'];
    discount = jeson['discount'];
    image = jeson['image'];
  }


}