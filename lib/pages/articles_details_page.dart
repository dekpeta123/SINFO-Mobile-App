//Now let's create the article details page

import 'package:google_fonts/google_fonts.dart';
import 'package:sinfo/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:sinfo/components/customListTile.dart';

class ArticlePage extends StatelessWidget {
  final Article article;

  ArticlePage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: new Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(
          "Detail Berita",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xffF2DC6C),
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    //let's add the height

                    image: DecorationImage(
                        image: NetworkImage(article.urlToImage),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  child: SizedBox(
                    height: 8.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          article.title,
                          style: GoogleFonts.inter(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 50.0, left: 50),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(6.0),
                  // decoration: BoxDecoration(
                  //   color: Colors.red,
                  //   borderRadius: BorderRadius.circular(30.0),
                  // ),
                  child: Text(
                    article.publishedAt,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: Color.fromARGB(255, 99, 99, 99),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    article.content,
                    style: GoogleFonts.inter(
                      fontSize: 13.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    article.author,
                    style: GoogleFonts.inter(
                      fontSize: 13.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// Column(
//           children: [
//             Container(
//               height: 250,
//               color: Colors.grey[200],
//             ),
//             Container(
//               padding: ,
//               margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'title',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     'date',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Text('content'),
//                   Divider(),
//                   Text('autor'),
//                   Text('sumber')
//                 ],
//               ),
//             ),
            
//           ],
          
//         )