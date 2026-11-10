import 'package:tubera_task7_social_media/model/account.dart';
import 'package:tubera_task7_social_media/model/friend.dart';
import 'package:tubera_task7_social_media/model/usercomment.dart';
import 'package:tubera_task7_social_media/model/userpost.dart';

class Userdata {
  List<Userpost> userList = [
    Userpost(
      userimg: 'assets/person1.png',
      username: 'Tubera',
      time: '2 hrs ago',
      postcontent: 'Just finished a heavy chest day at the gym. 💪',
      postimg: 'assets/pavlova.jpg',
      numshare: '5',
      isliked: false,
      comments: [
        Usercomment(
          commenterImg: 'assets/person2.jpg',
          commenterName: 'Kobe Bryant',
          commenterTime: '6 hrs',
          commenterContent: 'Looking strong bro!',
        ),
        Usercomment(
          commenterImg: 'assets/person3.jpg',
          commenterName: 'John Smith',
          commenterTime: '2 hrs',
          commenterContent: 'Let’s hit the gym together next time.',
        ),
        Usercomment(
          commenterImg: 'assets/person4.jpg',
          commenterName: 'Matthew',
          commenterTime: '8 hrs',
          commenterContent: 'Keep up the grind man.',
        ),
      ],
    ),

    Userpost(
      userimg: 'assets/person2.jpg',
      username: 'John Carl',
      time: '3 hrs ago',
      postcontent: 'Upgrading my PC setup today. Can’t wait to test the new GPU!',
      postimg: 'assets/pavlova.jpg',
      numshare: '5',
      isliked: false,
    ),

    Userpost(
      userimg: 'assets/person3.png',
      username: 'Kobe Bryant',
      time: '5 hrs ago',
      postcontent: 'Weekend basketball run with the guys. 🏀',
      postimg: 'assets/pavlova.jpg',
      numshare: '20',
      isliked: true,
    ),

    Userpost(
      userimg: 'assets/person4.jpg',
      username: 'Jhon Smith',
      time: '2 hrs ago',
      postcontent: 'Late night coding grind. Coffee keeps me alive.',
      postimg: 'assets/pavlova.jpg',
      numshare: '5',
      isliked: true,
    ),
  ];
  
  List<Friend> friendList = [
    Friend(img: 'assets/person1.jpg', name: 'Aaron'),
    Friend(img: 'assets/person2.jpg', name: 'Bruce'),
    Friend(img: 'assets/person3.jpg', name: 'Caleb'),
    Friend(img: 'assets/person4.jpg', name: 'Derek'),
    Friend(img: 'assets/person5.jpg', name: 'Ethan'),
    Friend(img: 'assets/person6.jpg', name: 'Felix'),
  ];

  Account myUserAccount = Account(
    name: 'Neo Tubera',
    email: 'tubera123@gmail.com',
    img: 'assets/mypicture.jpg',
    numFollowers: '180',
    numPosts: '200',
    numFollowing: '150',
    numFriends: '50',
  );
}