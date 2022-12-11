import 'package:flutter/material.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/post_tech/data/models/post_tech.dart';
import 'package:ngetech/feautures/top_5_post/data/data_source/top5_remote_data_source.dart';
import 'package:ngetech/feautures/top_5_post/widget/top5_appbar.dart';
import 'package:ngetech/feautures/top_5_post/widget/top5_fill.dart';
import 'package:ngetech/feautures/top_5_post/widget/top5_header.dart';
import 'package:ngetech/services/cookies_request.dart';
import 'package:provider/provider.dart';

class Top5PostPage extends StatefulWidget {
  const Top5PostPage({super.key});

  @override
  State<Top5PostPage> createState() => _Top5PostPageState();
}

class _Top5PostPageState extends State<Top5PostPage> {
  @override
  Widget build(BuildContext context) {
    final request = Provider.of<CookieRequest>(
      context,
      listen: false,
    );
    Top5RemoteDataSource dataSource = Top5RemoteDataSource(
      request: request,
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const Top5AppBar(),
          const Top5Header(),
          FutureBuilder(
              future: dataSource.fetchTop5Post(),
              builder: (context, AsyncSnapshot<List<PostTech>> snapshot) =>
                  Top5Data(snapshot: snapshot))
        ],
      ),
      backgroundColor: BaseColors.charcoal,
    );
  }
}
