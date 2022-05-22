import 'package:etmam/Bu.dart';
import 'package:etmam/main.dart';
import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  Circle(int this.nu,{Key? key,}) : super(key: key);
  final int? nu;
  out(child) {
    return Container(
        width: 10 * w,
        height: w * 10,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 3.0, color: bg2)),
        child: Center(child: child));
  }

  now() {
    return out(Container(
        width: 6 * w,
        height: 6 * w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 7.0, color: bg))));
  }

  done() {
    return out(Icon(
      Icons.check_circle,
      color: bg,
      size: w*7.5,
    ));
  }

  List li = [
    ar ? 'الفئة' : 'Category',
    ar ? 'حول' : 'About',
    ar ? 'المكان' : 'location',
    ar ? 'التواصل' : 'Contact'
  ];

  tx(x, y) {
    return SizedBox(
      width: 20 * w,
      height: 3*h,
      child:Center(child: txt(t: x, b: y,s:12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10*h,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Divider(
                  thickness: 10,
                  color: bg2,
                  indent: w * 12.5,
                  endIndent: w * 12.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [for(var i = 0; i < li.length; i++) (i+1==nu)?now():(i+1<nu!)?done():out(null)
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [for (var i = 0; i < li.length; i++) tx(li[i], i+1==nu)],
            )
          ],
        ),
      ),
    );
  }
}
