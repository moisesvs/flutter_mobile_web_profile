import 'dart:convert';
import 'package:flutterMobileWeb/data/Profile.dart';

import 'package:http/http.dart' as http;

class ProfileRepository {

  ProfileRepository();

  Future<Profile> fetchProfile() async {

      final response = await http.get('https://moisespersonalpage.firebaseio.com/profile/0.json');

      if (response.statusCode == 200) {
          // If the call to the server was successful, parse the JSON
          return Profile.fromJson(json.decode(response.body));
      } else {
          // If that call was not successful, throw an error.
          return null;
      }
      
  }
}