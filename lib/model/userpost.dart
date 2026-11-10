import 'package:tubera_task7_social_media/model/usercomment.dart';

class Userpost {
  final String userimg;
  final String username;
  final String time;
  final String postcontent;
  final String postimg;
  final String numshare;
  final List<Usercomment> comments;
  bool isliked;

  Userpost({
    required this.userimg,
    required this.username,
    required this.time,
    required this.postcontent,
    required this.postimg,
    required this.numshare,
    required this.isliked,
    List<Usercomment>? comments,
  }) : comments = comments ?? [];

  int get numComments => comments.length;
}
