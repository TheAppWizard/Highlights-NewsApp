

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:highlights/screens/profilescreen.dart';
import 'package:highlights/utils/appcolors.dart';
import 'package:highlights/widgets/news_widget.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed_plus/webfeed_plus.dart';
import 'package:flutter/material.dart';
import 'package:webfeed_plus/domain/rss_feed.dart';

import '../utils/onboarding_util/topics.dart';
import '../widgets/apptext.dart';
import '../widgets/capsule_widget.dart';
import '../widgets/subwidgets/home_section_country.dart';
import '../widgets/subwidgets/home_section_geo.dart';
import '../widgets/subwidgets/home_section_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedItemIndex = 0;
  String tabName = "World";


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            leading: const Text(""),
            backgroundColor: AppColors.primaryColor,
            title: const AppText(
              text: "H I G H L I G H T S",
              fontSize: 18.0,
              color: AppColors.blackColor,
              overflow: TextOverflow.ellipsis,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()),
                    );
                  },
                  icon: const Icon(
                    Icons.account_circle_outlined,
                    color: AppColors.blackColor,
                  ))
            ],
          ),
          body: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.98,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: topicList.length,
                  itemBuilder: (context, index) {
                    return CapsuleWidget(
                      name: topicList[index].value,
                      border: AppColors.primaryColor,
                      background: _selectedItemIndex == index
                          ? AppColors.primaryColor.withOpacity(0.8)
                          : Colors.white,
                      currentIndex: index,
                      onTapCallback: (String isTapped) {
                        print('Widget tapped: $isTapped');
                        setState(() {
                          tabName = isTapped;
                        });
                      },
                      onTapIndex: (int index) {
                        setState(() {
                          if (_selectedItemIndex == index) {
                            _selectedItemIndex = -1; // Deselect if tapped again
                          } else {
                            _selectedItemIndex = index;
                          }
                        });
                      },
                    );
                  },
                ),
              ),
              HomeSectionTab(topic: "$tabName",),
              const HomeSectionCountry(),
              const HomeSectionGeo(),
            ],
          ))),
    );
  }
}
