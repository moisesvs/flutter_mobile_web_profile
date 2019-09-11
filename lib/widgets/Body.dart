import 'package:flutter/material.dart';
import '../data/Profile.dart';

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
                flex: 2),
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

    Widget buildItem(BuildContext ctxt, int index) {

      return
      Center (
      child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profile.posts[index].title,
              style: TextStyle( fontWeight: FontWeight.bold, 
                                color: Colors.black, 
                                fontSize: 25),
            ),
            Text(
              profile.posts[index].shortDescription,
              style: TextStyle( fontWeight: FontWeight.normal, 
                                color: Colors.grey, 
                                fontSize: 17),
            ),
            Chip(
                label: Text(
                            profile.posts[index].tags[0],
                            style: TextStyle( fontWeight: FontWeight.normal, 
                                              color: Colors.white, 
                                              fontSize: 10)
                        ),
            )
          ],
        )
      );
    }
}