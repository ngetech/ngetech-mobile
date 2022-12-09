import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/post_detail/data/data_source/comment_remote_data_source.dart';
import 'package:ngetech/feautures/post_detail/data/models/post_comment.dart';
import 'package:ngetech/feautures/post_tech/data/models/post_tech.dart';
import 'package:ngetech/services/cookies_request.dart';
import 'package:provider/provider.dart';

class CommentPostTech extends StatefulWidget {
  final PostTech post;
  const CommentPostTech({super.key, required this.post});

  @override
  State<CommentPostTech> createState() => _CommentPostTechState();
}

class _CommentPostTechState extends State<CommentPostTech> {
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
          backgroundColor: BaseColors.charcoal,
          elevation: 0,
        ),
        body: Container(
          decoration: const BoxDecoration(color: BaseColors.charcoal),
          child: FutureBuilder(
            future: dataSource.fetchComments(postId: widget.post.id!),
            builder: (context, AsyncSnapshot<List<PostComment>> snapshot) {
              if (snapshot.data == null) {
                return const Text('Loading...');
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada Watchlist :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(itemBuilder: (context, index) {
                    PostComment postComment = snapshot.data![index];
                    return Card(
                      color: BaseColors.charcoal.shade600,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListTile(
                            title: Text(
                          postComment.comment!,
                          style: const TextStyle(
                              color: BaseColors.white, fontSize: 14),
                        )),
                      ),
                    );
                  });
                }
              }
            },
          ),
        ));
  }
}
