import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  final String id;
  final int points;
  final int views;


  User({this.id, this.points, this.views, });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      points: json['points'],
      views: json['views'],
    );
  }
}

class UsersListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(body:
    FutureBuilder<List<User>>(
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
          return _tile(data[index].id, data[index].points, Icons.work);
        });
  }

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        subtitle: Text(subtitle),
        leading: Icon(
          icon,
          color: Colors.blue[500],
        ),
      );
}