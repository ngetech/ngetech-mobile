import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/post_detail/data/data_source/comment_remote_data_source.dart';
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
        ));
  }
}
