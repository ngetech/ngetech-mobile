import 'package:flutter/material.dart';
import 'package:ngetech/feautures/post_tech/data/data_source/post_tech_remote_data_source.dart';
import 'package:ngetech/feautures/post_tech/data/models/post_tech.dart';
import 'package:ngetech/services/cookies_request.dart';
import 'package:provider/provider.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/post_tech/presentation/widgets/post_tech_app_bar.dart';
import 'package:ngetech/feautures/post_tech/presentation/widgets/post_tech_presistent_header.dart';

import '../widgets/post_card.dart';

class PostTechPage extends StatefulWidget {
  const PostTechPage({Key? key}) : super(key: key);

  @override
  State<PostTechPage> createState() => _PostTechPageState();
}

class _PostTechPageState extends State<PostTechPage> {
  @override
  Widget build(BuildContext context) {
    PostTechRemoteDataSource dataSource = PostTechRemoteDataSource(
      request: Provider.of<CookieRequest>(
        context,
        listen: false,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const PostTechAppBar(),
            const PostTechPersistentHeader(),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 8,
              ),
            ),
            FutureBuilder(
              future: dataSource.fetchPosts(),
              builder: (context, AsyncSnapshot<List<PostTech>> snapshot) {
                if (snapshot.data == null) {
                  return const SliverToBoxAdapter(
                    child: Text('no data'),
                  );
                } else {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: snapshot.data!.length,
                      (context, index) => PostCard(post: snapshot.data![index]),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
      backgroundColor: BaseColors.charcoal,
    );
  }
}
