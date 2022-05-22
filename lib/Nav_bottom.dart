import 'package:etmam/Add1.dart';
import 'package:etmam/Home.dart';
import 'package:etmam/Requests.dart';
import 'package:etmam/Setting.dart';
import 'package:etmam/main.dart';
import 'package:flutter/material.dart';

class Nav_bottom extends StatefulWidget {
  Nav_bottom({Key? key, this.class_number}) : super(key: key);

  final int? class_number;
  @override
  State<Nav_bottom> createState() => _Nav_bottomState();
}

class _Nav_bottomState extends State<Nav_bottom> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      
      items: [
        BottomNavigationBarItem(
          backgroundColor: bg,
          icon: Icon(Icons.home),
          label: ar ? 'الرئيسية' : 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: bg,
          icon: Icon(Icons.add_box_rounded),
          label: ar ? 'طلب جديد' : 'New Reqest',
        ),
        BottomNavigationBarItem(
          backgroundColor: bg,
          icon: Icon(Icons.person),
          label: ar ? 'طلباتى' : 'My Request',
        ),
        BottomNavigationBarItem(
          backgroundColor: bg,
          icon: Icon(Icons.settings),
          label: ar ? 'ضبط' : 'Setting',
        ),
      ],
      currentIndex: widget.class_number??0,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white60,
      onTap: (v) {
        FocusManager.instance.primaryFocus?.unfocus();
        setState(() {
        });
        if (v == 0) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Home()),
              (Route<dynamic> route) => false);
        }
        if (v == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Add1()));
        }
        if (v == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Requests()));
        }
        if (v == 3) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Setting()));
        }
      },
    );
  }
}
