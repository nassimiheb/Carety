import 'package:flutter/material.dart';
import 'dart:math';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

const maincolor = const Color(0xffFF3636);
const scndcolor = const Color(0xffFF9999);
const navcolor = const Color(0xffFFEDED);
const lancolor = const Color(0xffE83D40);

class _LandingState extends State<Landing> with TickerProviderStateMixin {
  PageController pageController;
  AnimationController _angleController;
  var _angle = 0.0;
@override
  void initState() {
    
    super.initState();
    _angleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _angleController.addListener(() {
      setState(() {
        _angle = _angleController.value * 180 / 360 * pi * 2;
      });
    });  
  }
  @override
  void dispose() {
    _angleController.dispose();
    super.dispose();
  }
  // @override
  // void initState() {
    
  //   super.initState();
  //   _anglcontroler = AnimationController(vsync: this, duration:Duration(seconds: 1));
  //   _anglcontroler.addStatusListener((status){
  //     if(status == AnimationStatus.completed){
  //       _anglcontroler.reverse();
  //     }else if(status == AnimationStatus.dismissed){
  //       _anglcontroler.forward();
  //     }

  //     _anglcontroler.addListener((){
  //         setState(() {
  //           angl = _anglcontroler.value;
  //         });
  //     });
  //     _anglcontroler.forward();
  //   });
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   pageController = PageController(viewportFraction: 0.6);
  // }

  // @override
  // void dispose() {
  //   pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lancolor,
      body: Container(
        /*alignment: Alignment.center,*/
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 3),
                  child: Image.asset(
                    'assets/face.png',
                    height: 80,
                  ),
                ),
                Container(
                  width: 60,
                  height: 30,
                  margin: EdgeInsets.only(left : 20,right: 20,bottom: 20,top: 25),
                  child: Column(
                    children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/eye2.png',
                        height: 10,
                        width: 30,
                      ),
                      Image.asset(
                        'assets/eye1.png',
                        height: 10,
                        width: 30,
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: _btntap,
                    child:
                  Container(
                  margin: EdgeInsets.only(left: 3,),
                  child:Transform.rotate(angle: _angle,
                  
                  child:
                   Image.asset(
                    'assets/mouth.png',
                    height: 10,
                    width: 30,
                  ),
                  ),
                ),
                ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              "Carety",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 53,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Donate by watching",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  ),
            )
            
          ],
        ),
      ),
    );
    
  }
  void _btntap(){
       if(_angleController.status == AnimationStatus.completed){
         _angleController.reverse();
       }else if(_angleController.status == AnimationStatus.dismissed){
        _angleController.forward();
       }
}
}

