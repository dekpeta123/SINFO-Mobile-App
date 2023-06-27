import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinfo/main.dart';
import 'package:sinfo/pages/first_screen.dart';
import 'package:sinfo/pages/screen_gantipassword.dart';
import 'package:sinfo/pages/screen_login.dart';

class drawerNew extends StatefulWidget {
  @override
  State<drawerNew> createState() => _drawerNewState();
}

class _drawerNewState extends State<drawerNew> {
  List _get = [];

  //make different color to different card

  @override
  void initState() {
    super.initState();
    //in first time, this method will be executed
    _getData();
  }

  Future _getData() async {
    try {
      final response = await http.get(
        Uri.parse(
            //you have to take the ip address of your computer.
            //because using localhost will cause an error
            "http://172.20.10.3/sinfo/php/data_user.php"),
      );

      // if response successful
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // entry data to variabel list _get
        setState(() {
          _get = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return
        // Container(
        //   width: 300,
        //   height: 20,
        //   alignment: Alignment.topCenter,
        //   child: AppBar(
        //     leading: IconButton(
        //         icon: new Icon(
        //           Icons.arrow_back_ios,
        //           color: Colors.black,
        //         ),
        //         onPressed: () {
        //           Navigator.of(context).pop();
        //         }),
        //   ),
        // );

        Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(
              icon: Icons.edit_sharp,
              text: 'Edit Password',
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (
                      context,
                    ) =>
                            gantipassword(id: _get[0]['id_user'])));
              }),
          // Divider(height: 25, thickness: 1),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
          //   child: Text("Labels",
          //       style: TextStyle(
          //         fontSize: 16,
          //         color: Colors.black54,
          //       )),
          // ),
          SizedBox(
            height: 330,
          ),
          Container(
            child: _drawerItem(
                icon: Icons.logout,
                text: "Logout",
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => firstScreen()));
                }),
          ),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xffF2DC6C),
            ),
            margin: EdgeInsets.only(bottom: 50, top: 50, left: 20, right: 20),
            width: 300,
            height: 110,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  username,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                ),
              ],
            )),
      ],
    ),
  );
}

Widget _drawerItem(
    {required IconData icon,
    required String text,
    required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
