class homemodel {
  bool? status;

  homedatamodel? data;

  homemodel.formjeson(Map<String, dynamic> jeson) {
    status = jeson['status'];
    
    
    data= homedatamodel.fromjeson(jeson['data']);
  }
}

class homedatamodel {
  List<bannermodel> banners = [];
  List<productsm> products = [];

  homedatamodel.fromjeson(Map<String, dynamic> jeson) {
    jeson['banners'].forEach((elemnt) {
      banners.add(bannermodel.fromjeson(elemnt));
    });

    jeson['products'].forEach((elemnt) {
      products.add(productsm.fromjeson(elemnt));
    });
  }
}

class bannermodel {
  int? id;

  String? image;

  bannermodel.fromjeson(Map<String, dynamic> jeson) {
    id = jeson['id'];
    image = jeson['image'];
  }
}

class productsm {
  int? id;

  dynamic? price;

  dynamic? old_price;

  String? image;

  String? name;

  bool? in_favorites;

  bool? in_cart;
  int? discount ;


  productsm.fromjeson(Map<String,dynamic> jeson){
    id= jeson['id'];
    price=jeson['price'];
    old_price=jeson['old_price'];
    image =jeson['image'];
    name=jeson['name'];
    in_favorites=jeson['in_favorites'];
    in_cart=jeson['in_cart'];
    discount = jeson['discount'];






  }



}
