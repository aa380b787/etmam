import 'package:etmam/Component.dart';
import 'package:etmam/Nav_bottom.dart';
import 'package:etmam/bu.dart';
import 'package:etmam/main.dart';
import 'package:flutter/material.dart';

class Requests extends StatefulWidget {
  Requests({Key? key}) : super(key: key);

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  ScrollController _controller1 = ScrollController();
  String select = 'All';
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bg,
        title: Center(
            child: Text(ar ? 'طلباتى' : 'My Requests',
                textAlign: TextAlign.center)),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
EB(on: (){
                  setState(() {
                    select = 'All';
                  });},colo: select=='All',text: ar ? 'الكل' : 'All',
                    height: h * 8,
                    width: w * 22,),
EB(on: (){
                  setState(() {
                    select = 'Pending';
                  });},colo: select=='Pending',text: ar ? 'معلق' : 'Pending',
                    height: h * 8,
                    width: w * 22,),
EB(on: (){
                  setState(() {
                    select = 'Accepted';
                  });},colo: select=='Accepted',text: ar ? 'مقبول' : 'Accepted',
                    height: h * 8,
                    width: w * 22,),
EB(on: (){
                  setState(() {
                    select = 'Rejected';
                  });},colo: select=='Rejected',text: ar ? 'مرفوض' : 'Rejected',
                    height: h * 8,
                    width: w * 22,)
          ],
        ),
        Container(
          decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(12.0),
              border: Border.all(width: 2, color: bg2)),
          width: w * 100,
          height: h * 70,
          child: Scrollbar(
              thumbVisibility: true,
              trackVisibility: true,
              showTrackOnHover: true,
              controller: _controller1,
              child: ListView(
                controller: _controller1,
                children: [for (var i = data.length-1; i >= 0; i--)if(select==data[i]['request']||select=='All')Component(ddata:data[i])],
              )),
        )
      ]),
        bottomNavigationBar:Nav_bottom(class_number: 2)
    );
  }
}
