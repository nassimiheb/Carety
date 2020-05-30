import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;



class DataHelper {
 //function for update or put
  void editUserPoints(int numberViews, int time, String token) async {
  

    String myUrl = "http://localhost:8000/users/views";
    http.put(myUrl,
        body: {
         numberViews : numberViews,
         time : time,
        }).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }
  void editObjective(String _idObjc,int numberViews) async {
  
print("#############"+numberViews.toString());
    String myUrl = "https://carety.herokuapp.com/objectives/edit/$_idObjc";
    http.put(myUrl,
        body: {
         "numberViews" : "1",
        }).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }
 
   void signup(String email,String password,String username) async {
  

    String myUrl = "https://carety.herokuapp.com/signup";
    http.post(myUrl,
        body: {
         "email" : "$email",
         "password" :"$password",
         "userName" :"$username",
        }).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }
  
}
