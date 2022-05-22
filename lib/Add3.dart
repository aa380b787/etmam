import 'package:etmam/Add4.dart';
import 'package:etmam/Bu.dart';
import 'package:etmam/Circle.dart';
import 'package:etmam/Field.dart';
import 'package:etmam/Nav_bottom.dart';
import 'package:etmam/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class Add3 extends StatefulWidget {
  const Add3({Key? key}) : super(key: key);

  @override
  State<Add3> createState() => _Add3State();
}

class _Add3State extends State<Add3> {
  var _select_zone;
  int _select_room = 1;
  int _select_floor = 1;
  String _radio = 'Room';
  out(child) {
    return Container(
        width: 6 * w,
        height: w * 6,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 3.0, color: bg2)),
        child: Center(child: child));
  }

  List radio_list = [
    ['Room', 'غرفة'],
    ['ASIL', 'ASIL'],
    ['Outside', 'فى الخارج'],
    ['Elevator', 'مصعد']
  ];
  now() {
    return out(Container(
        width: 3.5 * w,
        height: 3.5 * w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: bg2)));
  }

  radio(x, y, z) {
    return InkWell(
      onTap: () {
        setState(() {
          _radio = ar ? y : x;
        });
      },
      splashColor: bg,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          z == true ? now() : out(null),
          SizedBox(width: 20),
          txt(t: x, s: 25),
        ],
      ),
    );
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
              height: (h*100)-60,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Circle(3),
                    Field(
                      on: (v) {
                        setState(() {
                          _select_zone = v;
                        });
                      },
                      label: ar ? 'منطقة' : 'Zone',
                      info: true,
                      l: ['الرياض', 'جدة', 'الدمام'],
                      val: _select_zone,
                      hint: ar ? 'اختر واحداً مما يلي' : 'Select one of following',
                    ),
                    Field(
                        info: true,
                        label: ar ? 'نوع المكان' : 'Location type',
                        free: true,
                        height: h * 15,
                        widge: SizedBox(
                          width: 80 * w,
//NOTE wrap
                          child: Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            runAlignment: WrapAlignment.spaceEvenly,
                            spacing: 10*w,
                            runSpacing: 10*w,
                            children: [
                              for (var i = 0; i < radio_list.length; i++) 
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    _radio = radio_list[i][0];
                                  });
                                },
                                child: SizedBox(width: 30*w,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                    children: [(_radio==radio_list[i][0])?now():out(null),SizedBox(width: 5*w),txt(t:radio_list[i][ar?1:0],b:_radio==radio_list[i][0])])),
                              )
                            ],
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Field(
                          label: ar ? 'غرفة' : 'Room',
                          val: _select_room.toString(),
                          keyboard: TextInputType.number,
                          on: (x) {
                            setState(() {
                              _select_room = int.tryParse(x.toString()) ?? 1;
                              if ((int.tryParse(x.toString()) ?? 1) <= 0) {
                                _select_room = 1;
                              }
                            });
                          },
                          width: w * 40,
                          widge: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        _select_room++;
                                      });
                                    },
                                    child: Transform.rotate(
                                        angle: ((270 * 3.14) / 180),
                                        child: Icon(Icons.navigate_next,
                                            size: 20, color: bg))),
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        _select_room--;
                                        if (_select_room <= 0) {
                                          _select_room = 1;
                                        }
                                      });
                                    },
                                    child: Transform.rotate(
                                        angle: ((90 * 3.14) / 180),
                                        child: Icon(Icons.navigate_next,
                                            size: 20, color: bg)))
                              ]),
                        ),
                        Field(
                          label: ar ? 'طابق' : 'Floor',
                          val: _select_floor.toString(),
                          keyboard: TextInputType.number,
                          on: (x) {
                            setState(() {
                              _select_floor = int.tryParse(x.toString()) ?? 1;
                              if ((int.tryParse(x.toString()) ?? 1) <= 0) {
                                _select_floor = 1;
                              }
                            });
                          },
                          width: w * 40,
                          widge: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        _select_floor++;
                                      });
                                    },
                                    child: Transform.rotate(
                                        angle: ((270 * 3.14) / 180),
                                        child: Icon(Icons.navigate_next,
                                            size: 20, color: bg))),
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        _select_floor--;
                                        if (_select_floor <= 0) {
                                          _select_floor = 1;
                                        }
                                      });
                                    },
                                    child: Transform.rotate(
                                        angle: ((90 * 3.14) / 180),
                                        child: Icon(Icons.navigate_next,
                                            size: 20, color: bg)))
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(),
                    SizedBox(),
                    SizedBox(),SizedBox(
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
                                        builder: (BuildContext context) => Add4()));
                              },
                              text: ar ? 'التالى       ' : 'Next       ',
                              icon: Icons.navigate_next,
                              row: true,
                              height: 5.5 * h,
                              width: 35 * w,
                              ru: 13,
                            )
                          ])))]),
            ),
          ],
        ),
        //bottomNavigationBar:Nav_bottom(class_number:1)
        );
  }
}
