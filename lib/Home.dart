import 'package:etmam/Add1.dart';
import 'package:etmam/Field.dart';
import 'package:etmam/Requests.dart';
import 'package:etmam/Component.dart';
import 'package:etmam/bu.dart';
import 'package:etmam/main.dart';
import 'package:etmam/Nav_bottom.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _controller = ScrollController();
@override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bg,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu, color: Colors.white)),
                  Image.asset(
                    logo,
                    height: 50,
                  ),
                  Transform.rotate(
                    angle: .5,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications, color: Colors.white)),
                  )
                ])),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
//NOTE Search
              Field(
                bgg: Colors.white,
                width: 95 * w,
                height: 7*h,
                hint: ar
                    ? 'اكتب اى شئ للبحث هنا .........'
                    : 'Search for something here ...... ',
                widge: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search, size: 25, color: bg)),
              ),
              Container(
                width: w * 100,
                height: h * 70,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(35.0),
                  border: Border.all(width: 1, color: const Color(0xffA68C5B)),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          EB(
                            on: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Requests()));
                            },
                            width: w * 35,
                            height: h * 10,
                            icon: Icons.person,
                            text: ar ? 'طلباتى' : 'My Request',
                            colo: false,
                          ),
                          EB(
                            on: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Add1()));
                            },
                            width: w * 35,
                            height: h * 10,
                            icon: Icons.add,
                            text: ar ? 'طلب جديد' : 'New Reqest',
                            colo: false,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(ar ? 'الطلبات الاخيرة' : 'Recent Requests',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: bg2)),
                              SizedBox()
                            ],
                          ),
                          SizedBox(
                            height: h * 2,
                          ),
                          Container(
                            width: w * 100,
                            height: h * 40,
                            decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(width: 1, color: bg2)),
                            child: Scrollbar(
                              thumbVisibility: true,
                              trackVisibility: true,
                              showTrackOnHover: true,
                              controller: _controller,
                              child: ListView(
                                  controller: _controller,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    for (var i = data.length - 1; i >= 0; i--)
                                      Component(ddata: data[i])
                                  ]),
                            ),
                          ),
                        ],
                      )
                    ]),
              )
            ]),
        bottomNavigationBar: Nav_bottom(class_number:0));
  }
}
