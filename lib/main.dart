import 'dart:io';
import 'package:etmam/Login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

bool ar = false;
double w = 0.0;
double h = 0.0;
double m = 0.0;
var bg = Color(0xff149e53);
var bg2 = Color(0xffA68C5B);
String logo = 'assets/images/logo_w.png';
txt({t, s, c, b}) {
  b ??= false;
  return Text(t ?? '',
      style: txt_(s: s, c: c, b: b), textAlign: TextAlign.center);
}

txt_({s, c, b}) {
  b ??= false;
  return TextStyle(
      fontFamily: 'Segoe UI',
      fontSize: (s ?? 15) + 0.0,
      color: c ?? bg,
      fontWeight: b ? FontWeight.bold : FontWeight.normal);
}

var text_style_bg = TextStyle(fontFamily: 'Segoe UI', fontSize: 16, color: bg);
var text_style_black =
    TextStyle(fontFamily: 'Segoe UI', fontSize: 16, color: Colors.black);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    ar = Platform.localeName.substring(0, 3) == 'ar_';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ETMAM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Frist(),
    );
  }
}

class Frist extends StatelessWidget {
  const Frist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    h = (MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top -
            MediaQuery.of(context).padding.bottom) /
        100;

    w = (MediaQuery.of(context).size.width -
            MediaQuery.of(context).padding.left -
            MediaQuery.of(context).padding.right) /
        100;
    m = (h >= w) ? w : h;
    return Login();
  }
}

List data = [
  {
    'sr': 25,
    'request': 'Pending',
    'title': 'Constructions And Demolition/ Construction & Demolition',
    'address': 'Mushref place / management building',
    'user': 'Ahmed Alobaid',
    'representative': 'Daham Aldaham',
    'date': '2022-03-20',
    'time': '05:20 pm'
  },
  {
    'sr': 32,
    'request': 'Accepted',
    'title': 'Constructions And Demolition/ Construction & Demolition',
    'address': 'Mushref place / management building',
    'user': 'Ahmed Alobaid',
    'representative': 'Daham Aldaham',
    'date': '2022-03-20',
    'time': '06:50 pm'
  },
  {
    'sr': 44,
    'request': 'Rejected',
    'title': 'Constructions And Demolition/ Construction & Demolition',
    'address': 'Mushref place / management building',
    'user': 'Ahmed Alobaid',
    'representative': 'Daham Aldaham',
    'date': '2022-03-21',
    'time': '05:30 pm'
  },
  {
    'sr': 54,
    'request': 'Pending',
    'title': 'Constructions And Demolition/ Construction & Demolition',
    'address': 'Mushref place / management building',
    'user': 'Ahmed Alobaid',
    'representative': 'Daham Aldaham',
    'date': '2022-03-22',
    'time': '05:20 pm'
  },
  {
    'sr': 67,
    'request': 'Accepted',
    'title': 'Constructions And Demolition/ Construction & Demolition',
    'address': 'Mushref place / management building',
    'user': 'Ahmed Alobaid',
    'representative': 'Daham Aldaham',
    'date': '2022-03-22',
    'time': '07:40 pm'
  },
  {
    'sr': 69,
    'request': 'Rejected',
    'title': 'Constructions And Demolition/ Construction & Demolition',
    'address': 'Mushref place / management building',
    'user': 'Ahmed Alobaid',
    'representative': 'Daham Aldaham',
    'date': '2022-03-23',
    'time': '05:10 pm'
  },
  {
    'sr': 71,
    'request': 'Pending',
    'title': 'Constructions And Demolition/ Construction & Demolition',
    'address': 'Mushref place / management building',
    'user': 'Ahmed Alobaid',
    'representative': 'Daham Aldaham',
    'date': '2022-03-24',
    'time': '02:20 pm'
  },
  {
    'sr': 76,
    'request': 'Accepted',
    'title': 'Constructions And Demolition/ Construction & Demolition',
    'address': 'Mushref place / management building',
    'user': 'Ahmed Alobaid',
    'representative': 'Daham Aldaham',
    'date': '2022-03-24',
    'time': '05:10 pm'
  },
  {
    'sr': 82,
    'request': 'Rejected',
    'title': 'Constructions And Demolition/ Construction & Demolition',
    'address': 'Mushref place / management building',
    'user': 'Ahmed Alobaid',
    'representative': 'Daham Aldaham',
    'date': '2022-03-24',
    'time': '08:50 pm'
  },
  {
    'sr': 88,
    'request': 'Pending',
    'title': 'Constructions And Demolition/ Construction & Demolition',
    'address': 'Mushref place / management building',
    'user': 'Ahmed Alobaid',
    'representative': 'Daham Aldaham',
    'date': '2022-03-25',
    'time': '04:70 pm'
  },
  {
    'sr': 92,
    'request': 'Accepted',
    'title': 'Constructions And Demolition/ Construction & Demolition',
    'address': 'Mushref place / management building',
    'user': 'Ahmed Alobaid',
    'representative': 'Daham Aldaham',
    'date': '2022-03-26',
    'time': '02:00 pm'
  },
  {
    'sr': 97,
    'request': 'Rejected',
    'title': 'Constructions And Demolition/ Construction & Demolition',
    'address': 'Mushref place / management building',
    'user': 'Ahmed Alobaid',
    'representative': 'Daham Aldaham',
    'date': '2022-03-27',
    'time': '07:10 pm'
  },
];
