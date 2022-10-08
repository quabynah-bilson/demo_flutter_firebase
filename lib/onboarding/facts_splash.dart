import 'package:bloodapp/onboarding/facts_screen1.dart';
import 'package:bloodapp/onboarding/facts_screen2.dart';
import 'package:bloodapp/onboarding/facts_screen3.dart';
import 'package:bloodapp/onboarding/sign_up1.dart';
import 'package:flutter/material.dart';
import 'package:bloodapp/custom_styles.dart';

class FactsSplash extends StatefulWidget {
  const FactsSplash({Key? key}) : super(key: key);
  static const String id = "FactsSplash";

  @override
  State<FactsSplash> createState() => _FactsSplashState();
}

class _FactsSplashState extends State<FactsSplash> {
  final PageController _pageController = PageController(initialPage: 0);

  // the index of the current page
  int _activePage = 0;

  // this list holds all the pages
  // all of them are constructed in the very end of this file for readability
  final List<Widget> _pages = [
    const FactsScreen1(),
    const FactsScreen2(),
    const FactsScreen3()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // the page view
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
          ),
          // Display the dots indicator
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 100,
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _activePage == 2
                      ? GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, SignUp1Screen.id);
                          },
                          child: Text(
                            ' Continue',
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, SignUp1Screen.id);
                          },
                          child: Text('Skip')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                        _pages.length,
                        (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: InkWell(
                                onTap: () {
                                  _pageController.animateToPage(index,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeIn);
                                },
                                child: Container(
                                    height: 8,
                                    width: _activePage == index ? 20 : 4,
                                    color: _activePage == index
                                        ? KColor1
                                        : Color.fromARGB(255, 194, 194, 194)),
                                // CircleAvatar(
                                //   radius: 8,
                                //   // check if a dot is connected to the current page
                                //   // if true, give it a different color
                                //   backgroundColor: _activePage == index
                                //       ? KColor1
                                //       : Color.fromARGB(255, 194, 194, 194),
                                // ),
                              ),
                            )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
