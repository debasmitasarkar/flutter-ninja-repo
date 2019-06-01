import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'ar_page.dart';
import 'job_list_page.dart';

class CategoriesScreen extends StatefulWidget {
  final VoidCallback onProfileTap;

  CategoriesScreen({this.onProfileTap});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  Firestore _firestore = Firestore.instance;

  List<CategoryInfo> _cards = [];

  @override
  void initState() {
    super.initState();
    _firestore.collection('categories').getDocuments().then((docs) {
      docs.documents.forEach((doc) {
        _cards.add(CategoryInfo(doc.documentID,
            name: doc["name"],
            info: doc["jobs"] + " jobs found",
            icon: doc["logo"]));
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Text(
          "Categories",
          style: TextStyle(
              fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.wallpaper), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ArPage()));
          }, color: Colors.black,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  widget.onProfileTap();
                },
                child: CircleAvatar(
                  child: Image.asset(
                    'assets/images/avatar.png',
                    width: 40.0,
                    height: 40.0,
                  ),
                )),
          )
        ],
      ),
      body: _cards == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, position) {
                return _buildCard(_cards[position], position);
              },
              itemCount: _cards.length,
            ),
    );
  }

  Widget _buildCard(CategoryInfo info, int position) {
    print(info.icon);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        JobListPage(name: _cards[position].id)));
          },
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        'assets/images/${info.icon}',
                        height: 40,
                        width: 40,
                      )
                      ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.primaries[position][50],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 8.0),
                            child: Text(
                              info.name,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 2.0),
                            child: Text(
                              info.info,
                              style: TextStyle(color: Colors.black45),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryInfo {
  String id;
  String name;
  String info;
  String icon;

  CategoryInfo(this.id, {this.name, this.info, this.icon});
}
