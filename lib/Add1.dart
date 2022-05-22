import 'package:etmam/Add2.dart';
import 'package:etmam/Bu.dart';
import 'package:etmam/Circle.dart';
import 'package:etmam/Nav_bottom.dart';
import 'package:etmam/main.dart';
import 'package:flutter/material.dart';

class Add1 extends StatefulWidget {
  const Add1({Key? key}) : super(key: key);

  @override
  State<Add1> createState() => _Add1State();
}

class _Add1State extends State<Add1> {
  btn(x) {
    return InkWell(
      onTap: x,
      splashColor: bg,
      child:  Container(
        width: m*40,height: m*22,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),color: Color.fromARGB(110, 23, 158, 82)),
        child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Icon(Icons.construction,color: Colors.white,size: 30),txt(t:'Category',c: Colors.white,b: true)]))
    );
  }
@override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: bg,
          title: Center(child: txt(t: 'Add New', b: true, c: Colors.white))),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Circle(1),
        Column(
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            SizedBox(width: 30),
                    Icon(
                      Icons.info,
                      color: bg2,
                      size: 19,
                    ),
            SizedBox(width: 20),
            txt(t: ar?'الرجاء اختيار المشكلة':'Please select the problem category',b: true,s: 13,c: bg2),
            ]),
            SizedBox(height: h*2,),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [for (var i = 0; i < 8; i++) btn((){})
              ]
            ),
          ],
        ),
            SizedBox(),
 SizedBox(child: SizedBox(
        height: 10*h,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            EB(
              on: () {
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.pop(context);
              },
              text: ar ? 'إلغاء' : 'Cancel',
              colo: false,
              height: 5.5 * h,
              width: 35 * w,
              ru: 13,
            ),
            EB(
              on: () {FocusManager.instance.primaryFocus?.unfocus();
                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Add2()));},
              text: ar ? 'التالى       ' : 'Next       ',
              icon: Icons.navigate_next,
              row: true,
              height: 5.5 * h,
              width: 35 * w,
              ru: 13,
            )
          ])
      ))
      ]),
        //bottomNavigationBar:Nav_bottom(class_number:1)
    );
  }
}
