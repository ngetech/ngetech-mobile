import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/post_detail/page/comment_view.dart';
import 'package:ngetech/feautures/post_tech/data/models/post_tech.dart';

class PostTechDetail extends StatefulWidget {
  final PostTech post;
  const PostTechDetail({super.key, required this.post});

  @override
  State<PostTechDetail> createState() => _PostTechDetailState();
}

class _PostTechDetailState extends State<PostTechDetail> {
  bool liked = false;

  _likePressed() {
    setState(() {
      liked = !liked;
    });
  }

  _commentPressed() {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CommentPostTech(post: widget.post)));
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    IconButton likeButton = IconButton(
      onPressed: () => _likePressed(),
      iconSize: 30,
      icon: Icon(
        liked ? Icons.favorite : Icons.favorite_border,
        color: liked ? Colors.red : null,
      ),
    );

    IconButton commentButton = IconButton(
      onPressed: () => _commentPressed(),
      iconSize: 30,
      icon: const Icon(
        Icons.chat_bubble_outline,
        color: BaseColors.white,
      ),
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: BaseColors.charcoal,
          elevation: 0,
        ),
        body: Container(
          decoration: const BoxDecoration(color: BaseColors.charcoal),
          child: Column(
            children: <Widget>[
              Center(
                child: LineIcon(
                  LineIcons.windowRestore,
                  color: BaseColors.blue,
                  size: 50,
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              Text(widget.post.title!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  )),
              const Padding(padding: EdgeInsets.all(5)),
              Text.rich(TextSpan(
                  text: "Posted by ",
                  style: const TextStyle(
                      color: BaseColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                  children: <InlineSpan>[
                    TextSpan(
                        text: "@${widget.post.username!}",
                        style: const TextStyle(
                          color: BaseColors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ))
                  ])),
              const Padding(padding: EdgeInsets.all(5)),
              Text(
                  "Published on ${DateFormat.yMMMMd().format(DateTime.parse(widget.post.date!))}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: BaseColors.charcoal.shade600,
                    fontSize: 12,
                  )),
              const Padding(padding: EdgeInsets.all(10)),
              Container(
                  width: 350,
                  height: 400,
                  decoration: BoxDecoration(
                      color: BaseColors.charcoal.shade700,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(widget.post.description!,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          )),
                    ),
                  )),
              const Padding(padding: EdgeInsets.all(5)),
              SizedBox(
                child: ListTile(
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [likeButton, commentButton],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
