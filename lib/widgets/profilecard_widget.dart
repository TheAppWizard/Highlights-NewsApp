import 'package:flutter/material.dart';
import 'package:highlights/utils/appconstants.dart';

import '../utils/appcolors.dart';
import '../utils/helper/data_functions.dart';
import '../utils/helper/gender_function.dart';
import 'apptext.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  DataHandler dataHandler = DataHandler();

  String name = "";
  String setName = "";

  String gender = "";
  String setGender = "";






  @override
  initState() {
    super.initState();
    readData();


  }


  void readData() async {
      name = await dataHandler.getStringValue(AppConstants.userName);
      gender = await dataHandler.getStringValue(AppConstants.genderValue);


      setState(() {
        setName = name;
        setGender = gender;
      });


  }



  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(getGenderURL(setGender)), // Replace this with your image URL
            ),
            const SizedBox(height: 16),
             AppText(
              text: setName,
              fontSize: 24.0,
              color: AppColors.blackColor,
              fontWeight: FontWeight.normal,
              overflow: TextOverflow.ellipsis,
            ),
            // SizedBox(height: 8),
            const AppText(
              text: "U S E R",
              fontSize: 12.0,
              color: AppColors.blackColor,
              fontWeight: FontWeight.normal,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

