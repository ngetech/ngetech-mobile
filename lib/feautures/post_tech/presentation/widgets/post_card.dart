import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../core/theme/base_colors.dart';
import '../../../post_detail/presentation/page/post_tech_detail.dart';
import '../../data/models/post_tech.dart';

class PostCard extends StatelessWidget {
  final PostTech post;
  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 0, 28, 12),
      child: Ink(
        decoration: BoxDecoration(
          color: BaseColors.charcoal.shade800,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostTechDetail(post: post),
              ),
            );
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: BaseColors.charcoal,
                          child: LineIcon(
                            LineIcons.user,
                            size: 28,
                            color: BaseColors.blue,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '@${post.username!}',
                              style: const TextStyle(
                                color: BaseColors.blue,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              DateFormat.yMMMMd()
                                  .format(DateTime.parse(post.date!)),
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: BaseColors.warning,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          '${post.likes!.length}',
                          style: const TextStyle(
                            color: BaseColors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    post.title!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  post.description!,
                  style: TextStyle(
                    color: BaseColors.charcoal.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
