import 'package:flutter/material.dart';

class ProductModel {
  String productId;
  String productName;
  String productvalue;
  TextEditingController controller = TextEditingController();
  List<OtherModel>? otherData;
  ProductModel({
    required this.productId,
    required this.productName,
    required this.productvalue,
    required this.controller,
    this.otherData,
  });
}
class OtherModel {
  TextEditingController? fcontroller;
  TextEditingController? scontroller;
  OtherModel({
    required this.fcontroller,
    required this.scontroller,
  });

  OtherModel.fromJson(Map<String, dynamic> json) {
    fcontroller = TextEditingController(text: json['type']);
    scontroller = TextEditingController(text: json['value']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.fcontroller;
    data['value'] = this.scontroller;
    return data;
  }
}
