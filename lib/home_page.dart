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
      height: MediaQuery.of(context).size.height * 0.4,
      child: PageView(
        
        controller: pageController,
        children: <Widget>[
          SlidingCard(
            name: 'Gel Pack (x1000)',
            date: 'Lorem Ipsum has been the industrys standard dummy text ever since the...',
            img: 'assets/hospital.jpeg',
            per: 10,
            
          ),
          SlidingCard(
            name: 'Gel Pack (x1000)',
            date: 'Lorem Ipsum has been the industrys standard dummy text ever since the...',
            img: 'assets/hospital.jpeg',
            per: 10,
            
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
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 20),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)), //<--custom shape
      
      child: Column(  
         
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
          CircleAvatar( 
          radius: 70,
          backgroundImage: AssetImage(img,),
        ),
        Spacer(),  
       
        Container(
          
          width: 60.0,
          height: 40.0,
          child : RaisedButton(
            color: Color(0XFFFF0000),
            child: Row(        
              children: <Widget>[  
                Icon(Icons.share, color: Colors.white,),
              ],
            ),
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(2),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(2)),
            ),
          ),
        ),
            ],
      ),
          SizedBox(height: 20),

          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              Text("Textand persentage"),
              SizedBox(height: 6,),
              Container(
           /* padding: new EdgeInsets.all(20.0),*/
            width: 235.0,
            height: 5.0,
            color: Colors.orange,
            alignment: Alignment.centerLeft, // where to position the child
            child: Container(
              width: 190.0,
              height: 5.0,
              color: Colors.blue,
            ),
          ),
            ]
          ),
        
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
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Text(date, style: TextStyle(color: Colors.grey)),
          Spacer(),
        ],
      ),
    );
  }
}