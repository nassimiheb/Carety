import 'package:carety/congrat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

import 'package:video_player/video_player.dart';

import 'controllers/dataHelper.dart';

class SlidingCardsView extends StatefulWidget {
  final String objectiveID;
  final String token;

  const SlidingCardsView({Key key, this.objectiveID, this.token}) : super(key: key);
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

int timeWatched = 0;
bool isPlaying = false;
String obID="";
class _SlidingCardsViewState extends State<SlidingCardsView> {
  PageController pageController;
  double pageOffset = 0;

  // RewardedVideoAd videoAd = RewardedVideoAd.instance;
  @override
  void initState() {
    super.initState();
    obID=widget.objectiveID;
    pageController = PageController(viewportFraction: 0.9);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.60,
      child: PageView(
        controller: pageController,
        children: <Widget>[
          SlidingCard(
            name: 'Shenzhen GLOBAL DESIGN AWARD 2018',
            date: '4.20-30',
            assetName: 'steve-johnson.jpeg',
            offset: pageOffset,
            url:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            objectiveID: widget.objectiveID,
          ),
          SlidingCard(
            name: 'Dawan District, Guangdong Hong Kong and Macao',
            date: '4.28-31',
            assetName: 'rodion-kutsaev.jpeg',
            offset: pageOffset - 1,
            url:
                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            objectiveID: widget.objectiveID,
          ),
        ],
      ),
    );
  }
}

class SlidingCard extends StatefulWidget {
  final String name;
  final String date;
  final String assetName;
  final double offset;
  final String url;
  final String objectiveID;
  SlidingCard({
    Key key,
    @required this.name,
    @required this.date,
    @required this.assetName,
    @required this.offset,
    @required this.url,
    @required this.objectiveID,
  }) : super(key: key);
  @override
  _SlidingCardState createState() => _SlidingCardState();
}

class _SlidingCardState extends State<SlidingCard> {
  VideoPlayerController playerController;
  VoidCallback listener;
  DataHelper dataHelper = new DataHelper();
  void initState() {
    super.initState();

    listener = () {
      setState(() {
        if (playerController.value.isPlaying) {
          timeWatched += 1;
          print(timeWatched);
        } else {
          isPlaying = false;
        }
      });
    };
  }

  @override
  void deactivate() {
    if (playerController != null) {
      playerController.setVolume(0.0);
      playerController.removeListener(listener);
    }
    super.deactivate();
  }

  void createVideo() {
    if (playerController == null) {
      playerController = VideoPlayerController.network(widget.url /**/)
        ..addListener(listener)
        ..setVolume(1.0)
        ..initialize()
        ..play();
    } else {
      if (playerController.value.isPlaying) {
        playerController.pause();
      } else {
        playerController.initialize();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((widget.offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * widget.offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 0, right: 8, bottom: 24),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Container(
                    alignment: Alignment(-widget.offset.abs(), 0),
                    child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: (playerController != null
                            ? VideoPlayer(
                                playerController,
                              )
                            : Image.asset("assets/steve-johnson.jpeg"))))),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 120.0,
                  height: 30.0,
                  child: RaisedButton(
                    color: Color(0xFFFF3636),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "PLAY",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )
                      ],
                    ),
                    onPressed: () {
                      createVideo();

                      playerController.play();

                      //timeWatched+=playerController.value.duration.;
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(26),
                          topLeft: Radius.circular(120),
                          bottomLeft: Radius.circular(26),
                          bottomRight: Radius.circular(126)),
                    ),
                  ),
                ),
                Container(
                  width: 100.0,
                  height: 30.0,
                  child: RaisedButton(
                    color: Color(0xFFF9999),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "STOP",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )
                      ],
                    ),
                    onPressed: () {
                      //update profile by adding point with timeWatched and token 
                      //dataHelper.editUserPoints(timeWatched~/15, timeWatched~/2);
                      //update Objective by adding point with timeWatched
                      
                      dataHelper.editObjective(obID,timeWatched~/30);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CongratPage()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(26),
                          topLeft: Radius.circular(120),
                          bottomLeft: Radius.circular(26),
                          bottomRight: Radius.circular(126)),
                    ),
                  ),
                ),
              ],
            )
            //SizedBox(height: 8),
            /* Expanded(
              child: CardContent(
                name: name,
                date: date,
                offset: gauss,
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}

/*class CardContent extends StatelessWidget {
  final String name;
  final String date;
  final double offset;

  const CardContent(
      {Key key,
      @required this.name,
      @required this.date,
      @required this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(8 * offset, 0),
            child: Text(name, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 8),
          Transform.translate(
            offset: Offset(32 * offset, 0),
            child: Text(
              date,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Spacer(),
          Row(
            children: <Widget>[
              Transform.translate(
                offset: Offset(48 * offset, 0),
                child: RaisedButton(
                  color: Color(0xFF162A49),
                  child: Transform.translate(
                    offset: Offset(24 * offset, 0),
                    child: Text('Reserve'),
                  ),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  onPressed: () {},
                ),
              ),
              Spacer(),
              Transform.translate(
                offset: Offset(32 * offset, 0),
                child: Text(
                  '0.00 \$',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(width: 16),
            ],
          )
        ],
      ),
    );
  }}*/
