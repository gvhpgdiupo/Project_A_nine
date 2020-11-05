import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a_nine/allapp/login.dart';
import 'package:project_a_nine/allapp/push.dart';
import 'package:project_a_nine/allapp/register.dart';
import 'dart:io';

// void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  @override
  // ignore: must_call_super
  void initState() {
    // ignore: unnecessary_statements
    super.initState;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff392850),
      appBar: AppBar(
        backgroundColor: Color(0xff392850),
        title: Text('ยินดีต้อนรับ', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              MaterialPageRoute route =
                  MaterialPageRoute(builder: (value) => LoginPage());
              Navigator.push(context, route);
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "ครอบครัวน้องจ๊อบ",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "บ้าน",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Color(0xffa29aac),
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Image.asset(
                    "assets/setting.png",
                    width: 24,
                  ),
                  onPressed: () {
                    MaterialPageRoute materialPageRoute = MaterialPageRoute(
                        builder: (BuildContext context) => Sellcat());
                    Navigator.of(context).pushAndRemoveUntil(
                        materialPageRoute, (Route<dynamic> route) => false);
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GridDashboard()
        ],
      ),
    );
  }
}

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "ปฏิทิน",
      subtitle: "พฤศจิกา, จันทร์",
      event: "3 เหตุการณ์",
      img: "assets/calendar.png");

  Items item2 = new Items(
    title: "ร้านขายของชำ",
    subtitle: "ผัก, ผลไม้",
    event: "4 รายการ",
    img: "assets/food.png",
  );
  Items item3 = new Items(
    title: "สถานที่",
    subtitle: "กรุงเทพ",
    event: "",
    img: "assets/map.png",
  );
  Items item4 = new Items(
    title: "กิจกรรม",
    subtitle: "มีคำขอเป็นเพื่อน 1 รายการ",
    event: "",
    img: "assets/festival.png",
  );
  Items item5 = new Items(
    title: "สิ่งที่ต้องทำ",
    subtitle: "การบ้าน, ล้างจาน",
    event: "4 รายการ",
    img: "assets/todo.png",
  );

  // Items item6 = new Items(
  //   title: "ตั้งค่า",
  //   subtitle: "",
  //   event: "2 รายการ",
  //   img: "assets/setting.png",
  // );
  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white38,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.event,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;

  Items({this.title, this.subtitle, this.event, this.img});
}
