import 'package:flutter/material.dart';
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
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }
}
