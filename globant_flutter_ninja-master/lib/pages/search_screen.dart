import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: false,
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
        title: Text(
          "Search",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 26.0, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          _buildSearchTextBox(),
          _buildLocationChips(),
          _buildParamBars(),
          _buildFloatingActionButton()
        ],
      )),
    );
  }

  Widget _buildSearchTextBox() {
    return Container(
      height: 150.0,
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            decoration: InputDecoration.collapsed(
                hintText: "Keyskills, Designation, Companies"),
          ),
        ),
      ),
    );
  }

  Widget _buildLocationChips() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Locations",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Chip(
                    label: Text(
                      "India",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Chip(label: Text("Dubai")),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Chip(label: Text("Delhi")),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Chip(label: Text("London")),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Chip(label: Text("New York")),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildParamBars() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Others",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildParamBar(text: "Salary", position: 0),
              _buildParamBar(text: "Experience", position: 1),
              _buildParamBar(text: "Freshness", position: 2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildParamBar({String text, int position}) {
    double _lowerValue = 0;
    double _upperValue = 0;

    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.primaries[position][100],
            borderRadius: BorderRadius.circular(16.0),
          ),
          alignment: Alignment.center,
          height: 250.0,
          width: 90.0,
          child: Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(-24.0, 0.0),
                child: Transform.rotate(
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                          color: Colors.primaries[position], fontSize: 16.0),
                    ),
                  ),
                  angle: -1.57,
                ),
              ),
              FlutterSlider(
                min: 0.0,
                max: 100.0,
                values: [100],
                axis: Axis.vertical,
                rtl: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFloatingActionButton() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchScreen()));
          },
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Icon(
            Icons.search,
          ),
        ),
      ),
    );
  }
}
