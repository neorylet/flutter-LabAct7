import 'package:flutter/material.dart';
import 'package:tubera_task7_social_media/model/userdata.dart';
import 'package:tubera_task7_social_media/views/friendlist.dart';
import 'package:tubera_task7_social_media/views/infoheader.dart';
import 'package:tubera_task7_social_media/views/mainheader.dart';
import 'package:tubera_task7_social_media/views/postlist.dart';

class Socialmedia extends StatefulWidget {
  const Socialmedia({super.key});

  @override
  State<Socialmedia> createState() => _SocialmediaState();
}

class _SocialmediaState extends State<Socialmedia> {
  Userdata userdata = Userdata();

  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () { 
          Navigator.pop(context); 
        }, icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Mainheader(userdata: userdata),
          Infoheader(userdata: userdata),
          Friendlist(userdata: userdata),
          const SizedBox(height: 20),
          Padding(padding:
          const EdgeInsets.only(left: 8.0),
          child: Row (children: 
            [Text('Post', style: followTxtStyle,)]),
            ),
            const SizedBox(height: 20),
            Postlist(userdata: userdata),
        ],
      ),
    );
  }
}