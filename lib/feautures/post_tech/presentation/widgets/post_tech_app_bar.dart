import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ngetech/core/theme/base_colors.dart';

class PostTechAppBar extends StatelessWidget {
  const PostTechAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: BaseColors.charcoal,
      expandedHeight: MediaQuery.of(context).size.height * 0.175,
      leading: Container(),
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          'POST TECH',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: BaseColors.white),
        ),
        centerTitle: true,
        background: Container(
            color: BaseColors.charcoal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LineIcon(
                  LineIcons.windowRestore,
                  color: BaseColors.blue,
                  size: 48,
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            )),
      ),
      floating: false,
      pinned: true,
      elevation: 0,
    );
  }
}
