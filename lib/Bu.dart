import 'package:etmam/main.dart';
import 'package:flutter/material.dart';

class EB extends ElevatedButton {
EB({ Key? key, String? text,double? height,bool? row, double? width,double? ru,required VoidCallback? on,bool? colo,bool? neg,IconData? icon}): super(key: key, style: ButtonStyle(padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero), side: MaterialStateProperty.all<BorderSide>(BorderSide(color: bg)),
            backgroundColor:
                MaterialStateProperty.all(colo == false ? Colors.white : bg),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ru ?? 6),
            ))),onPressed: on, child: SizedBox(
  height: height,width: width,
            child: Flex(textDirection:neg==true?TextDirection.rtl:TextDirection.ltr,
              direction: row==true?Axis.horizontal:Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                txt(
                    t: text,
                    c: colo == false ? bg : Colors.white,b: true),
                if(icon!=null)SizedBox(height: 5),
                if(icon!=null)Icon(icon,color: colo == false ? bg : Colors.white),
              ],
            )));
}
