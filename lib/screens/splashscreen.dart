import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highlights/utils/appcolors.dart';
import 'package:highlights/utils/appconstants.dart';

import '../utils/helper/data_functions.dart';
import '../widgets/apptext.dart';
import 'homescreen.dart';
import 'onboardingscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DataHandler dataHandler = DataHandler();
  String doneOnboarding = "";
  String setdoneOnboarding = "";


  void readData() async {
    doneOnboarding = await dataHandler.getStringValue(AppConstants.doneOnboarding);

    setState(() {
      setdoneOnboarding = doneOnboarding;

    });
  }

  @override
  void initState() {
    super.initState();
    readData();


    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                // (context) => const HomeScreen()
                (context) =>  setdoneOnboarding.toString() == "YES" ? const HomeScreen() : const OnboardingScreen()
            ),
        )
    );
  }




  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: "H I G H L I G H T S",
              fontSize: 28.0,
              color: Colors.black,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 100,),
            CupertinoActivityIndicator()
          ],
        ),
      ),
    );
  }
}
