import 'package:flutter/material.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/forum/data/models/forum_reply.dart';
import 'package:ngetech/services/cookies_request.dart';
import 'package:provider/provider.dart';

class ReplyCard extends StatefulWidget {
  final ForumReply reply;

  const ReplyCard({
    Key? key,
    required this.reply,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ReplyCardState();
}

class _ReplyCardState extends State<ReplyCard> {
  @override
  Widget build(BuildContext context) {
    final CookieRequest request = Provider.of<CookieRequest>(
      context,
      listen: false,
    );

    print(request.getCurrentUser());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
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
              widget.reply.user == request.getCurrentUser()
                  ? 'You'
                  : '@${widget.reply.user}',
              style: const TextStyle(
                color: BaseColors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 8),
              child: Text('${widget.reply.content}'),
            ),
            Text(
              'On ${widget.reply.date}',
              style: TextStyle(
                color: BaseColors.charcoal.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
