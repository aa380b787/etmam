import 'package:etmam/main.dart';
import 'package:flutter/material.dart';

class Component extends StatelessWidget {
  const Component(
      {Key? key,
      required this.ddata,})
      : super(key: key);
  final Map? ddata;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: w * 90,
      width: w * 90,
      margin: EdgeInsets.only(left: 5, top: 10, right: 5, bottom: 20),
      decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(width: 1, color: bg)),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: 
                    (ddata!['request'] == 'Pending')
                        ? (Color(0xff808080))
                        : ((ddata!['request'] == 'Accepted')
                            ? (Color(0xff0F75FF))
                            : Color(0xffFF413C)),
              child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    (ddata!['request'] == 'Pending')
                        ? (ar ? 'قيد التنفيذ' : 'Under progress')
                        : ((ddata!['request'] == 'Accepted')
                            ? (ar ? 'مقبول' : 'Accepted')
                            : (ar ? 'مرفوض' : 'Rejected')),
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )),
            ),
            SizedBox(width: w * 5),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: w * 5,
            ),
            Text('# Sr-000' + ddata!['sr'].toString(),
                style: TextStyle(color: Color(0xff065BA4), fontSize: 15)),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: w * 1,
            ),
            Text(ddata!['title'], style: TextStyle(fontSize: 10)),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: w * 1,
            ),
            Icon(Icons.location_on_outlined),
            Text(ddata!['address'], style: TextStyle(fontSize: 13)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                SizedBox(
                  width: w * 1,
                ),
                Icon(Icons.person_outline),
                Text(ddata!['user'], style: TextStyle(fontSize: 15)),
              ],
            ),
            SizedBox(),
            SizedBox(),
            SizedBox(),
            Row(
              children: [
                SizedBox(
                  width: w * 1,
                ),
                Icon(Icons.person_pin_outlined),
                Text(ddata!['representative'], style: TextStyle(fontSize: 15)),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(),
            SizedBox(),
            Text(ddata!['date']+'   '+ddata!['time'],
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
                textAlign: TextAlign.center),
          ],
        ),
        SizedBox()
      ]),
    );
  }
}
