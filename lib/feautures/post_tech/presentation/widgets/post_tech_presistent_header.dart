import 'package:flutter/material.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/post_tech/presentation/widgets/sliver_post_tech_delegate.dart';

class PostTechPersistentHeader extends StatelessWidget {
  const PostTechPersistentHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: SliverPostTechDelegate(
        child: Container(
          color: BaseColors.charcoal,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 12),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Bagikan pengalaman anda'),
            ),
          ),
        ),
      ),
      pinned: true,
    );
  }
}
