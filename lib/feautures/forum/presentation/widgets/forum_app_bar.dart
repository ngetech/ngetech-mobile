import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ngetech/core/theme/base_colors.dart';

class ForumAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const ForumAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: BaseColors.charcoal,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 28),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: LineIcon(
              LineIcons.times,
            ),
          ),
        )
      ],
      leading: Container(),
      title: Text(
        title,
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
