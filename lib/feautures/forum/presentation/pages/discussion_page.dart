import 'package:flutter/material.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/forum/presentation/widgets/bottom_navbar_form.dart';
import 'package:provider/provider.dart';
import 'package:ngetech/services/cookies_request.dart';
import 'package:ngetech/feautures/forum/presentation/widgets/forum_app_bar.dart';
import 'package:ngetech/feautures/forum/presentation/widgets/reply_card.dart';
import 'package:ngetech/feautures/forum/data/models/forum_discussion.dart';
import 'package:ngetech/feautures/forum/data/models/forum_reply.dart';
import 'package:ngetech/feautures/forum/data/data_source/forum_reply_remote_data_source.dart';

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
  ForumReply? _replyingTo;

  setReplyingTo(ForumReply? value) {
    setState(() {
      _replyingTo = value;
    });
  }

  cancelReplyingTo() {
    setState(() {
      _replyingTo = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final CookieRequest request = Provider.of<CookieRequest>(
      context,
      listen: false,
    );

    ForumReplyRemoteDataSource dataSource = ForumReplyRemoteDataSource(
      request: request,
    );

    return Scaffold(
      appBar: ForumAppBar(title: widget.discussion.title!),
      backgroundColor: BaseColors.charcoal,
      bottomNavigationBar: BottomNavbarForm(
        discussion: widget.discussion,
        replyingTo: _replyingTo,
        cancelReplyingTo: cancelReplyingTo,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: CustomScrollView(
            slivers: [
              contentCard(widget.discussion),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 4),
                  child: Text(
                    'Replies',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              FutureBuilder(
                future: dataSource.fetchReplies(widget.discussion.id!),
                builder: (context, AsyncSnapshot<List<ForumReply>> snapshot) {
                  if (snapshot.data == null) {
                    return const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Text('Loading...'),
                      ),
                    );
                  } else {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: snapshot.data!.length,
                        (context, index) => ReplyCard(
                          reply: snapshot.data![index],
                          onTapReply: setReplyingTo,
                        ),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  contentCard(ForumDiscussion discussion) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: BaseColors.charcoal.shade800,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${discussion.content}',
              style: const TextStyle(
                fontSize: 18,
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
                    fontWeight: FontWeight.bold,
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
    );
  }
}
