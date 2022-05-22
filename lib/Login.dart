import 'package:etmam/Field.dart';
import 'package:etmam/Bu.dart';
import 'package:etmam/main.dart';
import 'package:etmam/Home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _ratingController = ar ? 'العربية' : 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: ListView( physics: BouncingScrollPhysics(),
          children: [SizedBox(
            height: 100*h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Image.asset(logo, scale: h /2),
              txt(
                  t: ar
                      ? 'نظام التشغيل والصيانة - نسخة تجريبية'
                      : 'Operating system - trial version',
                  s: 18,
                  c: Colors.white),
              Stack(alignment: AlignmentDirectional.bottomEnd, children: [
                Container(
                    width: 100 * w,
                    height: 55 * h,
                    decoration: BoxDecoration(
                      color: bg2,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff707070)),
                    )),
                Container(
                  width: w * 100,
                  height: 50 * h,
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    border:
                        Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Field(
                          val: _ratingController,
                            label: ar ? 'اللغة' : 'Language',
                              l: ['English', 'العربية'],
                              on: (v) {
                                setState(() {
                                  if (v == 'English') {
                                    ar = false;
                                  }
                                  if (v == 'العربية') {
                                    ar = true;
                                  }
                                  _ratingController = v.toString();
                                });
                              }),
                        Field(
                            label: ar ? 'اسم المستخدم' : 'Username',
                            on: (x){},
                                keyboard: TextInputType.name,
                                    hint: 'Ahmed Alobaid'),
                        Field(
                            label: ar ? 'كلمة المرور' : 'Password',
                                keyboard: TextInputType.text,
                                password: true,
                                    hint: '••••••••••••••'),
                        EB(
                            text: ar ? 'تسجيل الدخول' : 'Login',
                            width: 68 * w,
                            ru: 20,
                            //height: 5 * h,
                            on: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Home()));
                            }),
                      ]),
                )
              ]),
            ]),
          ),
          ],
        ),
    );
  }
}
