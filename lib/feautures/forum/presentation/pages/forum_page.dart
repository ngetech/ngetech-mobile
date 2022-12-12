import 'package:flutter/material.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:provider/provider.dart';
import 'package:ngetech/services/cookies_request.dart';
import 'package:ngetech/feautures/forum/presentation/widgets/discussion_card.dart';
import 'package:ngetech/feautures/forum/presentation/widgets/forum_sliver_app_bar.dart';
import 'package:ngetech/feautures/forum/presentation/widgets/forum_persistent_header.dart';
import 'package:ngetech/feautures/forum/data/models/forum_discussion.dart';
import 'package:ngetech/feautures/forum/data/data_source/forum_discussion_remote_data_source.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    final CookieRequest request = Provider.of<CookieRequest>(
      context,
      listen: false,
    );

    ForumDiscussionRemoteDataSource dataSource =
        ForumDiscussionRemoteDataSource(
      request: request,
    );

    return Scaffold(
      backgroundColor: BaseColors.charcoal,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const ForumSliverAppBar(),
            const ForumPersistentHeader(),
            FutureBuilder(
              future: dataSource.fetchDiscussions(),
              builder:
                  (context, AsyncSnapshot<List<ForumDiscussion>> snapshot) {
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
                      ((context, index) =>
                          DiscussionCard(discussion: snapshot.data![index])),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
