import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ngetech/core/environments/endpoints.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/homepage/presentation/page/main_page.dart';
import 'package:ngetech/feautures/post_tech/data/models/post_tech.dart';
import 'package:provider/provider.dart';

import '../../../../services/cookies_request.dart';
import '../../data/data_source/comment_remote_data_source.dart';
import 'comment_view.dart';

class PostTechDetail extends StatefulWidget {
  final PostTech post;
  const PostTechDetail({super.key, required this.post});

  @override
  State<PostTechDetail> createState() => _PostTechDetailState();
}

class _PostTechDetailState extends State<PostTechDetail> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    final request = Provider.of<CookieRequest>(
      context,
      listen: false,
    );
    CommentRemoteDataSource dataSource = CommentRemoteDataSource(
      request: request,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 28),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPage(setPageAtIndex: 3),
                  ),
                );
              },
              child: LineIcon(
                LineIcons.times,
              ),
            ),
          )
        ],
        leading: Container(),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 12,
        ),
        child: Column(
          children: [
            Center(
              child: LineIcon(
                LineIcons.windowRestore,
                color: BaseColors.blue,
                size: 60,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                widget.post.title!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text.rich(
                TextSpan(
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
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "Published on ${DateFormat.yMMMMd().format(DateTime.parse(widget.post.date!))}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: BaseColors.charcoal.shade600,
                  fontSize: 12,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: BaseColors.charcoal.shade800,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  widget.post.description!,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: BaseColors.charcoal.shade800,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: FutureBuilder(
                        future: dataSource.getLikesCount(
                          postId: widget.post.id!,
                        ),
                        builder: (
                          context,
                          AsyncSnapshot<Map<String, dynamic>> snapshot,
                        ) =>
                            snapshot.data != null
                                ? Row(
                                    children: [
                                      Text(
                                        '${snapshot.data!["likes_count"]}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await request.postJson(
                                            '${EndPoints.addLike}${widget.post.id}/',
                                            jsonEncode({}),
                                          );
                                          setState(() {});
                                        },
                                        child: Icon(
                                          snapshot.data!['is_liked']
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: snapshot.data!['is_liked']
                                              ? BaseColors.warning
                                              : BaseColors.white,
                                        ),
                                      )
                                    ],
                                  )
                                : Row(
                                    children: const [
                                      Text(
                                        '0',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Icon(Icons.favorite_border)
                                    ],
                                  ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CommentPostTech(post: widget.post),
                      ),
                    ),
                    child: LineIcon(
                      LineIcons.comment,
                      size: 28,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: BaseColors.charcoal,
    );
  }
}
