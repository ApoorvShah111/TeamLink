import 'package:adg_hackathon/components/feed_tile.dart';
import 'package:flutter/material.dart';

import '../../components/feed.dart';

class FeedPage extends StatefulWidget {

  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();

} // end of FeedPage class



class _FeedPageState extends State<FeedPage> {

  @override
  Widget build(BuildContext context) {
    
    return const Center(child: Text("Feed Page", style: TextStyle(fontSize: 30)));
    
    
    /*return Column(
      children: [

        // Search bar
        Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Search", style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 105, 105, 105))),
              Icon(Icons.search, color: Color.fromARGB(255, 105, 105, 105),),
            ],
          ),
        ),

        SizedBox(height: 10),

        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              Feed feed = Feed(name: "Feed-1", imagePath: "lib/images/google.jpeg");
              return FeedTile(feed: feed);
            })
        )
        


      ],
    );*/
    
  }


} // end of _FeedPageState class