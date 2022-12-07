import 'package:flutter/material.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/post_tech/presentation/widgets/post_tech_app_bar.dart';
import 'package:ngetech/feautures/post_tech/presentation/widgets/post_tech_presistent_header.dart';

class PostTechPage extends StatefulWidget {
  const PostTechPage({Key? key}) : super(key: key);

  @override
  State<PostTechPage> createState() => _PostTechPageState();
}

class _PostTechPageState extends State<PostTechPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const PostTechAppBar(),
            const PostTechPersistentHeader(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: BaseColors.charcoal,
    );
  }
}
