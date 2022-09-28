import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_page/app/modules/Attribut_data_model.dart';
import 'package:product_page/app/modules/home/controllers/home_controller.dart';
import 'package:product_page/app/modules/home/controllers/sqflite_data.dart';
import 'package:product_page/app/modules/home/views/data_v2.dart';
import 'package:product_page/app/modules/home/views/home_view.dart';
import 'package:product_page/app/modules/home/views/theme_service.dart';

import '../../../../main.dart';

class DataView extends GetWidget<HomeController> {
  const DataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBar(context),
        body: ListView.builder(
          itemCount: controller.list.length,
          itemBuilder: (context, index) {
            Map m = controller.list[index];
            return  InkWell(
              onTap: () {
                Get.to(MainView(),arguments: m);
              },
              child: Container(
                margin: EdgeInsets.all(8),
                height: 180,width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[200],borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Expanded(flex: 1,child: Column(
                      children: [
                        Expanded(flex: 1,child: Container()),
                        Expanded(flex: 1,child: Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: MemoryImage(base64Decode(m['image'])),fit: BoxFit.fill),
                          ),
                        ),),
                        Expanded(flex: 1,child: Container()),
                      ],
                    )),
                    Expanded(flex: 3,child: Column(
                      children: [
                        Expanded(flex: 1,child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text("Product Name : ${m['a1']}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              alignment: Alignment.center,
                              child: Text("Product Price : ${m['a2']}/-",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
                            ),
                            SizedBox(height:10,),
                            Container(
                              alignment: Alignment.center,
                              child: Text("Description : ${m['a3']}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              alignment: Alignment.center,
                              child: Text("Discount : ${m['a4']}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
                            ),
                          ],
                        )),
                      ],
                    )),
                    Expanded(flex: 1,child: Column(
                      children: [
                        Expanded(child: IconButton(onPressed: () {
                          dbclass.dbcreate().then((value) {
                            String s = "delete from product where id=${m['id']}";
                            value.rawDelete(s).then((value) {
                              if (value == 1) {
                                controller.getdata();
                              }
                            });
                          });
                        }, icon: Icon(Icons.delete_outline))),
                        Expanded(child: IconButton(onPressed: () {
                          if (m != "") {
                            controller.map=m;
                            controller.a1.text = controller.map['a1'];
                            controller.a2.text = controller.map['a2'];
                            controller.a3.text = controller.map['a3'];
                            controller.a4.text = controller.map['a4'];
                            controller.color.text = controller.map['color'];
                            controller.size.text = controller.map['size'];
                            controller.modle.text = controller.map['model'];
                            controller.hight.text = controller.map['height'];
                            controller.width.text = controller.map['width'];
                            controller.weight.text = controller.map['weight'];
                            controller.mfg.text = controller.map['mfg'];
                            controller.otext.clear();
                            List<dynamic> otherData= jsonDecode(controller.map['other']);
                            otherData.forEach((element) {
                              controller.otext.add(OtherModel.fromJson(element));
                            });
                          }
                          controller.data.clear();
                          if(!isNullEmptyOrFalse( controller.color.text )){
                            controller.map = m;
                            controller.data.add(ProductModel(productId: "1",
                                productName: "Colors",
                                productvalue: controller.color.text,
                                controller: controller.color));
                          }
                          if(!isNullEmptyOrFalse( controller.size.text )){
                            controller.data.add(ProductModel(productId: "2",
                                productName: "Size",
                                productvalue: controller.size.text,
                                controller: controller.size));
                          }
                          if(!isNullEmptyOrFalse( controller.modle.text )){
                            controller.data.add(ProductModel(productId: "3",
                                productName: "Model",
                                productvalue: controller.modle.text,
                                controller: controller.modle));
                          }
                          if(!isNullEmptyOrFalse( controller.hight.text )){
                            controller.data.add(ProductModel(productId: "4",
                                productName: "Hight",
                                productvalue: controller.hight.text,
                                controller: controller.hight));
                          }
                          if(!isNullEmptyOrFalse( controller.width.text )){
                            controller.data.add(ProductModel(productId: "5",
                                productName: "Width",
                                productvalue: controller.width.text,
                                controller: controller.width));
                          }
                          if(!isNullEmptyOrFalse( controller.weight.text )){
                            controller.data.add(ProductModel(productId: "6",
                                productName: "Weight",
                                productvalue: controller.weight.text,
                                controller: controller.weight));
                          }
                          if(!isNullEmptyOrFalse( controller.mfg.text )){
                            controller.data.add(ProductModel(productId: "7",
                                productName: "Mfg Date",
                                productvalue: controller.mfg.text,
                                controller: controller.mfg));
                          }
                          if(!isNullEmptyOrFalse( controller.other.text )){
                            controller.data.add(ProductModel(productId: "2",
                                productName: "Other",
                                productvalue: controller.other.text,
                                controller: TextEditingController(text: controller.other.text)));
                          }
                          Row(
                              children: List.generate(
                                controller.otext.length,
                                    (index) {
                                  if (!isNullEmptyOrFalse(controller
                                      .otext[index].fcontroller!.text)) {
                                    controller.data.add(
                                      ProductModel(
                                        productId: "8",
                                        productName: "Other Type",
                                        productvalue: controller
                                            .otext[index].fcontroller!.text,
                                        controller: controller
                                            .otext[index].fcontroller!,
                                      ),
                                    );

                                    if (!isNullEmptyOrFalse(controller
                                        .otext[index].scontroller!.text)) {
                                      controller.data.add(
                                        ProductModel(
                                          productId: "9",
                                          productName: "Other Value",
                                          productvalue: controller
                                              .otext[index].scontroller!.text,
                                          controller: controller
                                              .otext[index].scontroller!,
                                        ),
                                      );
                                    }
                                  }
                                  return Container();
                                },
                              ));
                          Get.to(HomeView(),arguments: m);
                        }, icon: Icon(Icons.edit),)),
                      ],
                    ),),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Get.to(HomeView());
          controller.a1.clear();
          controller.a2.clear();
          controller.a3.clear();
          controller.a4.clear();
          controller.color.clear();
          controller.size.clear();
          controller.modle.clear();
          controller.hight.clear();
          controller.width.clear();
          controller.mfg.clear();
          controller.otext.clear();
          controller.data.clear();
        },child: Icon(Icons.add),backgroundColor: Colors.black,),
      );
    });
  }
  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text("Data-View",style: TextStyle(color: Colors.black),),
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeServices().switchTheme();
          controller.notifyHelper.displayNotification(
            title: "Theme Changed",
            body: Get.isDarkMode
                ? "Activated Light Theme"
                : "Activated Dark Theme",
          );
          controller.notifyHelper.scheduledNotification();
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}