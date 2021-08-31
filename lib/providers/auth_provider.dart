import 'package:auntie_rafiki/models/user.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{
   User? user;
  final String useremail = "geofreyx26@gmail.com";
  final String userpassword = "reyxreyxreyx";
  bool isLoggedIn = false;

  Future<bool> login({required String email, required String password})async{
    isLoggedIn = false;
    notifyListeners();
    if (email == useremail && password == userpassword) {
       user = User(email: useremail, name: "Geof");
       isLoggedIn = true;
    }
    notifyListeners();
    return isLoggedIn;
  }
}