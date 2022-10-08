import 'package:bloodapp/custom_styles.dart';
import 'package:bloodapp/onboarding/healthtips_screen.dart';
import 'package:bloodapp/onboarding/home_page.dart';
import 'package:bloodapp/onboarding/messages_screen.dart';
import 'package:bloodapp/onboarding/news_screen.dart';
import 'package:bloodapp/onboarding/settings_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  final PageController _pageController = PageController(initialPage: 0);
  int _pageIndex = 0;
  //int _selectedScreenIndex = 0;
  List<Widget> _buildFivePageViewChildren() {
    return <Widget>[
      HomePage(),
      NewsScreen(),
      MessagesScreen(),
      HealthTipsScreen(),
      SettingScreen(),
    ];
  }

  List<BottomNavigationBarItem> _buildFiveItems() {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.newspaper_rounded),
        label: 'News',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.mark_email_unread),
        label: 'Messages',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.heart_broken_sharp),
        label: 'Health Tips',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Settings',
      ),
    ];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        children: _buildFivePageViewChildren(),
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (int index) {
          setState(
            () {
              _pageIndex = index;
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _buildFiveItems(),
        onTap: (int index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        },
        currentIndex: _pageIndex,
        fixedColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
