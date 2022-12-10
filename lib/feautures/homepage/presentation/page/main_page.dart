import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/homepage/presentation/page/home_page.dart';
import 'package:ngetech/feautures/post_tech/presentation/page/post_tech_page.dart';

import '../../../top_5_post/data/presentation/page/top_5_post_view.dart';

class MainPage extends StatefulWidget {
  final int? setPageAtIndex;
  const MainPage({
    Key? key,
    this.setPageAtIndex,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.setPageAtIndex ?? 0;
    super.initState();
  }

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: BaseColors.blue,
  );

  final List<Widget> _widgetOptions = const <Widget>[
    HomePage(),
    Center(
      child: Text(
        'Survey',
        style: optionStyle,
      ),
    ),
    Top5PostPage(),
    PostTechPage(),
    Center(
      child: Text(
        'Forum',
        style: optionStyle,
      ),
    ),
  ];

  final List<GButton> _tabsButton = const <GButton>[
    GButton(
      icon: LineIcons.home,
      text: 'Home',
    ),
    GButton(
      icon: LineIcons.paste,
      text: 'Survey',
    ),
    GButton(
      icon: LineIcons.trophy,
      text: 'Top 5',
    ),
    GButton(
      icon: LineIcons.windowRestore,
      text: 'Post',
    ),
    GButton(
      icon: LineIcons.comments,
      text: 'Forum',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        backgroundColor: BaseColors.charcoal,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: BaseColors.charcoal,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.3),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 12,
              ),
              child: GNav(
                tabActiveBorder: Border.all(
                  color: BaseColors.blue,
                  width: 1,
                ),
                tabBorderRadius: 20,
                gap: 8,
                activeColor: BaseColors.blue,
                iconSize: 24,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: BaseColors.charcoal,
                color: BaseColors.charcoal.shade600,
                tabs: _tabsButton,
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
