import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'profil_page.dart';
import 'tabs.dart';

class User {
  final String id;
  final int points;
  final int views;

  User({
    this.id,
    this.points,
    this.views,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['userName'],
      points: json['points'],
      views: json['views'],
    );
  }
}

const maincolor = const Color(0xffFF3636);
const scndcolor = const Color(0xffFF9999);
const navcolor = const Color(0xffFFEDED);

class UsersListView extends StatelessWidget {
  BuildContext get context => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    'assets/applogo.jpg',
                    height: 40,
                  ),
                  Text(
                    "Watch to donate",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Tabs(),
                  Container(
                    margin: EdgeInsets.only(left: 70,right: 20),
                    width: 300,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("UserName",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey,
                            )),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        
                        
                        Text("Rank",style: TextStyle(color: Colors.grey),),
                        Spacer(),
                        Text("Views",style: TextStyle(color: Colors.grey),),
                        Spacer(),
                        Text("Points",style: TextStyle(color: Colors.grey),),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.06,
              top: MediaQuery.of(context).size.height * 0.22),
          child: FutureBuilder<List<User>>(
            future: _fetchUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<User> data = snapshot.data;
                return _usersListView(data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                    child:RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    "My Profile",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                GestureDetector(
                    onTap: () {
                     
                    },
                    child: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    "Ranking",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                 GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child:RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    "Home",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                ),
                Icon(Icons.notifications),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Future<List<User>> _fetchUsers() async {
    final usersListAPIUrl = 'https://carety-api.herokuapp.com/users/rank';
    final response = await http.get(usersListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => new User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users from API');
    }
  }

  ListView _usersListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].id, data[index].points,data[index].views, Icons.work);
        });
  }

  Widget _tile(String title, int subtitle,int views, IconData icon) {
    return Container(
      height: 65,
      width: 200,
      child: Card(
        margin: EdgeInsets.only(left: 20, right: 12, bottom: 20),
        elevation: 4,
        child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: maincolor,
                    )),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Text(subtitle.toString()),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Text(views.toString()),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Text(subtitle.toString()),
              ],
            )),
      ),
    );
  }
}
