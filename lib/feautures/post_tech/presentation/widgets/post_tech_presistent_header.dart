import 'package:flutter/material.dart';
import 'package:ngetech/feautures/post_tech/presentation/widgets/sliver_post_tech_delegate.dart';

class PostTechPersistentHeader extends StatelessWidget {
  const PostTechPersistentHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: SliverPostTechDelegate(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 4),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Bagikan pengalaman anda'),
            ),
          ),
        ),
      ),
      pinned: true,
    );
  }
}
