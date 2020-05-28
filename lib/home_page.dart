import 'package:flutter/material.dart'; 




class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(body: 
    Column(
      children: <Widget>[
        SizedBox(height: 30,),
        Image.asset('assets/applogo.jpg',height: 100,),
        Text("Watch to donate"),
        SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: PageView(
        
        controller: pageController,
        children: <Widget>[
          SlidingCard(
            name: 'Shenzhen GLOBAL DESIGN AWARD 2018',
            date: '4.20-30',
            assetName: 'hospital.jpeg', 
          ),
          SlidingCard(
            name: 'Dawan District, Guangdong Hong Kong and Macao',
            date: '4.28-31',
            assetName: 'hospital.jpeg',
          ),
        ],
      ),
    ),
    ],)
    )
    ;
 
 }

}



class SlidingCard extends StatelessWidget {
  final String name; //<-- title of the event
  final String date; //<-- date of the event
  final String assetName; //<-- name of the image to be displayed

  const SlidingCard({
    Key key,
    @required this.name,
    @required this.date,
    @required this.assetName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 20),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)), //<--custom shape
      child: Column(  
        children: <Widget>[
          Row(
            children: <Widget>[
          CircleAvatar( 
          radius: 60,
          backgroundImage: AssetImage('assets/hospital.jpeg',),
        ),
        Spacer(),
        Container(
          width: 40.0,
          height: 32.0,
          child : RaisedButton(
            color: Color(0XFFFF0000),
            child: Row(
              children: <Widget>[  
                Icon(Icons.share, color: Colors.white,),
              ],
            ),
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
        ),
            ],
      ),

     /*   RaisedButton(
                
                color: Color(0xFF162A49),
                child: Text('Reserve'),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                onPressed: () {},
              ),*/
      /*    Container(  //<--clipping image
          height: 100,
          width: 100,
             decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              color: Colors.redAccent,
            ), 
            child: Image.asset( //<-- main image
              'assets/$assetName',
              /*height: MediaQuery.of(context).size.height * 0.3,*/

             /* fit: BoxFit.none,*/
            ),
          ),*/
          SizedBox(height: 20),
          Expanded(
            child: CardContent( //<--replace the Container with CardContent
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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name, style: TextStyle(fontSize: 20)),
          SizedBox(height: 0),
          Text(date, style: TextStyle(color: Colors.grey)),
          Spacer(),
          Row(
            children: <Widget>[
              RaisedButton(
                color: Color(0xFF162A49),
                child: Text('Reserve'),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                onPressed: () {},
              ),
              Spacer(),
              Text(
                '2.00 \$',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 16),
            ],
          )
        ],
      ),
    );
  }
}