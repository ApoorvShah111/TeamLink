import 'package:flutter/material.dart';
import 'feed.dart';

class FeedTile extends StatelessWidget {
  
  Feed feed;

  FeedTile({super.key, required this.feed});
  
  @override
  Widget build(BuildContext context) {
    return Container (
      margin: EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey, 
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column (children: [

        Image.asset(feed.imagePath)

      ],)

    );


  }


}