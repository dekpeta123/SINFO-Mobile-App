import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinfo/pages/home.dart';
import 'package:sinfo/pages/screen_login.dart';
import 'package:sinfo/pages/screenlogin_Admin.dart';
import 'package:sinfo/pages/tabel_admin.dart';

class firstScreen extends StatelessWidget {
  const firstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          // Container(
          //   width: double.infinity,
          //   height: double.infinity,
          //   color: Colors.red[100],
          // ),
          Image.asset(
            'assets/matahari.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.center,
            // child: Container(
            //     width: 200,
            //     height: 200,
            //     decoration: BoxDecoration(
            //       image: DecorationImage(
            //           image: AssetImage('assets/kita.jpg'), fit: BoxFit.cover),
            //       borderRadius: BorderRadius.circular(100),
            //     )),
            child: Image.asset('assets/logo_sinfo.png'
                // 'assets/latar_matahari.jpg',
                ),
          ),
          Positioned(
            bottom: 15,
            right: 200,
            left: 0,
            child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return login();
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white),
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, right: 75, left: 75),
                      child: Text('USER',
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w800)),
                    )),
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            right: 0,
            left: 200,
            child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return loginadmin();
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.black),
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, right: 75, left: 75),
                      child: Text('ADMIN',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w800)),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
