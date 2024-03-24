import 'package:flutter/material.dart';
import 'package:highlights/screens/homescreen.dart';
import '../utils/appcolors.dart';
import '../utils/appconstants.dart';
import '../utils/helper/data_functions.dart';
import '../utils/onboarding_util/countryCodes.dart';
import '../utils/onboarding_util/languages.dart';
import '../widgets/apptext.dart';
import '../widgets/expanded_button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  DataHandler dataHandler = DataHandler();

  String name = '';
  CountryCodes? selectedCountry;
  Language? selectedLanguage;



  String? gender;
  final List<String> genders = ['Male', 'Female', 'Other'];

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
            text: "O n b o a r d i n g",
            fontSize: 18.0,
            color: AppColors.blackColor,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              TextField(
                decoration: const InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: AppColors.blackColor),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blackColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),


                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              const Row(
                children: [
                  AppText(
                    text: "Gender",
                    fontSize: 12.0,
                    color: AppColors.blackColor,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.normal,
                  ),
                  Spacer()
                ],
              ),
              const SizedBox(height: 5,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: AppColors.blackColor.withOpacity(0.7)),
                  color: Colors.white,
                ),
                child: DropdownButton<String>(
                  value: gender,
                  items: genders.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: AppText(
                        text: value,
                        fontSize: 18.0,
                        color: AppColors.blackColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      gender = newValue!;
                    });
                  },
                  underline: Container(),
                  icon: const Icon(Icons.arrow_drop_down, color: AppColors.blackColor),
                  elevation: 8,
                  isExpanded: true,
                  dropdownColor: Colors.white,
                ),
              ),


              const SizedBox(height: 20),
              const Row(
                children: [
                  AppText(
                    text: "Country",
                    fontSize: 12.0,
                    color: AppColors.blackColor,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.normal,
                  ),
                  Spacer()
                ],
              ),
              const SizedBox(height: 5,),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: AppColors.blackColor.withOpacity(0.7)),
                  color: Colors.white, // Background color
                ),
                child: DropdownButton<CountryCodes>(
                  value: selectedCountry,
                  items: countries.map((CountryCodes country) {
                    return DropdownMenuItem<CountryCodes>(
                      value: country,
                      child: AppText(
                        text: country.name,
                        fontSize: 16.0,
                        color: AppColors.blackColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  onChanged: (CountryCodes? newValue) {
                    setState(() {
                      selectedCountry = newValue!;
                    });
                  },
                  underline: Container(),
                  icon: const Icon(Icons.arrow_drop_down, color: AppColors.blackColor),
                  elevation: 8,
                  isExpanded: true,
                  dropdownColor: Colors.white,
                ),
              ),

              const SizedBox(height: 20),
              const Row(
                children: [
                  AppText(
                    text: "Language",
                    fontSize: 12.0,
                    color: AppColors.blackColor,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.normal,
                  ),
                  Spacer()
                ],
              ),
              const SizedBox(height: 5,),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: AppColors.blackColor.withOpacity(0.7)),
                  color: Colors.white, // Background color
                ),
                child: DropdownButton<Language>(
                  value: selectedLanguage,
                  items: languages.map((Language language) {
                    return DropdownMenuItem<Language>(
                      value: language,
                      child: AppText(
                        text: language.name,
                        fontSize: 16.0,
                        color: AppColors.blackColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  onChanged: (Language? newValue) {
                    setState(() {
                      selectedLanguage = newValue!;
                    });
                  },
                  underline: Container(), // Hides the underline
                  icon: const Icon(Icons.arrow_drop_down, color: AppColors.blackColor), // Custom dropdown icon
                  elevation: 8, // Dropdown elevation
                  isExpanded: true, // Ensures the dropdown button expands to fill the container horizontally
                  dropdownColor: Colors.white, // Dropdown background color
                ),
              ),




              const Spacer(),
              const SizedBox(height: 20),
              ExpandedButton(
                buttonColor: AppColors.primaryColor.withOpacity(1),
                onPressed: () async {
                  print('Button Pressed!');
                  print(name);
                  print(gender);
                  print(selectedCountry!.name.toString());
                  print(selectedLanguage!.name.toString());
                  print(selectedLanguage!.code.toString());


                  await dataHandler.setStringValue(AppConstants.userName, name);
                  await dataHandler.setStringValue(AppConstants.genderValue, gender.toString());
                  await dataHandler.setStringValue(AppConstants.countryCode, selectedCountry!.code.toString());
                  await dataHandler.setStringValue(AppConstants.countryName, selectedCountry!.name.toString());

                  await dataHandler.setStringValue(AppConstants.langCode, selectedLanguage!.code.toString());
                  await dataHandler.setStringValue(AppConstants.langName, selectedLanguage!.name.toString());
                  await dataHandler.setStringValue(AppConstants.doneOnboarding, "YES");





                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: const AppText(
                  text: "Submit Data",
                  fontSize: 18.0,
                  color: AppColors.blackColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
