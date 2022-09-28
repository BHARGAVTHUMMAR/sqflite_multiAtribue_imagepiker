import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:product_page/app/modules/Attribut_data_model.dart';
import 'package:product_page/app/modules/home/controllers/sqflite_data.dart';
import 'package:product_page/app/modules/home/views/notification_service.dart';
class HomeController extends GetxController {
  List<ProductModel> ProductData = [];
  List<MultiSelectItem> dropDownData = [];
  RxList<OtherModel> otext = RxList<OtherModel>([]);
  RxList<ProductModel> data = RxList<ProductModel>([]);
  TextEditingController a1 = TextEditingController();
  TextEditingController a2 = TextEditingController();
  TextEditingController a4 = TextEditingController();
  TextEditingController a3 = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController size= TextEditingController();
  TextEditingController modle = TextEditingController();
  TextEditingController hight = TextEditingController();
  TextEditingController width = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController mfg = TextEditingController();
  TextEditingController other= TextEditingController();
  var notifyHelper;
  Rx<File>? imgFile;
  final imgPicker = ImagePicker();
  Map map=Map();
  RxList<Map> list = RxList<Map>([]);
  getdata()
  {
    dbclass.dbcreate().then((value) {
      String s="select * from product";
      value.rawQuery(s).then((value) {
        print(value);
          list.value=value;
      });
    });
  }
  @override
  void onInit() {
    super.onInit();
    getdata();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }
  openCamera(void Function(void Function()) setState) async {
    var imgCamera =
    await imgPicker.pickImage(source: ImageSource.camera);
    imgFile = File(imgCamera!.path).obs;
    imgFile!.refresh();
    setState((){});
  }
  openGallery( void Function(void Function()) setState) async {
    var imgGallery =
    await imgPicker.pickImage(source: ImageSource.gallery);
    imgFile = File(imgGallery!.path).obs;
    imgFile!.refresh();
    setState((){});
  }
   displayImage( void Function(void Function()) setState)  {
    if (imgFile!.value == null) {
      return Text("No Image Selected!");
    } else {
      print("Test  := ${imgFile!.value.path}");
      setState((){});
      return Image.file(imgFile!.value, width: 350, height: 350);
    }

  }
  getSubjectData() {
    ProductData.clear();
    dropDownData.clear();
    Map<String, dynamic> apiResponse = {
      "code": 200,
      "message": "Course subject lists.",
      "data": [
        {"Product_id": "1", "Product_name": "Colors","Product_value":"${color.text}","controller":color},
        {"Product_id": "2", "Product_name": "Size","Product_value":"${size.text}","controller":size},
        {"Product_id": "3", "Product_name": "Model","Product_value":"${modle.text}","controller":modle},
        {"Product_id": "4", "Product_name": "Hight","Product_value":"${hight.text}","controller":hight},
        {"Product_id": "5", "Product_name": "Width","Product_value":"${width.text}","controller":width},
        {"Product_id": "6", "Product_name": "Weight","Product_value":"${weight.text}","controller":weight},
        {"Product_id": "7", "Product_name": "Mfg Date","Product_value":"${mfg.text}","controller":mfg},
        {"Product_id": "8", "Product_name": "Other","Product_value":"${other.text}","controller":other},
      ],
    };
    if (apiResponse['code'] == 200) {
      List<ProductModel> tempProductData = [];
      apiResponse['data'].forEach(
            (data) {
          tempProductData.add(
            ProductModel(
              productId: data["Product_id"],
              productName: data["Product_name"],
              productvalue: data["Product_value"],
              controller: data["controller"],
            ),
          );
        },
      );
      print(tempProductData);
      ProductData.addAll(tempProductData);
      dropDownData = ProductData.map((productdata) {
        return MultiSelectItem(productdata, productdata.productName);
      }).toList();
      update();
    } else if (apiResponse['code'] == 400) {
      print("Show Error model why error occurred..");
    } else {
      print("show some error model like something went worng..");
    }
  }
}
