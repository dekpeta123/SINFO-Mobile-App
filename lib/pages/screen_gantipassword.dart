import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sinfo/main.dart';
import 'package:sinfo/pages/home.dart';
import 'package:sinfo/pages/screen_login.dart';
import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class gantipassword extends StatefulWidget {
  gantipassword({super.key, required this.id});
  String id;
  @override
  State<gantipassword> createState() => _gantipasswordState();
}

class _gantipasswordState extends State<gantipassword> {
  bool _isHidePassword = true;
  late List _get;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _togglePassword() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  final _formkey = GlobalKey<FormState>();

  var Username = TextEditingController();
  var pass = TextEditingController();
  var pass_baru = TextEditingController();

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
//you have to take the ip address of your computer.
//because using localhost will cause an error
//get detail data with id
          "http://172.20.10.3/sinfo/php/detail_user.php?id_user='${widget.id}'"));
// if response successful
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          Username = TextEditingController(text: data['username']);
          pass = TextEditingController(text: data['pass']);
          pass_baru = TextEditingController(text: data['pass']);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future _onUpdate(context) async {
    try {
      return await http.post(
        Uri.parse(
            "http://172.20.10.3/sinfo/php/edit_pass.php?id_user='${widget.id}'"),
        body: {
          "id_user": widget.id,
          "Username": Username.text,
          "Pass": pass_baru.text,
        },
      ).then((value) {
//print message after insert to database
//you can improve this message with alert dialog
        var data = jsonDecode(value.body);

        print(data["message"]);

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Update Success ")));
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: new Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(8),
            color: Color(0xffF2DC6C),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Text(
                      "Ganti Password",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                TextFormField(
                  controller: Username,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: "Masukkan Username",
                      hintStyle: TextStyle(color: Colors.black),
                      labelText: "Username",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 11,
                ),
                TextFormField(
                  controller: pass,
                  obscureText: _isHidePassword,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: "Masukkan password",
                      hintStyle: TextStyle(color: Colors.black),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 11,
                ),
                TextFormField(
                  controller: pass_baru,
                  obscureText: _isHidePassword,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: "Masukkan Password Baru",
                      hintStyle: TextStyle(color: Colors.black),
                      labelText: "Password Baru",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 11,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.black,
                  elevation: 5,
                  child: Container(
                    height: 50,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        _onUpdate(context);
                      },
                      child: Center(
                        child: Text(
                          "Ganti Password",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
              ],
            ),
          ),
        ));
  }
}
