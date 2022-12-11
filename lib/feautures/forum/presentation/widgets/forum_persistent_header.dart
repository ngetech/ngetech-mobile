import 'package:flutter/material.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/authentication/presentation/pages/login_page.dart';
import 'package:ngetech/feautures/forum/presentation/pages/create_discussion_page.dart';
import 'package:ngetech/feautures/post_tech/presentation/widgets/sliver_post_tech_delegate.dart';
import 'package:ngetech/services/cookies_request.dart';
import 'package:provider/provider.dart';

class ForumPersistentHeader extends StatefulWidget {
  const ForumPersistentHeader({Key? key}) : super(key: key);

  @override
  State<ForumPersistentHeader> createState() => _ForumPersistentHeaderState();
}

class _ForumPersistentHeaderState extends State<ForumPersistentHeader> {
  @override
  Widget build(BuildContext context) {
    final request = Provider.of<CookieRequest>(
      context,
      listen: false,
    );

    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverPostTechDelegate(
        child: Container(
          color: BaseColors.charcoal,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 12),
            child: ElevatedButton(
              onPressed: () => request.isLoggedIn()
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateDiscussionPage(),
                      ),
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    ),
              child: const Text('Start Discussion'),
            ),
          ),
        ),
      ),
    );
  }
}
