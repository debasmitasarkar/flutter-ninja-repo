import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:globant_flutter_ninja/pages/auth.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  Auth auth = Auth();
  PageController _jobsController;

  @override
  void initState() {
    super.initState();
    _jobsController = PageController(viewportFraction: 0.8);
  }

  Widget _userAvatar() {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            width: 91.0,
            height: 91.0,
            padding: EdgeInsets.all(4.0),
            margin: EdgeInsets.only(top: 60.0),
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xfff2f1f5)),
            ),
            child: Container(
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: (auth.currentUser != null) ? NetworkImage(auth.currentUser.photoUrl) : new AssetImage('assets/images/user.jpg'))),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Text((auth.currentUser != null) ? auth.currentUser.displayName : 'Gowtham Raj',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xff0f0250),
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Text('UI / UX Designer',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xffababb5),
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  Widget _profileCompleteness() {
    var value = 0.87;
    var percent = (value * 100).ceil();
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        padding: EdgeInsets.only(left: 2.0, right: 2.0),
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 8.0, right: 10.0, bottom: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Profile completeness',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffababb5))),
                    Text('${percent}%',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffababb5)))
                  ],
                )),
            new LinearPercentIndicator(
              animation: true,
              lineHeight: 4.0,
              percent: value,
              backgroundColor: Color(0xffd8d8d8),
              progressColor: Color(0xff40cd86),
            )
          ],
        ));
  }

  Widget _recommendJobs() {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Recommended Jobs',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff0f0250)),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'SEE ALL',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2d1eeb)),
                    ),
                  )
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            height: 220.0,
            child: PageView(
              controller: _jobsController,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                JobCard(
                  jobTitle: 'Senior UI/UX Designer',
                  companyName: 'Microsoft Corp.',
                  location: 'Delhi',
                  colors: [
                    Color(0xff7500bf),
                    Color(0xff5b1ad1),
                  ],
                ),
                JobCard(
                  jobTitle: 'Software Developer',
                  companyName: 'Microsoft Corp.',
                  location: 'Mumbai',
                  colors: [
                    Color(0xffe90b7e),
                    Color(0xffff5a5a),
                  ],
                ),
                JobCard(
                  jobTitle: 'Lead Developer',
                  companyName: 'Google Corp.',
                  location: 'Pune',
                  colors: [
                    Color(0xff7500bf),
                    Color(0xff5b1ad1),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _recentActivities() {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Recent Activities',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0f0250)),
              )
            ],
          )),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ActivityCard(
                  icon: Icons.settings,
                  name: 'Saved Jobs',
                  count: 49,
                ),
                ActivityCard(
                  icon: Icons.check,
                  name: 'Applied',
                  count: 129,
                  color: Color(0xff2d1eeb),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _userAvatar(),
            _profileCompleteness(),
            Container(
              padding: EdgeInsets.only(bottom: 30.0),
              color: Color(0xfff5f7f9),
              child: Column(
                children: <Widget>[_recommendJobs(), _recentActivities()],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final String jobTitle;
  final String companyName;
  final String location;
  final List<Color> colors;

  JobCard(
      {Key key, this.jobTitle, this.companyName, this.location, this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8),
      padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      width: 240.0,
      height: 240.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          stops: [0.2, 0.6],
          colors: colors,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(jobTitle,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xfffefeff))),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Opacity(
              opacity: 0.6,
              child: Text(companyName,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff))),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Opacity(
              opacity: 0.49,
              child: Text(location,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff))),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 60.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 12.0, left: 15.0, right: 15.0, bottom: 12.0),
                    decoration: BoxDecoration(
                        color: new Color.fromRGBO(255, 255, 255, 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: Opacity(
                      opacity: 0.7,
                      child: Text('APPLY',
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xfffefeff))),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final IconData icon;
  final int count;
  final String name;
  final Color color;

  ActivityCard(
      {Key key,
      this.icon,
      this.count = 0,
      this.name = '',
      this.color = const Color(0xffeb1d96)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0, bottom: 20.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25.0))),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            child: Icon(icon, color: Color(0xffffffff)),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(count.toString(),
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff0f0250))),
                SizedBox(height: 5.0),
                Text(name,
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffababb5)))
              ],
            ),
          )
        ],
      ),
    );
  }
}
