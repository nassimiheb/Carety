import 'package:carety/congrat_page.dart';
import 'package:carety/login_page.dart';
import 'package:carety/profil_page.dart';
import 'package:carety/signin_page.dart';
import 'package:flutter/material.dart';


import 'package:introduction_screen/introduction_screen.dart';

import 'ad_page.dart';
import 'home_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:SlidingCardsView(),
    );
  }
}

//#########################################################//

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const pageColor = const Color(0xFFFCF8F8);
const titleTextColor = const Color(0xFF4C5162);
const orangeX = const Color(0xFFFF3800);
const gradientFirst = const Color(0xffF8BE65);
const gradientSecond = const Color(0xfff9637f);

class _MyHomePageState extends State<MyHomePage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {}

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 16.0, color: Color(0xFFB6BBCC));

    const pageDecoration = const PageDecoration(
      pageColor: pageColor,
      titleTextStyle: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w700, color: titleTextColor),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
      titlePadding: EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 16.0),
      imagePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      contentPadding: EdgeInsets.fromLTRB(0, 100, 0, 0),
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: " Watching Videos",
          body:
              "Saisissez votre ville de départ et votre ville d'arrivée et trouvez les offres et les prix correspondants.",
          image: _buildImage('img1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Ranking ",
          body:
              "Sélectionnez le bus avec l'horaire qui vous convient et réservez votre place.",
          image: _buildImage('img2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Real time goals",
          body:
              "Confirmez votre réservation en payant dans un des points de vente visualisés via la map.",
          image: _buildImage('img3'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip', style: TextStyle(color: titleTextColor)),
      next: const Text("Next",
          style: TextStyle(
           
          )),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 16.0),
          activeColor: orangeX),
    );
  }
}

//#########################################################//

