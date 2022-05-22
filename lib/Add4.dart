import 'package:etmam/Bu.dart';
import 'package:etmam/Circle.dart';
import 'package:etmam/Field.dart';
import 'package:etmam/Home.dart';
import 'package:etmam/Nav_bottom.dart';
import 'package:etmam/main.dart';
import 'package:flutter/material.dart';

class Add4 extends StatefulWidget {
  const Add4({Key? key}) : super(key: key);

  @override
  State<Add4> createState() => _Add4State();
}

class _Add4State extends State<Add4> {
  DateTime dateTime = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  String date = '';
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
              height: (100*h)-60,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Circle(4),
                    Field(
                        label: ar ? 'رقم الهاتف' : 'Phone',
                        info: true,
                        on: (x) {},
                        keyboard: TextInputType.phone,
                        hint: 'EX : 96012345566'),
                    Field(
                        label: ar ? 'البريد الإلكترونى' : 'Email',
                        on: (x) {},
                        keyboard: TextInputType.emailAddress,
                        hint: 'EX : test@gmail.com'),
                    Field(
                        label: ar ? 'بيانات إضافية' : 'Additional data',
                        info: true,
                        on: (x) {},
                        keyboard: TextInputType.text,
                        hint: ar
                            ? 'قم بإضافة أية بيانات إضافية'
                            : 'Add any additional data'),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
//NOTE Date
                        InkWell(
                            onTap: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: dateTime,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2049))
                                  .then((v) {
                                setState(() {
                                  dateTime = v ?? dateTime;
                                });
                              });
                            },
                            child: Field(
                                free: true,
                                width: 40 * w,
                                label: ar ? 'التاريخ المناسب' : 'Suitable date',
                                widge: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.date_range_outlined, color: bg2),
                                      txt(t: '${dateTime.year}-${dateTime.month}-${dateTime.day}')
                                    ]))),
//NOTE Time
                        InkWell(
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: time,
                              ).then((v) {
                                setState(() {
                                  time = v ?? time;
                                });
                              });
                            },
                            child: Field(
                                free: true,
                                width: 40 * w,
                                label: ar ? 'الوقت المناسب' : 'Suitable time',
                                widge: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.access_time, color: bg2),
                                      txt(t: '${time.hour}:${time.minute}')
                                    ]))),
                      ],
                    ),
                    SizedBox(),
                  SizedBox(
                    height: 10*10,
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
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) => Home()),
                                  (Route<dynamic> route) => false);
                            },
                            text: ar ? 'إرسال الطلب       ' : 'Finish       ',
                            height: 5.5 * h,
                            width: 35 * w,
                            ru: 13,
                          )
                        ]),
                  )]),
            ),
          ],
        ),
        //bottomNavigationBar:Nav_bottom(class_number:1)
        );
  }
}
