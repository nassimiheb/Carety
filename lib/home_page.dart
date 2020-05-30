import 'package:carety/ad_page.dart';
import 'package:carety/profil_page.dart';
import 'package:carety/ranking_page.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'tabs.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SlidingCardsView extends StatefulWidget {
  @required final String token;

  const SlidingCardsView({Key key, this.token}) : super(key: key);
  
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

const maincolor = const Color(0xffFF3636);
const scndcolor = const Color(0xffFF9999);
const navcolor = const Color(0xffFFEDED);
PageController pageController;

class _SlidingCardsViewState extends State<SlidingCardsView> {
  Future<List> getData() async {
    final response =
        await http.get("https://carety.herokuapp.com/objectives");
    //print(json.decode(response.body));
    return json.decode(response.body);
  }

  Future<List> getImportantObjectiveData() async {
    final response = await http
        .get("https://carety.herokuapp.com/objectives");
    //print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.6);
    this.getData();
    print(widget.token);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
    new WillPopScope(
    onWillPop: () async => false,
    child: 
    Scaffold(
      body: Stack(
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
                Text(
                  "Important Project",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                //###########
                FutureBuilder<List>(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? new ListItem(
                            list: snapshot.data,
                            token: widget.token,
                          )
                        : new Center(
                            child: new CircularProgressIndicator(),
                          );
                  },
                ),
                Text(
                  "Important Project",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                FutureBuilder<List>(
                  future: getImportantObjectiveData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? new ListItem(
                            list: snapshot.data,
                            token: widget.token,
                          )
                        : new Center(
                            child: new CircularProgressIndicator(),
                          );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 170),
                  child: Container(
                    width: 140.0,
                    height: 50.0,
                    child: RaisedButton(
                      color: maincolor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "View All",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )
                        ],
                      ),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(26),
                            topLeft: Radius.circular(120),
                            bottomLeft: Radius.circular(26),
                            bottomRight: Radius.circular(126)),
                      ),
                    ),
                  ),
                ),
              ],
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
                        MaterialPageRoute(builder: (context) => ProfilePage(token: widget.token,)),
                      );
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
                    height: MediaQuery.of(context).size.height * 0.10,
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
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                  GestureDetector(
                    onTap: () {
                     
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
    )
    );
  }
}

class ListItem extends StatelessWidget {
  final List list;
  final String token;
  const ListItem({Key key, this.list, this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.31,
      child: PageView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
             
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AdPage(
                          objectiveID: list[index]['_id'],
                          token : token,
                        )),
              );
              
            },
            child: SlidingCard(
              name: list[index]['objectiveName'],
              date: 'Lorem Ipsum has been the industrys ',
              img: list[index]['imageUrl'],
              per: 10,
            ),
          );
        },
        controller: pageController,
        /*children: <Widget>[
                     
                      SlidingCard(
                        name: 'Gel Pack (x1000)',
                        date:
                            'Lorem Ipsum has been the industrys standard dummy t...',
                        img: 'assets/hospital.jpeg',
                        per: 10,
                      ),
                    ], */
      ),
    );
  }
}

/**/

class SlidingCard extends StatelessWidget {
  final String name; //<-- title of the event
  final String date; //<-- date of the event
  final String img;
  final int per;
  //<-- name of the image to be displayed

  const SlidingCard({
    Key key,
    @required this.name,
    @required this.date,
    @required this.img,
    @required this.per,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 15, right: 7, bottom: 20),
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24)), //<--custom shape

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  left: 0,
                ),
                child: CircleAvatar(
                  radius: 43,
                  backgroundImage: NetworkImage(img),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(right: 10, bottom: 25),
                width: 60.0,
                height: 40.0,
                child: RaisedButton(
                  color: scndcolor,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(2),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(2)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Textand persentage",
                  style: TextStyle(color: maincolor, fontSize: 12),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  /* padding: new EdgeInsets.all(20.0),*/
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 5.0,
                  color: scndcolor,
                  alignment:
                      Alignment.centerLeft, // where to position the child
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.13,
                    height: 5.0,
                    color: maincolor,
                  ),
                ),
              ]),
          Expanded(
            child: CardContent(
              //<--replace the Container with CardContent
              name: name,
              date: date,
            ), //<-- will be replaced soon :)
          ),
        ],
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String name;
  final String date;

  const CardContent({Key key, @required this.name, @required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      /* padding: const EdgeInsets.all(20.0),*/
      padding: const EdgeInsets.only(bottom: 18, top: 14, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Text(
            date,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
