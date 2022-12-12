import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ngetech/core/environments/endpoints.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/post_detail/data/data_source/comment_remote_data_source.dart';
import 'package:ngetech/feautures/post_detail/data/models/post_comment.dart';
import 'package:ngetech/feautures/post_tech/data/models/post_tech.dart';
import 'package:ngetech/services/cookies_request.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;

class CommentPostTech extends StatefulWidget {
  final PostTech post;
  const CommentPostTech({super.key, required this.post});

  @override
  State<CommentPostTech> createState() => _CommentPostTechState();
}

class _CommentPostTechState extends State<CommentPostTech> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  String? commentText;
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
        title: const Text('Comments'),
        centerTitle: true,
        backgroundColor: BaseColors.charcoal,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: dataSource.fetchComments(
                  postId: widget.post.id!,
                ),
                builder: (context, AsyncSnapshot<List<PostComment>> snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: Text('Loading...'),
                    );
                  } else if (snapshot.data!.isEmpty) {
                    return Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/yuk_comment.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const Text(
                              'Yuk Comment !',
                              style: TextStyle(
                                  color: BaseColors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        PostComment postComment = snapshot.data![index];
                        return Card(
                          color: BaseColors.charcoal.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 24,
                                backgroundColor: BaseColors.charcoal,
                                child: request.isLoggedIn()
                                    ? LineIcon(
                                        LineIcons.user,
                                        color: BaseColors.blue,
                                      )
                                    : LineIcon(
                                        LineIcons.userLock,
                                        color: BaseColors.blue,
                                      ),
                              ),
                              title: Text.rich(
                                TextSpan(
                                  text: "@${postComment.username} ",
                                  style: const TextStyle(
                                    color: BaseColors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: postComment.comment,
                                      style: const TextStyle(
                                        color: BaseColors.white,
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              subtitle: Text(
                                DateFormat.yMMMMd().format(
                                  DateTime.parse(postComment.created_on!),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 12,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: BaseColors.charcoal.shade700,
                    child: LineIcon(
                      LineIcons.user,
                      color: BaseColors.blue,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: Form(
                    key: key,
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: 'Comment'),
                      onChanged: (String? value) {
                        setState(() {
                          commentText = value;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          commentText = value;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Comment can not be empty!';
                        }
                        return null;
                      },
                    ),
                  )),
                  const SizedBox(
                    width: 12,
                  ),
                  Transform.rotate(
                    angle: 5.5,
                    child: GestureDetector(
                      child: LineIcon(
                        LineIcons.paperPlane,
                        size: 35,
                        color: BaseColors.blue,
                      ),
                      onTap: () async {
                        if (key.currentState!.validate()) {
                          await request.postJson(
                            EndPoints.addCommentPostTech,
                            convert.jsonEncode({
                              'post_id': widget.post.id!,
                              'comment': commentText
                            }),
                          );
                          setState(() {});
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: BaseColors.charcoal,
    );
  }
}
