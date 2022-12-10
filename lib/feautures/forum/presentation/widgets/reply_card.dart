import 'package:flutter/material.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/forum/data/data_source/forum_reply_remote_data_source.dart';
import 'package:ngetech/feautures/forum/data/models/forum_reply.dart';
import 'package:ngetech/feautures/forum/presentation/widgets/replies_divider.dart';
import 'package:ngetech/services/cookies_request.dart';
import 'package:provider/provider.dart';

class ReplyCard extends StatefulWidget {
  final ForumReply reply;
  final Function(ForumReply?) onTapReply;
  final bool shouldFetchNested;

  const ReplyCard({
    Key? key,
    required this.reply,
    required this.onTapReply,
    this.shouldFetchNested = true,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ReplyCardState();
}

class _ReplyCardState extends State<ReplyCard> {
  bool _showNestedReply = false;

  showNestedReply() {
    setState(() {
      _showNestedReply = true;
    });
  }

  hideNestedReply() {
    setState(() {
      _showNestedReply = false;
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

    dataSource.fetchNestedReplies(widget.reply.id!).then((value) {
      widget.reply.replies = value;
    });

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: BaseColors.charcoal.shade800,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.reply.user == request.getCurrentUser()
                          ? 'You'
                          : '@${widget.reply.user}',
                      style: const TextStyle(
                        color: BaseColors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (widget.reply.replyingTo != null &&
                        widget.reply.replyingTo != '') ...[
                      const Text(' replying to '),
                      Text(
                        widget.reply.replyingTo == request.getCurrentUser()
                            ? 'You'
                            : '@${widget.reply.replyingTo}',
                        style: const TextStyle(
                          color: BaseColors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 8),
                  child: Text('${widget.reply.content}'),
                ),
                Row(
                  children: [
                    Text(
                      'On ${widget.reply.date}',
                      style: TextStyle(
                        color: BaseColors.charcoal.shade600,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    if (request.isLoggedIn())
                      InkWell(
                        onTap: () {
                          widget.onTapReply(widget.reply);
                        },
                        child: const Text(
                          'Reply',
                          style: TextStyle(
                            color: BaseColors.blue,
                          ),
                        ),
                      )
                  ],
                ),
              ],
            ),
          ),
          if (widget.shouldFetchNested)
            FutureBuilder(
              future: dataSource.fetchNestedReplies(widget.reply.id!),
              builder: (context, AsyncSnapshot<List<ForumReply>> snapshot) {
                if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return Container();
                } else {
                  if (!_showNestedReply) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: RepliesDivider(
                        middleText: 'View ${snapshot.data!.length} replies',
                        onTap: showNestedReply,
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Column(
                        children: [
                          for (var i in snapshot.data!)
                            Padding(
                              padding: const EdgeInsets.only(left: 32.0),
                              child: ReplyCard(
                                reply: i,
                                onTapReply: widget.onTapReply,
                                shouldFetchNested: false,
                              ),
                            ),
                          RepliesDivider(
                            middleText: 'Hide replies',
                            onTap: hideNestedReply,
                          ),
                        ],
                      ),
                    );
                  }
                }
              },
            )
        ],
      ),
    );
  }
}
