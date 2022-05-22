import 'package:etmam/Field.dart';
import 'package:etmam/Home.dart';
import 'package:etmam/Nav_bottom.dart';
import 'package:etmam/bu.dart';
import 'package:etmam/main.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(backgroundColor: bg,
      title:Center(child:  txt(t: ar?'ضبط الحساب':'Setting',c: Colors.white,b: true))),*/
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: (h*100)-65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
          
                                  SizedBox(),
                              Field(
                                  label: ar ? 'اسم المستخدم' : 'Username',
                                  info: true,
                                  on: (x){},
                                      keyboard: TextInputType.name,
                                          hint: 'EX : AALOBAID'),
                              Field(
                                  label: ar ? 'اسم المالك (بالعربى)' : 'Owner name (English)',
                                  info: true,
                                  on: (x){},
                                      keyboard: TextInputType.name,
                                          hint: 'EX : احمد العابد'),
                              Field(
                                  label: ar ? 'اسم المالك (بالإنكليزية)' : 'Owner name (Arabic)',
                                  info: true,
                                  on: (x){},
                                      keyboard: TextInputType.name,
                                          hint:'EX : Ahmed Alobaid' ),
                              Field(
                                  label: ar ? 'رقم الهاتف' : 'Phone',
                                  info: true,
                                  on: (x){},
                                      keyboard: TextInputType.phone,
                                          hint: 'EX : 96012345566'),
                              Field(
                                  label: ar ? 'البريد الإلكترونى' : 'Email',
                                  info: true,
                                  on: (x){},
                                      keyboard: TextInputType.emailAddress,
                                          hint: 'EX : test@gmail.com'),
                              EB(
                                  text: ar ? 'حفظ التغييرات' : 'Save Changes',
                                  width: 68 * w,
                                  ru: 20,
                                  height: 5.5 * h,
                                  on: () {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Home()));
                                  }),
                                  SizedBox()
              ]),
          ),
        ],
      ),
        
        bottomNavigationBar:Nav_bottom(class_number:3)
    );
  }
}
