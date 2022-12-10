import 'package:flutter/material.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:provider/provider.dart';
import 'package:ngetech/services/cookies_request.dart';
import 'package:ngetech/feautures/forum/presentation/widgets/forum_app_bar.dart';
import 'package:ngetech/feautures/forum/data/models/forum_discussion.dart';

class DiscussionPage extends StatefulWidget {
  final ForumDiscussion discussion;

  const DiscussionPage({
    Key? key,
    required this.discussion,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DiscussionPageState();
}

class _DiscussionPageState extends State<DiscussionPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.discussion);

    return Scaffold(
      appBar: ForumAppBar(title: widget.discussion.title!),
      backgroundColor: BaseColors.charcoal,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [],
        ),
      ),
    );
  }
}
