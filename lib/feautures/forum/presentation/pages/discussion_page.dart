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
          slivers: [
            contentCard(widget.discussion),
          ],
        ),
      ),
    );
  }
}

contentCard(ForumDiscussion discussion) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      child: Container(
        color: BaseColors.charcoal.shade800,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${discussion.content}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  'Started by ',
                  style: TextStyle(
                    color: BaseColors.charcoal.shade600,
                  ),
                ),
                Text(
                  '@${discussion.user}',
                  style: const TextStyle(
                    color: BaseColors.blue,
                  ),
                ),
                Text(
                  ' on ${discussion.date}',
                  style: TextStyle(
                    color: BaseColors.charcoal.shade600,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
