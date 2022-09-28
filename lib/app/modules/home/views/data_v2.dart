import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_page/app/modules/home/controllers/home_controller.dart';
import 'data_view.dart';

class MainView extends GetWidget<HomeController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    dynamic m = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Data-View",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        leading: IconButton(
            onPressed: () {
              Get.to(DataView(),
                  transition: Transition.leftToRight,
                  duration: Duration(seconds: 1));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              height: 88,
              width: 88,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                image: DecorationImage(image: MemoryImage(base64Decode(m['image'])),fit: BoxFit.cover),
                border: Border.all(color: Colors.black54, width: 1),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(10, 15),
                      blurRadius: 20,
                      color: Colors.black45),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 90),
                  alignment: Alignment.center,
                  child: Text(
                    " Name:-",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Text(
                    "${m['a1']}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 90),
                  alignment: Alignment.center,
                  child: Text(
                    " price:-",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Text(
                    "${m['a2']}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 90),
                  alignment: Alignment.center,
                  child: Text(
                    " Description:-",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Text(
                    "${m['a3']}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 90),
                  alignment: Alignment.center,
                  child: Text(
                    " Discount:-",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Text(
                    "${m['a4']}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Obx(() => Column(
                  children: [

                  ],
                ));
              },
              child: Container(
                width: 300,
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(width: 2),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(10, 15),
                        blurRadius: 20,
                        color: Colors.black45),
                  ],
                ),
                child: Text(
                  "Product Attribut",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                m['color'] != ""
                    ? Container(
                  margin: EdgeInsets.only(top: 10, left: 90),
                  alignment: Alignment.center,
                  child: Text(
                    "Color:-",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
                    : SizedBox(),
                m['color'] != ""
                    ? Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Text(
                    "${m['color']}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
                    : SizedBox(),
              ],
            ),
            Row(
              children: [
                m['size'] != ""
                    ? Container(
                  margin: EdgeInsets.only(top: 10, left: 90),
                  alignment: Alignment.center,
                  child: Text(
                    "Size:-",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
                    : SizedBox(),
                m['size'] != ""
                    ? Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Text(
                    "${m['size']}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
                    : SizedBox(),
              ],
            ),
            Row(
              children: [
                m['model'] != ""
                    ? Container(
                  margin: EdgeInsets.only(top: 10, left: 90),
                  alignment: Alignment.center,
                  child: Text(
                    "Model:-",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
                    : SizedBox(),
                m['model'] != ""
                    ? Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Text(
                    "${m['model']}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
                    : SizedBox(),
              ],
            ),
            Row(
              children: [
                m['height'] != ""
                    ? Container(
                  margin: EdgeInsets.only(top: 10, left: 90),
                  alignment: Alignment.center,
                  child: Text(
                    "Height:-",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
                    : SizedBox(),
                m['height'] != ""
                    ? Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Text(
                    "${m['height']}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
                    : SizedBox(),
              ],
            ),
            Row(
              children: [
                m['width'] != ""
                    ? Container(
                  margin: EdgeInsets.only(top: 10, left: 90),
                  alignment: Alignment.center,
                  child: Text(
                    "Width:-",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
                    : SizedBox(),
                m['width'] != ""
                    ? Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Text(
                    "${m['width']}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
                    : SizedBox(),
              ],
            ),
            Row(
              children: [
                m['weight'] != ""
                    ? Container(
                  margin: EdgeInsets.only(top: 10, left: 90),
                  alignment: Alignment.center,
                  child: Text(
                    "Weight:-",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
                    : SizedBox(),
                m['weight'] != ""
                    ? Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Text(
                    "${m['weight']}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
                    : SizedBox(),
              ],
            ),
            Row(
              children: [
                m['mfg'] != ""
                    ? Container(
                  margin: EdgeInsets.only(top: 10, left: 90),
                  alignment: Alignment.center,
                  child: Text(
                    "MFG Date:-",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
                    : SizedBox(),
                m['mfg'] != ""
                    ? Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Text(
                    "${m['mfg']}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
                    : SizedBox(),
              ],
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              // itemCount: jsonDecode(m['other'].toString().substring(1,m['other'].length-1)).length,
              itemCount: jsonDecode(m['other']).length,
              itemBuilder: (context, index) {
                List<dynamic> list = jsonDecode(m['other']);
                return Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 90),
                      alignment: Alignment.center,
                      child: Text(
                        "Other:-",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${list[index]["type"]} - ${list[index]["value"]}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}