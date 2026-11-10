import 'package:flutter/material.dart';
import 'package:tubera_task7_social_media/model/usercomment.dart';
import 'package:tubera_task7_social_media/model/userdata.dart';
import 'package:tubera_task7_social_media/model/userpost.dart';

class ProfilView extends StatefulWidget {
  const ProfilView({super.key, required this.userPost, required this.userdata});

  final Userpost userPost;
  final Userdata userdata;

  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  final TextEditingController _commentController = TextEditingController();
  final FocusNode _commentFocusNode = FocusNode();

  final nametxtStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  final boldtxtstyle = const TextStyle(fontWeight: FontWeight.bold);
  final boldtxtStyle1 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  Userpost get userPost => widget.userPost;

  @override
  void dispose() {
    _commentController.dispose();
    _commentFocusNode.dispose();
    super.dispose();
  }

  void _addComment() {
    final content = _commentController.text.trim();
    if (content.isEmpty) {
      return;
    }

    setState(() {
      userPost.comments.add(
        Usercomment(
          commenterImg: widget.userdata.myUserAccount.img,
          commenterName: widget.userdata.myUserAccount.name,
          commenterTime: 'now',
          commenterContent: content,
        ),
      );
      _commentController.clear();
    });
    FocusScope.of(context).unfocus();
  }

  Widget commentButton(Usercomment comment) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Row(
      children: [
        Text(comment.commenterTime),
        const SizedBox(width: 15),
        const Text('Like'),
        const SizedBox(width: 15),
        const Text('Reply'),
      ],
    ),
  );

  Widget commentDescription(Usercomment comment) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      color: Color.fromARGB(35, 158, 158, 158),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(comment.commenterName, style: boldtxtstyle),
        const SizedBox(height: 5),
        Text(comment.commenterContent),
      ],
    ),
  );

  Widget userComment(Usercomment comment) => Padding(
    padding: const EdgeInsets.only(top: 15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage(comment.commenterImg),
            radius: 20,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [commentDescription(comment), commentButton(comment)],
          ),
        ),
      ],
    ),
  );

  Widget commentsHeader() => Column(
    children: [
      const Divider(color: Colors.grey),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text('Comments (${userPost.numComments})', style: boldtxtStyle1),
          ],
        ),
      ),
      const SizedBox(height: 5),
    ],
  );

  Widget buttons() => Column(
    children: [
      const Divider(color: Colors.grey),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: userPost.isliked ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  userPost.isliked = !userPost.isliked;
                });
              },
              icon: const Icon(Icons.thumb_up, size: 20),
              label: const Text('Like'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
              onPressed: _commentFocusNode.requestFocus,
              icon: const Icon(Icons.chat_bubble, size: 20),
              label: const Text('comment'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
              onPressed: () {},
              icon: const Icon(Icons.share, size: 20),
              label: const Text('Share'),
            ),
          ],
        ),
      ),
    ],
  );

  Widget userLine() => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          backgroundImage: AssetImage(userPost.userimg),
          radius: 20,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userPost.username, style: nametxtStyle),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(userPost.time),
              const Text('.'),
              const Icon(Icons.group, size: 15, color: Colors.grey),
            ],
          ),
        ],
      ),
    ],
  );

  Widget postImage() => Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(userPost.postcontent),
        const SizedBox(height: 15),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            userPost.postimg,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );

  Widget commentComposer() => Padding(
    padding: const EdgeInsets.fromLTRB(10, 12, 10, 20),
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(widget.userdata.myUserAccount.img),
          radius: 18,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: _commentController,
            focusNode: _commentFocusNode,
            textInputAction: TextInputAction.send,
            onSubmitted: (_) => _addComment(),
            decoration: InputDecoration(
              hintText: 'Add a comment...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
            ),
          ),
        ),
        IconButton(
          tooltip: 'Send comment',
          onPressed: _addComment,
          icon: const Icon(Icons.send),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          userLine(),
          postImage(),
          buttons(),
          commentsHeader(),
          ...userPost.comments.map(userComment),
          commentComposer(),
        ],
      ),
    );
  }
}
