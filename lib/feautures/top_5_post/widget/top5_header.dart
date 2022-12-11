import 'package:flutter/material.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/top_5_post/widget/sliver_top5_delegate.dart';

class Top5Header extends StatelessWidget {
  const Top5Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverTop5Delegate(
        child: Container(
          color: BaseColors.charcoal,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 12),
            child: Text.rich(
              TextSpan(
                text:
                    "Kami menawarkan anda 5 informasi terhangat mengenai teknologi yang sedang ",
                style: TextStyle(
                  color: BaseColors.charcoal.shade600,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
                children: <InlineSpan>[
                  TextSpan(
                    text: "demanding ",
                    style: TextStyle(
                      color: BaseColors.charcoal.shade600,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 13,
                    ),
                  ),
                  TextSpan(
                    text: "di masa kini",
                    style: TextStyle(
                      color: BaseColors.charcoal.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  )
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
