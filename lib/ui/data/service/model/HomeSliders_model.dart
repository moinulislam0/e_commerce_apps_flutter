class HomeSliderData {
  String? msg;
  List<sliders>? data;

  HomeSliderData({this.msg, this.data});

  HomeSliderData.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <sliders>[];
      json['data'].forEach((v) {
        data!.add(sliders.fromJson(v));
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

class sliders {
  int? id;
  String? name;
  String? shortDesc; // corrected from shortDoes
  String? image;
  int? productId;
  String? createdAt;
  String? updatedAt;

  sliders({
    this.id,
    this.name,
    this.shortDesc,
    this.image,
    this.productId,
    this.createdAt,
    this.updatedAt,
  });

  sliders.fromJson(Map<String, dynamic> json) {
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
