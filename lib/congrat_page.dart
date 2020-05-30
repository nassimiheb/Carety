import 'package:flutter/material.dart';

class CongratPage extends StatefulWidget {
 
  @override
  _CongratPageState createState() => _CongratPageState();
}

class _CongratPageState extends State<CongratPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * .15),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(right: 32),
              width: 60.0,
              height: 40.0,
              child: RaisedButton(
                color: Color(0xFFFF9999),
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
          ),
          SizedBox(height: 8),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: MediaQuery.of(context).size.height * 0.15,
            child: Image.asset('assets/img1.png'),
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Textand persentage",
                  style: TextStyle(color: Color(0xFFFF3636), fontSize: 12),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  /* padding: new EdgeInsets.all(20.0),*/
                  width: MediaQuery.of(context).size.width * 0.55,
                  height: 5.0,
                  color: Color(0xFFFF9999),
                  alignment:
                      Alignment.centerLeft, // where to position the child
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 5.0,
                    color: Color(0xFFFF3636),
                  ),
                ),
              ]),
          SizedBox(height: 8),
          Text("Gel Pack (x1000)",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              )),
          SizedBox(height: 8),
          (MediaQuery.of(context).size.height > 700)
              ? Container(
                  margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: Text(
                      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna. ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      )),
                )
              : SizedBox(height: 2),
          SizedBox(height: 8),
          Text("Congratulation !",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          SizedBox(height: 8),
          Image.asset(
            "assets/confetti.png",
            scale: (MediaQuery.of(context).size.height > 700) ? 4 / 3 : 30 / 9,
          ),
          SizedBox(height: 8),
          Text("You participated with ",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              )),
          SizedBox(height: 2),
          Text("a percentage donation of 2%",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              )),
          SizedBox(height: 12),
          Container(
            width: 140.0,
            height: 50.0,
            child: RaisedButton(
              color: Color(0xFFFF3636),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Return",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
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
      ),
    ));
  }
}
