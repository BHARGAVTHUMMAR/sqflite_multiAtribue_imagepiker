import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:product_page/app/modules/Attribut_data_model.dart';
import 'package:product_page/app/modules/home/controllers/sqflite_data.dart';
import 'package:product_page/app/modules/home/views/sql.dart';
import 'package:product_page/app/modules/home/views/theme_service.dart';
import 'package:product_page/main.dart';
import '../controllers/home_controller.dart';
import 'data_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    dynamic m = ModalRoute.of(context)!.settings.arguments;
    final formkey = GlobalKey<FormState>();
    List ProductData = [];
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getSubjectData();
    });
    return Obx(
      () => Scaffold(
          appBar: _appBar(context),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Center(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        height: 80,
                        width: 80,
                        child: StatefulBuilder(
                          builder: (context, setState) {
                            return CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Container(
                                  height: 100,
                                  width: 150,
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: 150,
                                              width: double.infinity,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "choose profile photo",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  SizedBox(height: 30),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 40,
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            Get.back();
                                                            controller.openCamera(
                                                                setState);
                                                          },
                                                          icon: Icon(
                                                            Icons.camera_alt,
                                                            color: Colors.black,
                                                            size: 50,
                                                          )),
                                                      SizedBox(
                                                        width: 110,
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            Get.back();
                                                            controller
                                                                .openGallery(
                                                                    setState);
                                                          },
                                                          icon: Icon(
                                                            Icons.photo_album,
                                                            size: 50,
                                                          )),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    child: controller.imgFile == null
                                        ? Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.camera_alt,
                                              color: Colors.black,
                                            ),
                                          )
                                        : Container(
                                            width: 100,
                                            height: 150,
                                            alignment: Alignment.center,
                                            child:
                                                controller.displayImage(setState),
                                          ),
                                  ),
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                ));
                          },
                        )),
                    Formfild(
                      controller: controller.a1,
                      labelText: "Product Name",
                      hintText: "plz Enter Product Name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter product Name";
                          }
                          return null;
                        }),
                    Formfild(
                        controller: controller.a2,
                        textInputType: TextInputType.number,
                        labelText: "Product Price",
                        hintText: "plz Enter Product Price",
                        validator: (val) {
                          if (isNullEmptyOrFalse(val)) {
                            return "Please Enter product Price";
                          }
                          return null;
                        }),
                    Formfild(
                        controller: controller.a3,
                        labelText: "Product Discription",
                        hintText: "plz Enter Product Discription",
                        validator: (val) {
                          if (isNullEmptyOrFalse(val)) {
                            return "Please Enter product Discrption";
                          }
                          return null;
                        }),
                    Formfild(
                        controller: controller.a4,
                        textInputType: TextInputType.number,
                        labelText: "Product Discount",
                        hintText: "plz Enter Product Discount",
                        validator: (val) {
                          if (isNullEmptyOrFalse(val)) {
                            return "Please Enter Product Discount";
                          }
                          return null;
                        }),
                    m == null
                        ? GetBuilder<HomeController>(builder: (controller) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: MultiSelectDialogField(
                                items: controller.dropDownData,
                                title: const Text(
                                  "Select Subject",
                                  style: TextStyle(color: Colors.black),
                                ),
                                selectedColor: Colors.black,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(30)),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                                buttonIcon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.blue,
                                ),
                                buttonText: const Text(
                                  "Select Product Attribut",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                onConfirm: (results) {
                                  ProductData = [];
                                  controller.data.clear();
                                  for (var i = 0; i < results.length; i++) {
                                    ProductModel data =
                                        results[i] as ProductModel;
                                    print(data.productId);
                                    print(data.productName);
                                    ProductData.add(data.productId);
                                    controller.data.add(data);
                                  }
                                  print("data $ProductData");
                                },
                                onSelectionChanged: (p0) {
                                  controller.data.clear();
                                  for (var i = 0; i < p0.length; i++) {
                                    ProductModel data = p0[i] as ProductModel;
                                    print(data.productId);
                                    print(data.productName);
                                    ProductData.add(data.productId);
                                    controller.data.add(data);
                                  }
                                },
                              ),
                            );
                          })
                        : Container(),
                    Column(
                      children: List.generate(controller.data.length, (index) {
                        if (controller.data[index].productName == "Colors") {
                          return Formfild(
                            controller: controller.color,
                            labelText: controller.data[index].productName,
                            hintText:
                                "Enter " + controller.data[index].productName,
                            textInputType: TextInputType.text,
                              validator: (val) {
                                if (isNullEmptyOrFalse(val)) {
                                  return "Please Enter Colors";
                                }
                                return null;
                              }
                          );
                        }
                        if (controller.data[index].productName == "Size") {
                          return Formfild(
                              controller: controller.size,
                              labelText: controller.data[index].productName,
                              hintText:
                                  "Enter " + controller.data[index].productName,
                              textInputType: TextInputType.number,
                              validator: (val) {
                                if (isNullEmptyOrFalse(val)) {
                                  return "Please Enter Size";
                                }
                                return null;
                              }
                          );
                        }
                        if (controller.data[index].productName == "Model") {
                          return Formfild(
                              controller: controller.modle,
                              labelText: controller.data[index].productName,
                              hintText:
                                  "Enter " + controller.data[index].productName,
                              textInputType: TextInputType.text,
                              validator: (val) {
                                if (isNullEmptyOrFalse(val)) {
                                  return "Please Enter Model";
                                }
                                return null;
                              });
                        }
                        if (controller.data[index].productName == "Hight") {
                          return Formfild(
                              controller: controller.hight,
                              labelText: controller.data[index].productName,
                              hintText:
                                  "Enter " + controller.data[index].productName,
                              textInputType: TextInputType.number,
                              validator: (val) {
                                if (isNullEmptyOrFalse(val)) {
                                  return "Please Enter Hight";
                                }
                                return null;
                              });
                        }
                        if (controller.data[index].productName == "Width") {
                          return Formfild(
                              controller: controller.width,
                              labelText: controller.data[index].productName,
                              hintText:
                                  "Enter " + controller.data[index].productName,
                              textInputType: TextInputType.number,
                              validator: (val) {
                                if (isNullEmptyOrFalse(val)) {
                                  return "Please Enter Width";
                                }
                                return null;
                              });
                        }
                        if (controller.data[index].productName == "Weight") {
                          return Formfild(
                              controller: controller.weight,
                              labelText: controller.data[index].productName,
                              hintText:
                                  "Enter " + controller.data[index].productName,
                              textInputType: TextInputType.number,
                              validator: (val) {
                                if (isNullEmptyOrFalse(val)) {
                                  return "Please Enter Weight";
                                }
                                return null;
                              });
                        }
                        if (controller.data[index].productName == "Mfg Date") {
                          return Formfild(
                              controller: controller.mfg,
                              labelText: controller.data[index].productName,
                              hintText:
                                  "Enter " + controller.data[index].productName,
                              textInputType: TextInputType.datetime,
                              validator: (val) {
                                if (isNullEmptyOrFalse(val)) {
                                  return "Please Enter Mfg date";
                                }
                                return null;
                              });
                        }
                        if (controller.data[index].productName == "Other") {
                          return Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    controller.otext.add(OtherModel(
                                        fcontroller: TextEditingController(),
                                        scontroller: TextEditingController()));
                                  },
                                  icon: Icon(Icons.add)),
                              Column(
                                children: List.generate(
                                  controller.otext.length,
                                  (index) {
                                    return Row(
                                      children: [
                                        Expanded(
                                          child: Formfild(
                                              controller: controller
                                                  .otext[index].fcontroller!,
                                              labelText: "Other Type",
                                              hintText: 'Enter other Type',
                                              validator: (val) {
                                                if (isNullEmptyOrFalse(val)) {
                                                  return "Please Enter Other type";
                                                }
                                                return null;
                                              }),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              controller.otext.removeAt(index);
                                            },
                                            icon: Icon(Icons.remove)),
                                        Expanded(
                                          child: Formfild(
                                              controller: controller
                                                  .otext[index].scontroller!,
                                              labelText: "Other Value",
                                              hintText: 'Enter other Value',
                                              validator: (val) {
                                                if (isNullEmptyOrFalse(val)) {
                                                  return "Please Enter other value";
                                                }
                                                return null;
                                              }),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        } else {
                          return SizedBox();
                        }
                      }),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    GFButton(
                      onPressed: () async {
                        if(formkey.currentState!.validate())
                          {
                            print("Validate");
                          }
                        else
                          {
                            print("not Validate");
                          }
                        Uint8List bytes =
                        await controller.imgFile!.value.readAsBytesSync();
                        var encode = base64Encode(bytes);
                        String a = controller.a1.text;
                        String b = controller.a2.text;
                        String c = controller.a3.text;
                        String d = controller.a4.text;
                        String e = controller.color.text;
                        String f = controller.size.text;
                        String g = controller.modle.text;
                        String h = controller.hight.text;
                        String i = controller.width.text;
                        String j = controller.weight.text;
                        String k = controller.mfg.text;
                        String l = controller.otext
                            .map((element) {
                          return jsonEncode(Other(
                            type: element.fcontroller!.text,
                            value: element.scontroller!.text,
                          ).toJson());
                        })
                            .toList()
                            .toString();
                        String o = encode;
                        dbclass.dbcreate().then((value) {
                          if (m == null) {
                            if (a != "" && b != "" && c != "" && d != "") {
                              dbclass.dbcreate().then((value) {
                                String q = "insert into product("
                                    "a1,"
                                    "a2,"
                                    "a3,"
                                    "a4,"
                                    "color,"
                                    "size,"
                                    "model,"
                                    "height,"
                                    "width,"
                                    "weight,"
                                    "mfg,"
                                    "other,"
                                    "image)"
                                    "values "
                                    "('$a','$b','$c','$d','$e','$f','$g','$h','$i','$j','$k','$l','$o')";
                                value.rawInsert(q).then((value) {
                                  if (value >= 1) {
                                    print("Data Inserted");
                                    dbclass.dbcreate().then((value) {
                                      String s = "select * from product";
                                      value.rawQuery(s).then((value) {
                                        print(value);
                                        controller.list.value = value;
                                      });
                                    });
                                    Get.to(DataView());
                                  }
                                });
                              });
                            } else {
                              Get.snackbar("Error", "Please Enter value",
                                  snackPosition: SnackPosition.BOTTOM);
                            }
                          } else {
                            String q =
                                "update product set a1='$a',a2='$b',a3='$c',a4='$d',color='$e',size='$f',model='$g',height='$h',width='$i',weight='$j',mfg='$k',other='$l' where id=${controller.map['id']}";
                            value.rawUpdate(q).then((value) {
                              if (value == 1) {
                                dbclass.dbcreate().then((value) {
                                  String s = "select * from product";
                                  value.rawQuery(s).then((value) {
                                    print(value);
                                    controller.list.value = value;
                                  });
                                });
                                print("Data updated");
                                Get.to(DataView());
                              }
                            });
                          }
                        });
                        controller.a1.clear();
                        controller.a2.clear();
                        controller.a3.clear();
                        controller.a4.clear();
                        controller.color.clear();
                        controller.size.clear();
                        controller.modle.clear();
                        controller.hight.clear();
                        controller.width.clear();
                        controller.weight.clear();
                        controller.mfg.clear();
                        controller.otext.clear();
                        controller.data.clear();
                      },
                      text: m == null ? "Submit" : "Edit",
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      color: Colors.black,
                      blockButton: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    m != null
                        ? SizedBox()
                        : GFButton(
                            onPressed: () {
                              controller.a1.clear();
                              controller.a2.clear();
                              controller.a3.clear();
                              controller.a4.clear();
                              controller.color.clear();
                              controller.size.clear();
                              controller.modle.clear();
                              controller.hight.clear();
                              controller.width.clear();
                              controller.weight.clear();
                              controller.mfg.clear();
                              controller.otext.clear();
                              controller.data.clear();
                              Get.to(
                                DataView(),
                              );
                            },
                            text: "Data",
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                            color: Colors.black,
                            blockButton: true,
                          ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
  Formfild({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    FormFieldValidator? validator,
    TextInputType textInputType = TextInputType.text,
  }) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 5),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(),
        child: Form(
          child: TextFormField(
            keyboardType: textInputType,
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
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
