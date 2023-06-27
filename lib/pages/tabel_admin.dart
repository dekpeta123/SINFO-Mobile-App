// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sinfo/main.dart';
import 'package:sinfo/pages/home.dart';

class dataadmin extends StatefulWidget {
  dataadmin({super.key});

  @override
  State<dataadmin> createState() => _dataadminState();
}

class _dataadminState extends State<dataadmin> {
  List _get = [];
  bool _ishide = true;

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

  Future _onDelete(context, int index) async {
    try {
      return await http.post(
        Uri.parse(
            "http://172.20.10.3/sinfo/php/delete_user.php?id_user=${_get[index]['id_user']}"),
        body: {
          "id_user": " ${_get[index]['id_user']}",
        },
      ).then((value) {
//print message after insert to database
//you can improve this message with alert dialog
        var data = jsonDecode(value.body);

        print(data["message"]);
// Remove all existing routes until the home.dart, then rebuild

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => dataadmin()));
      });
    } catch (e) {
      print(e);
    }
  }

//   SingleChildScrollView _tableuser() {
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: SingleChildScrollView(
//         child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Container(
//               color: Colors.white,
//               child: DataTable(
//                   columns: [
//                     DataColumn(label: Text("id")),
//                     DataColumn(label: Text("username")),
//                     DataColumn(label: Text("pass")),
//                     DataColumn(label: Text("nama")),
//                     DataColumn(label: Text("")),
//                   ],
//                   rows: _get
//                       .map((item) => DataRow(cells: <DataCell>[
//                             DataCell(Text(item['id_user'])),
//                             DataCell(Text(item['username'])),
//                             DataCell(Text(item['pass'])),
//                             DataCell(Text(item['nama'])),
//                             DataCell(IconButton(
//                               icon: Icon(Icons.delete),
//                               onPressed: () {
//                                 showDialog(
//                                   context: context,
//                                   builder: (BuildContext context) {
// //show dialog to confirm delete data
//                                     return AlertDialog(
//                                       content: Text(
//                                           'Apakah Kamu Yakin Ingin Menghapus?'),
//                                       actions: <Widget>[
//                                         ElevatedButton(
//                                           child: Icon(Icons.cancel),
//                                           onPressed: () =>
//                                               Navigator.of(context).pop(),
//                                         ),
//                                         ElevatedButton(
//                                           child: Icon(Icons.check_circle),
//                                           onPressed: () =>
//                                               _onDelete(context, 0),
//                                         ),
//                                       ],
//                                     );
//                                   },
//                                 );
//                               },
//                             )),
//                           ]))
//                       .toList()),
//             )),
//       ),
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xffB09243),
          title: Text("ADMIN"),
          leading: IconButton(
              icon: new Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: ListView.builder(
            itemCount: _get.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: EdgeInsets.all(5),
                child: Card(
                  color: Colors.amber,
                  child: ListTile(
                    title: Text('Nama : ${_get[index]['nama']}'),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            height: 10,
                            thickness: 1,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Username : ${_get[index]['username']}'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Password : ${_get[index]['pass']}'),
                              IconButton(
                                  onPressed: (() {
                                    _onDelete(context, index);
                                  }),
                                  icon: Icon(Icons.delete)),
                            ],
                          ),
                        ]),
                  ),
                ),
              );
            }))
        // Container(
        //   width: double.infinity,
        //   height: double.infinity,
        //   color: Color(0xffF2DC6C),
        //   child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     child: ListView(
        //       children: <Widget>[_tableuser()],
        //     ),
        //   ),
        // )

        // Container(
        //   width: double.infinity,
        //   height: double.infinity,
        //   color: Color(0xffF2DC6C),
        //   child: SingleChildScrollView(
        //     child: Container(
        //       color: Colors.white,
        //       child: SingleChildScrollView(
        //         scrollDirection: Axis.horizontal,
        //         child: DataTable(
        //           columns: [
        //             DataColumn(
        //                 label: Text(
        //               "ID",
        //               style: TextStyle(fontSize: 10),
        //             )),
        //             DataColumn(
        //                 label: Text("Nama", style: TextStyle(fontSize: 10))),
        //             DataColumn(
        //                 label: Text("Username", style: TextStyle(fontSize: 10))),
        //             DataColumn(
        //                 label: Text("Password", style: TextStyle(fontSize: 10))),
        //             DataColumn(label: Text(" ")),
        //           ],
        //           rows: [
        //             DataRow(cells: [
        //               DataCell(Text("001", style: TextStyle(fontSize: 10))),
        //               DataCell(Text("dekput", style: TextStyle(fontSize: 10))),
        //               DataCell(Text("dek123", style: TextStyle(fontSize: 10))),
        //               DataCell(Text("123", style: TextStyle(fontSize: 10))),
        //               DataCell(Icon(Icons.delete)),
        //             ]),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
