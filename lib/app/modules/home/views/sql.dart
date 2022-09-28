class TempModel {
  Data? data;

  TempModel({this.data});

  TempModel.fromJson(Map<String, dynamic> json) {

    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? a1;
  int? a2;
  String? a3;
  int? a4;
  String? color;
  String? size;
  String? model;
  String? height;
  String? width;
  String? weight;
  String? mfg;
  String? fav;
  List<Other>? other;
  Data(
      {this.id,
      this.a1,
      this.a2,
      this.a3,
      this.a4,
      this.color,
      this.size,
      this.model,
      this.height,
      this.width,
      this.weight,
      this.mfg,
      this.fav,
      this.other});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    a1 = json['a1'];
    a2 = json['a2'];
    a3 = json['a3'];
    a4 = json['a4'];
    color = json['color'];
    size = json['size'];
    model = json['model'];
    height = json['height'];
    width = json['width'];
    weight = json['weight'];
    mfg = json['mfg'];
    fav = json['fav'];
    if (json['other'] != null) {
      other = <Other>[];
      json['other'].forEach((v) {
        other!.add(new Other.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['a1'] = this.a1;
    data['a2'] = this.a2;
    data['a3'] = this.a3;
    data['a4'] = this.a4;
    data['color'] = this.color;
    data['size'] = this.size;
    data['model'] = this.model;
    data['height'] = this.height;
    data['width'] = this.width;
    data['weight'] = this.weight;
    data['mfg'] = this.mfg;
    data['fav'] = this.fav;
    if (this.other != null) {
      data['other'] = this.other!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Other {
  String? type;
  String? value;
  Other({this.type, this.value});

  Other.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }

}
class img{
 String? image;
 img(this.image);

 img.fromJson(Map<String, dynamic> json) {
   image = json['type'];
 }
 Map<String,dynamic> toJson()
 {
   final Map<String, dynamic> data = new Map<String, dynamic>();
   data['image']=this.image;
   return data;
 }
}
