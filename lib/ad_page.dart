import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'exhibition_bottom_sheet.dart';
import 'sliding_cards.dart';
import 'tabs.dart';

//import 'package:firebase_admob/firebase_admob.dart';

const String testDevices = 'Mobile_id';

class AdPage extends StatefulWidget {
  final String objectiveID;

  const AdPage({Key key, this.objectiveID}) : super(key: key);
  @override
  _AdPageState createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {
 

  VideoPlayerController playerController;
  VoidCallback listener;


  @override
  void initState() {
    super.initState();

    listener = () {
      setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          
          Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Header(),
                SizedBox(height: 80),
               
                SlidingCardsView(objectiveID: widget.objectiveID,),
              ],
            ),
          ),
          ExhibitionBottomSheet(), //use this or ScrollableExhibitionSheet
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Image.asset("assets/applogo.png"));
  }
}

