import 'dart:io';

import 'package:etmam/Add3.dart';
import 'package:etmam/Bu.dart';
import 'package:etmam/Circle.dart';
import 'package:etmam/Field.dart';
import 'package:etmam/Nav_bottom.dart';
import 'package:etmam/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class Add2 extends StatefulWidget {
  const Add2({Key? key}) : super(key: key);

  @override
  State<Add2> createState() => _Add2State();
}

class _Add2State extends State<Add2> {
  var _select;

  void _scaleDialog(x) {
    showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: _dialog(ctx, x),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  Widget _dialog(BuildContext context, x) {
    return AlertDialog(
      content: SizedBox(
        height: 120,
        child: x == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    EB(
                        on: () {
                          ImagePicker()
                              .pickImage(source: ImageSource.camera)
                              .then((v) {
                            setState(() {
                              if (v?.path != null) list_images.add(v?.path);
                            });
                          }).then((value) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            Navigator.of(context).pop();
                          });
                        },
                        icon: Icons.camera_alt_outlined,
                        text: ar ? 'التقاط صورة         ' : '          Camera',
                        height: 40,
                        neg: true,
                        row: true),
                    SizedBox(height: 10),
                    EB(
                        on: () {
                          ImagePicker()
                              .pickImage(source: ImageSource.gallery)
                              .then((v) {
                            setState(() {
                              if (v?.path != null) list_images.add(v?.path);
                            });
                          }).then((value) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            Navigator.of(context).pop();
                          });
                        },
                        icon: Icons.filter,
                        text: ar ? 'من الذاكرة         ' : '          Gallery',
                        height: 40,
                        neg: true,
                        row: true)
                  ])
            : Center(
                child: EB(
                    on: () {
                      setState(() {
                        list_images.removeAt(x);
                      });
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.pop(context);
                    },
                    icon: Icons.highlight_remove_sharp,
                    text: ar ? 'حذف         ' : '          Remove',
                    height: 40,
                    neg: true,
                    row: true),
              ),
      ),
      actions: <Widget>[
        EB(
          on: () {
            FocusManager.instance.primaryFocus?.unfocus();
            Navigator.of(context).pop();
          },
          text: ar ? 'إلغاء' : 'Cancel',
          height: 40,
          width: 90,
        )
      ],
    );
  }

  List list_images = [];
  btn(x, y) {
    return InkWell(
        onTap: y == null
            ? () {
                _scaleDialog(x);
              }
            : () {
                _scaleDialog(x);
              },
        splashColor: bg,
        child: Container(
            width: m * 25,
            height: m * 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(110, 23, 158, 82)),
            child: y == null
                ? Icon(Icons.add_photo_alternate_rounded,
                    color: Colors.white, size: 30)
                : Padding(
                    padding: EdgeInsets.all(5), child: Image.file(File(y)))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: bg,
          title: Center(child: txt(t: 'Add New', b: true, c: Colors.white))),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: (h * 100) - 60,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Circle(2),
                  Field(
                      on: (v) {
                        setState(() {
                          _select = v;
                        });
                      },
                      label: ar ? 'وصف المشكلة*' : 'Problem Description*',
                      l: ['1111', '2222', '3333'],
                      val: _select,
                      hint: ar
                          ? 'اختر واحداً مما يلي'
                          : 'Select one of following',
                      info: true),
                  Field(
                      label: ar ? 'تفاصيل المشكلة *' : 'Problem Details*',
                      hint: ar
                          ? 'اختر واحداً مما يلي'
                          : 'Select one of following',
                      info: true),
                  Column(children: [
                    Row(
                      children: [
                        SizedBox(width: w * 12),
                        txt(
                            t: ar ? 'ارفع صورة' : 'Upload attachment',
                            s: 12,
                            c: Color(0xff707070),
                            b: true),
                      ],
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: [
                        for (var i = 0; i < list_images.length; i++)
                          btn(i, list_images[i]),
                        btn(null, null)
                      ],
                    )
                  ]),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(
                      child: SizedBox(
                          height: 10 * h,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                EB(
                                  on: () {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    Navigator.pop(context);
                                  },
                                  colo: false,
                                  text: ar ? '   السابق' : '   Previous',
                                  icon: Icons.navigate_before,
                                  neg: true,
                                  row: true,
                                  height: 5.5 * h,
                                  width: 35 * w,
                                  ru: 13,
                                ),
                                EB(
                                  on: () {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Add3()));
                                  },
                                  text: ar ? 'التالى       ' : 'Next       ',
                                  icon: Icons.navigate_next,
                                  row: true,
                                  height: 5.5 * h,
                                  width: 35 * w,
                                  ru: 13,
                                )
                              ])))
                ]),
          ),
        ],
      ),
      //bottomNavigationBar:Nav_bottom(class_number:1)
    );
  }
}
