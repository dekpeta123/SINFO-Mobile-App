import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sinfo/pages/screen_login.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final _formKey = GlobalKey<FormState>();
  bool _isHidePassword = true;

  void _togglePassword() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  TextEditingController user = TextEditingController();

  TextEditingController pass = TextEditingController();
  TextEditingController passCon = TextEditingController();
  TextEditingController nama = TextEditingController();

  Future _onSubmit() async {
    try {
      return await http.post(
        Uri.parse("http://172.20.10.3/sinfo/php/singup.php"),
        body: {
          "username": user.text,
          "pass": pass.text,
          "nama": nama.text,
        },
      ).then((value) {
        //print message after insert to database
        //you can improve this message with alert dialog
        var data = jsonDecode(value.body);
        print(data["message"]);

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Account Added")));

        Navigator.of(context)
            .pop(MaterialPageRoute(builder: (context) => const login()));
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffF2DC6C),
          leading: IconButton(
              icon: new Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(8),
              color: Color(0xffF2DC6C),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) return 'Empty';
                      return null;
                    },
                    controller: nama,
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
                        hintText: "Masukkan Nama",
                        hintStyle: TextStyle(color: Colors.black),
                        labelText: "Nama",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) return 'Empty';
                      return null;
                    },
                    controller: user,
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
                    validator: (val) {
                      if (val!.isEmpty) return 'Empty';
                      return null;
                    },
                    controller: pass,
                    obscureText: _isHidePassword,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _isHidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _isHidePassword = !_isHidePassword;
                            });
                          },
                        ),
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
                        hintText: "Masukkan Password",
                        hintStyle: TextStyle(color: Colors.black),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val != passCon.text) return 'Not Match';
                      return null;
                    },
                    controller: passCon,
                    obscureText: _isHidePassword,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _isHidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _isHidePassword = !_isHidePassword;
                            });
                          },
                        ),
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
                        hintText: "konfirmasi Password",
                        hintStyle: TextStyle(color: Colors.black),
                        labelText: "konfirmasi Password",
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
                          _onSubmit();
                        },
                        child: Center(
                          child: Text(
                            "Sign up",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _onSubmit();
                          }
                        },
                        child: Text(
                          "Login?",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
