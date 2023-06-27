import 'dart:convert';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sinfo/main.dart';
import 'package:sinfo/pages/screen_register.dart';
import 'package:sinfo/pages/tabel_admin.dart';

class loginadmin extends StatefulWidget {
  const loginadmin({super.key});

  @override
  State<loginadmin> createState() => _loginadminState();
}

class _loginadminState extends State<loginadmin> {
  bool _isHidePassword = true;
  late List _get;

  TextEditingController user_admin = new TextEditingController();
  TextEditingController pass_admin = new TextEditingController();
  Future _login() async {
    final response = await http
        .post(Uri.parse("http://172.20.10.3/sinfo/php/login_admin.php"), body: {
      "username_admin": user_admin.text,
      "pass_admin": pass_admin.text,
    });
    if (response.statusCode == 200) {
      final datauser = jsonDecode(response.body);

      // entry data to variabel list _get
      setState(() {
        _get = datauser;
      });
    }

    if (_get.isEmpty) {
      setState(() {
        tampil();
      });
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => dataadmin()));
      setState(() {});
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
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(8),
          color: Color(0xffF2DC6C),
          child: Column(
            children: <Widget>[
              Container(
                width: 250,
                height: 250,
                child: Center(
                  child: Image.asset("assets/logo_sinfo.png"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 11,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            "Login Admin",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
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
                controller: user_admin,
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
                controller: pass_admin,
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
                      _login();
                    },
                    child: Center(
                      child: Text(
                        "Login",
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
                    onPressed: () {},
                    child: Text(
                      "Regist?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void tampil() {
    Fluttertoast.showToast(
        msg: "LOGIN GAGAL",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
