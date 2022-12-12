import 'package:flutter/material.dart';
import 'package:ngetech/core/theme/base_colors.dart';

class RepliesDivider extends StatelessWidget {
  final String? middleText;
  final Function onTap;

  const RepliesDivider({
    Key? key,
    required this.middleText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        onTap();
      },
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              thickness: 1,
              color: BaseColors.blue,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            middleText!,
            style: const TextStyle(
              color: BaseColors.blue,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Divider(
              thickness: 1,
              color: BaseColors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
