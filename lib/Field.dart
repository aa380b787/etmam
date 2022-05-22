import 'dart:math';

import 'package:etmam/main.dart';
import 'package:flutter/material.dart';

class Field<T> extends StatelessWidget {
  Field(
      {Key? key,
      this.on,
      this.l,
      this.height,
      this.width,
      this.info,
      this.er,
      this.hint = '',
      this.label,
      this.keyboard,
      this.password = false,
      this.widge,
      this.bgg,
      this.free,
      this.val})
      : super(key: key);
  final Color? bgg;
  final Widget? widge;
  final double? height;
  final double? width;
  final TextInputType? keyboard;
  final bool? password;
  final bool? free;
  final ValueChanged<T?>? on;
  final List? l;
  final bool? info;
  final String? label;
  final String? er;
  final String? hint;
  final String? val;
  down(x) {
    return DropdownButton(
      hint: Text(hint!, style: txt_(c: Color.fromARGB(255, 184, 184, 184))),
      underline: SizedBox(),
      value: val,
      items: l!.map((value) {
        return DropdownMenuItem(
            value: value,
            child: SizedBox(
                width: (width ?? (w * 80)) * 0.7,
                child: Text(value, style: txt_(c: Colors.blue[900]))));
      }).toList(),
      style: txt_(c: Colors.blue[900]),
      onChanged: x ?? (v) {},
    );
  }

  field(x) {
    return SizedBox(
      width: pow((width ?? (w * 80)), 1.4) * 0.06,
      child: TextField(
        onChanged: x,
        controller: TextEditingController(text: val),
        obscureText: password ?? false,
        style: txt_(c: Colors.blue[900]),
        keyboardType: keyboard,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: txt_(c: Color.fromARGB(255, 184, 184, 184)),
            border: InputBorder.none),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width ?? 80 * w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  txt(t: label ?? '', s: 13, c: Color(0xff707070), b: true),
                  if (info == true)
                    Icon(
                      Icons.info,
                      color: Color(0xffA68C5B),
                      size: 18,
                    )
                ],
              ),
            ),
            Center(
              child: Container(
                height: height ?? h * 7,
                margin: EdgeInsets.only(top: 3, bottom: 2),
                decoration: BoxDecoration(
                  color: bgg,
                  borderRadius: BorderRadius.circular(11.0),
                  border:
                      Border.all(width: 1.0, color: const Color(0xff149e53)),
                ),
                child: free == true
                    ? widge
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            SizedBox(width: 30),
                            l == null ? field(on) : down(on),
                            widge ?? SizedBox(),
                            SizedBox()
                          ]),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 11),
                child: txt(
                    t: (er == null ? '' : '* ') + (er ?? ''),
                    s: 12,
                    c: const Color.fromARGB(255, 204, 82, 0)))
          ],
        ),
      ),
    );
  }
}
