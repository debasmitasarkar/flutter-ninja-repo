import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:globant_flutter_ninja/pages/avatar.dart';

class JobListPage extends StatefulWidget {
  final String name;

  JobListPage({this.name});

  @override
  _JobListPageState createState() => _JobListPageState();
}

class _JobListPageState extends State<JobListPage> {
  List<CustomCard> cards;

  Firestore _firestore = Firestore.instance;

  @override
  void initState() {
    super.initState();
    _firestore
        .collection('categories')
        .document(widget.name)
        .collection('jobs')
        .getDocuments()
        .then((docs) {
      cards = [];
      docs.documents.forEach((doc) {
        cards.add(CustomCard(
          jobTitle: doc["role"],
          companyName: doc["companyName"],
          location: doc["location"],
          skils: doc["skills"],
          imageUrl: doc["logo"],
        ));
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            '${widget.name[0].toUpperCase()}${widget.name.substring(1)}',
            style: TextStyle(
                fontSize: 24.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            iconSize: 26.0,
          ),
          centerTitle: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.account_circle,
                color: Colors.black,
                size: 40.0,
              ),
            )
          ],
        ),
        body: cards == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                color: Colors.grey[100],
                child: ListView(
                  children: cards,
                ),
              ));
  }
}

class CustomCard extends StatelessWidget {
  final String jobTitle;
  final String companyName;
  final String location;
  final String skils;
  final String imageUrl;

  const CustomCard(
      {Key key,
      this.jobTitle,
      this.companyName,
      this.location,
      this.skils,
      this.imageUrl})
      : super(key: key);

  _buildRow(IconData icon, String data) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 25,
        ),
        Icon(icon),
        SizedBox(
          width: 10,
        ),
        Text(
          data ?? "",
          style: TextStyle(color: Color(0xff0f0250)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
      height: 210,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      width: double.infinity,
      //color: Colors.red,

      child: Card(
        borderOnForeground: true,
        elevation: 1.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  imageUrl == null || imageUrl == ''
                      ? Avatar("assets/images/google_logo.png")
                      : Avatar("assets/images/$imageUrl"),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        jobTitle,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                      Text(
                        companyName,
                        style: TextStyle(color: Color(0xff0f0250)),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              _buildRow(Icons.location_on, location),
              SizedBox(
                height: 10.0,
              ),
              _buildRow(Icons.alarm_add, skils)
            ],
          ),
        ),
      ),
    );
  }
}
