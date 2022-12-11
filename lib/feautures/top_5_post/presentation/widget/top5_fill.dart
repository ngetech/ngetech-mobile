import 'package:flutter/cupertino.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/post_tech/data/models/post_tech.dart';

import 'top_5_card.dart';

class Top5Data extends StatelessWidget {
  final AsyncSnapshot<List<PostTech>> snapshot;
  const Top5Data({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    if (snapshot.data == null) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Text('Loading...'),
        ),
      );
    } else if (snapshot.data!.isEmpty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: BaseColors.charcoal,
            borderRadius: BorderRadius.circular(8),
            image: const DecorationImage(
              image: AssetImage('assets/images/post_tech.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      );
    } else {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: snapshot.data!.length < 5 ? snapshot.data!.length : 5,
          (context, index) => Top5Card(
            listPost: snapshot.data!,
            index: index,
          ),
        ),
      );
    }
  }
}
