import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highlights/utils/appcolors.dart';

import '../utils/helper/author_function.dart';
import '../utils/helper/date_functions.dart';
import 'apptext.dart';
import 'news_webview.dart';

class NewsWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String publishDate;
  final String author;
  final String link;

  NewsWidget({
    required this.title,
    required this.subtitle,
    required this.publishDate,
    required this.author,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   title,
                //   style: TextStyle(
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),

                AppText(
                  text: title,
                  fontSize: 16.0,
                  color: Colors.black,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                // Text(
                //   subtitle,
                //   style: TextStyle(fontSize: 16),
                // ),
                // SizedBox(height: 8),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text:  convertToRegularDateFormat(publishDate),
                          fontSize: 12.0,
                          color: AppColors.blackColor.withOpacity(0.5),
                          fontWeight: FontWeight.normal,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            AppText(
                             text:  'By ',
                              fontSize: 12.0,
                              color: AppColors.blackColor.withOpacity(0.5),
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.ellipsis,
                            ),
                            AppText(
                              text:  removeHttpsAndCom(author),
                              fontSize: 12.0,
                              color: AppColors.blackColor.withOpacity(1),
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 100, // Width of the oval button
                      height: 30, // Height of the oval button
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.7),
                        borderRadius:
                        BorderRadius.circular(25), // Half of the height
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewsWebviewApp(newsURL: link,)),
                          );
                        },
                        child: const AppText(
                          text: "V I S I T",
                          fontSize: 12.0,
                          color: Colors.black,
                          maxLines: 4,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10,),
                const Divider()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
