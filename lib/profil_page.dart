import 'package:carety/ranking_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

const navcolor = const Color(0xffFFEDED);

class _ProfilePageState extends State<ProfilePage> {
 

  @override
  void initState() {
    super.initState();
   
  }

  Widget _buildItem(String title, String value) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(height: -1, fontSize: 12),
        ),
        trailing: Text(
          value,
          style: TextStyle(color: Colors.grey),
        ),
        onTap: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                  margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * .12,
                    MediaQuery.of(context).size.height * 0.04,
                    0,
                    0,
                  ),
                  height: 100,
                  child: Column(children: <Widget>[
                    Image.asset(
                      'assets/applogo.jpg',
                      height: 40,
                    ),
                    Text(
                      "Watch to donate",
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                  ])),
            ),
          ),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 18,
              margin: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.25,
                  MediaQuery.of(context).size.height * 0.28,
                  MediaQuery.of(context).size.width * 0.1,
                  MediaQuery.of(context).size.height * 0.23),
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: Text("General Information",
                          style: TextStyle(color: Color(0xFFF56B64))),
                    ),
                    _buildItem("Username", "value"),
                    Divider(
                      height: 0,
                      thickness: 0.5,
                    ),
                    _buildItem("Rank", "value"),
                    Divider(
                      height: 0,
                      thickness: 0.5,
                    ),
                    _buildItem("Views", "value"),
                    Divider(
                      height: 0,
                      thickness: 0.5,
                    ),
                    _buildItem("Points", "value"),
                    Divider(
                      height: 0,
                      thickness: 0.5,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: Text("Private details",
                          style: TextStyle(color: Color(0xFFF56B64))),
                    ),
                    _buildItem("Email", "value"),
                    Divider(
                      height: 0,
                      thickness: 0.5,
                    ),
                    _buildItem("Password", "value"),
                    Divider(
                      height: 0,
                      thickness: 0.5,
                    ),
                  ],
                ),
              )),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                  margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * .16,
                    MediaQuery.of(context).size.height * 0.21,
                    0,
                    0,
                  ),
                  height: 100,
                  width: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset('assets/img1.png'),
                    ),
                  )),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: 55,
              alignment: Alignment.bottomCenter,
              decoration: new BoxDecoration(
                color: navcolor,
                borderRadius: new BorderRadius.only(
                  topRight: const Radius.circular(80.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Icon(Icons.menu),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  GestureDetector(
                    onTap: () {
                     
                    },
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: Text(
                        "My Profile",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UsersListView()),
                      );
                    },
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: Text(
                        "Ranking",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context)
                      ;
                    },
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: Text(
                        "Home",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Icon(Icons.notifications),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
