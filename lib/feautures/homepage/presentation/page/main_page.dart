import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ngetech/core/theme/base_colors.dart';
import 'package:ngetech/feautures/homepage/presentation/page/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: BaseColors.blue,
  );

  final List<Widget> _widgetOptions = const <Widget>[
    HomePage(),
    Text(
      'Survey',
      style: optionStyle,
    ),
    Text(
      'Top 5',
      style: optionStyle,
    ),
    Text(
      'Post',
      style: optionStyle,
    ),
    Text(
      'Forum',
      style: optionStyle,
    ),
  ];

  final List<GButton> _tabsButtons = const <GButton>[
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
                tabs: _tabsButtons,
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
