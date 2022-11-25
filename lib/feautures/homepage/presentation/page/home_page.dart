import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ngetech/core/theme/base_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    String _greets() {
      var hour = DateTime.now().hour;
      if (hour < 12) {
        return 'Morning';
      }
      if (hour < 17) {
        return 'Afternoon';
      }
      return 'Evening';
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(28, 32, 28, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hello!',
                          style: TextStyle(
                            color: BaseColors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Good ${_greets()}!',
                          style: TextStyle(
                            color: BaseColors.charcoal.shade600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: BaseColors.charcoal.shade700,
                      child: LineIcon(
                        LineIcons.userLock,
                        color: BaseColors.blue,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(28, 28, 28, 0),
            padding: const EdgeInsets.all(16),
            width: deviceWidth,
            decoration: BoxDecoration(
                color: BaseColors.charcoal.shade800,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text(
                    'KNOWLEDGE IS THE KEY',
                    style: TextStyle(
                      color: BaseColors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Text(
                    'Grow In Rapidly Cultural Transformation',
                    style: TextStyle(
                      color: BaseColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'We provides you a place to shares an adequate information about latest tech in the industry.',
                  style: TextStyle(
                    color: BaseColors.charcoal.shade600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
