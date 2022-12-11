import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/authentication/presentation/pages/login_page.dart';
import 'package:ngetech/feautures/post_detail/presentation/page/post_tech_detail.dart';
import 'package:ngetech/feautures/post_tech/data/models/post_tech.dart';
import 'package:ngetech/services/cookies_request.dart';
import 'package:provider/provider.dart';

class Top5Card extends StatelessWidget {
  final List<PostTech> listPost;
  final int index;
  const Top5Card({super.key, required this.listPost, required this.index});

  @override
  Widget build(BuildContext context) {
    final request = Provider.of<CookieRequest>(
      context,
      listen: false,
    );
    listPost.sort();
    PostTech post = listPost[index];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 6),
      padding: const EdgeInsets.fromLTRB(28, 0, 28, 12),
      decoration: BoxDecoration(
        color: BaseColors.charcoal.shade800,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LineIcon(
                  LineIcons.trophy,
                  color: BaseColors.charcoal.shade600,
                  size: 25,
                ),
                Text(
                  ' ${index + 1}',
                  style: TextStyle(
                    color: BaseColors.charcoal.shade600,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              post.title!,
              style: const TextStyle(
                  color: BaseColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            const SizedBox(height: 8),
            Text.rich(TextSpan(
                text: "Published by ",
                style: TextStyle(
                    color: BaseColors.charcoal.shade600, fontSize: 14),
                children: <InlineSpan>[
                  TextSpan(
                      text: "@${post.username!}",
                      style: const TextStyle(
                        color: BaseColors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ))
                ])),
            const SizedBox(height: 5),
            Text.rich(
              TextSpan(
                text: post.likes!.length.toString(),
                style: const TextStyle(
                  color: BaseColors.blue,
                  fontSize: 13,
                ),
                children: const <InlineSpan>[
                  TextSpan(
                    text: " people like this post !",
                    style: TextStyle(
                      color: BaseColors.blue,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: TextButton(
                onPressed: () {
                  if (request.isLoggedIn()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostTechDetail(post: post),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  }
                },
                child: const Text(
                  "See people reaction...",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: BaseColors.blue,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
