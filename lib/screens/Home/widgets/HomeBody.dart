import 'package:flutter/material.dart';
import 'package:flutterMobileWeb/data/PostFeed.dart';
import 'package:flutterMobileWeb/data/Profile.dart';
import 'package:flutterMobileWeb/screens/Login/LoginPage.dart';

class BodyError extends StatefulWidget {
  @override
  _BodyErrorState createState() => _BodyErrorState();
}

class _BodyErrorState extends State<BodyError> {

    String error = "Error default";

    void setError(String error) {
      setState(() { this.error = error; });
    }

    @override
    Widget build (BuildContext ctxt) {
      return Container(
                  decoration: new BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Align( alignment: Alignment.center, 
                                  child: Container (
                                  child: Text (this.error,
                                            style: TextStyle( fontWeight: FontWeight.bold, 
                                                      color: Colors.black, 
                                                      fontSize: 20
                                                      )            
                                        ),
                                ) 
                  )
              )
      );
    }
}

class BodyLoading extends StatelessWidget {

    @override
    Widget build (BuildContext ctxt) {
      return Container(
                  decoration: new BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Align( alignment: Alignment.center, 
                                  child: Container (
                                  child: new CircularProgressIndicator()
                                ) 
                  )
              )
      );
    }

}

class BodyHome extends StatelessWidget {

    final Profile profile;

    BodyHome({this.profile});

    @override
    Widget build (BuildContext ctxt) {
      return 
      Row (
        children : [
        Flexible(child: Container(), flex: 1),
        Flexible(child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListDisplay(profile: profile),
                  ],
                ), 
                flex: 15),
        Flexible(child: Container(), flex: 1),
        ]
      );
    }
}

class ListDisplay extends StatelessWidget {

    final Profile profile;

    ListDisplay({this.profile});

    @override
    Widget build (BuildContext ctxt) {
      return new ListView.separated (
        shrinkWrap: true,
        primary: false,
        itemCount: this.profile.posts.length,
        itemBuilder: (BuildContext ctxt, int index) => buildItem(ctxt, index), 
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      );
    }

    Widget buildItem(BuildContext context, int index) {
      PostFeed post = profile.posts[index];
      return

      Card (
      color: Colors.white,
      elevation: 3,
      child:  
        InkWell(
          child:
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(title : 
                  Text(
                      post.title,
                      style: TextStyle( fontWeight: FontWeight.bold, 
                                        color: Colors.black, 
                                        fontSize: 25),
                  )
                ),
                ListTile(
                  title : Text(
                  profile.posts[index].shortDescription,
                  style: TextStyle( fontWeight: FontWeight.normal, 
                                    color: Colors.grey, 
                                    fontSize: 17),
                  
                  )
                ),
                Padding(
                  padding: EdgeInsets.only( top: 5.0, 
                                            left: 10.0, 
                                            bottom: 7.0),
                  child: Chip(
                      backgroundColor: Colors.grey,
                      label: Text(
                                profile.posts[index].tags[0],
                                style: TextStyle( fontWeight: FontWeight.normal, 
                                                  color: Colors.white, 
                                                  fontSize: 10)
                            ),
                ))
              ],
            ),
            onTap: () {
                Navigator.of(context).pushNamed(LoginPage.routeName);
            },
        )
       
      );
    }
}