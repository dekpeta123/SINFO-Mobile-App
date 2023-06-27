import 'package:flutter/material.dart';
import 'package:sinfo/pages/articles_details_page.dart';
import 'package:sinfo/services/api_service.dart';
import 'package:sinfo/components/customListTile.dart';
import 'package:sinfo/model/article_model.dart';
import 'nav-drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: new Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () => _scaffoldKey.currentState?.openDrawer()),
        // automaticallyImplyLeading: false,
        title: Text("SINFO", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),

      drawer: drawerNew(),
      //Now let's call the APi services with futurebuilder wiget
      body: Container(
        color: Color(0xffF2DC6C),
        width: double.infinity,
        height: double.infinity,
        child: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            //let's check if we got a response or not
            if (snapshot.hasData) {
              //Now let's make a list of articles
              List<Article> article = snapshot.data ?? <Article>[];

              return ListView.builder(
                //Now let's create our custom List tile
                itemCount: article.length,
                itemBuilder: (context, index) =>
                    customListTile(article[index], context),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
