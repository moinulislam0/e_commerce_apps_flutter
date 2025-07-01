class CarttolistModel {
  String? msg;
  List<CartData>? data;

  CarttolistModel({this.msg, this.data});

  CarttolistModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <CartData>[];
      json['data'].forEach((v) {
        data!.add(CartData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['msg'] = msg;
    if (data != null) {
      json['data'] = data!.map((v) => v.toJson()).toList();
    }
    return json;
  }
}



// ignore: camel_case_types
class CartData {
  int? id;
  String? name;
  String? shortDesc; // corrected from shortDoes
  String? image;
  int? productId;
  String? createdAt;
  String? updatedAt;
  int count=1;

  CartData({
    this.id,
    this.name,
    this.shortDesc,
    this.image,
    this.productId,
    this.createdAt,
    this.updatedAt,
  });

  CartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortDesc = json['shortDesc']; // corrected key if backend sends this
    image = json['image'];
    productId = json['productId'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['id'] = id;
    json['name'] = name;
    json['shortDesc'] = shortDesc;
    json['image'] = image;
    json['productId'] = productId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }
}
