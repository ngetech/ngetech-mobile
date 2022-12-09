import 'package:flutter/cupertino.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/forum/data/models/forum_discussion.dart';

class DiscussionCard extends StatelessWidget {
  final ForumDiscussion discussion;

  const DiscussionCard({
    Key? key,
    required this.discussion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 20,
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: BaseColors.charcoal.shade800,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                '${discussion.title}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
