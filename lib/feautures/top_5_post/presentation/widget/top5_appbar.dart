import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ngetech/core/theme/base_colors.dart';

class Top5AppBar extends StatelessWidget {
  const Top5AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: BaseColors.charcoal,
      expandedHeight: MediaQuery.of(context).size.height * 0.175,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          'TOP 5 POST',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: BaseColors.white,
          ),
        ),
        centerTitle: true,
        background: Container(
          color: BaseColors.charcoal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LineIcon(
                LineIcons.trophy,
                color: BaseColors.blue,
                size: 48,
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
