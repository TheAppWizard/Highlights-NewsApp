import 'package:flutter/cupertino.dart';
import 'package:highlights/widgets/news_widget.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed_plus/webfeed_plus.dart';
import 'package:flutter/material.dart';
import 'package:webfeed_plus/domain/rss_feed.dart';

import '../../screens/viewmorescreen.dart';
import '../../utils/appcolors.dart';
import '../../utils/appconstants.dart';
import '../../utils/helper/data_functions.dart';
import '../apptext.dart';

class HomeSectionCountry extends StatefulWidget {
  const HomeSectionCountry({super.key});

  @override
  _HomeSectionCountryState createState() => _HomeSectionCountryState();
}

class _HomeSectionCountryState extends State<HomeSectionCountry> {
  DataHandler dataHandler = DataHandler();

  RssFeed? feed;

  String lang = "";
  String setLang = "";

  String langCode = "";
  String setLangCode = "";

  String country = "";
  String setCountry = "";

  String countryCode = "";
  String setCountryCode = "";

  @override
  void initState() {
    super.initState();
    readData();
    loadFeed();
  }

  void readData() async {
    country = await dataHandler.getStringValue(AppConstants.countryName);
    countryCode = await dataHandler.getStringValue(AppConstants.countryCode);

    lang = await dataHandler.getStringValue(AppConstants.langName);
    langCode = await dataHandler.getStringValue(AppConstants.langCode);

    setState(() {
      setCountry = country;
      setCountryCode = countryCode;

      setLang = lang;
      setLangCode = langCode;
    });
  }

  Future<void> loadFeed() async {
    var response = await http.get(Uri.parse(
        "https://news.google.com/rss?ceid=${setCountryCode}:${setLangCode}&hl=${setLang.toLowerCase()}&gl=${setLangCode}"));
    if (response.statusCode == 200) {
      setState(() {
        feed = RssFeed.parse(response.body);
      });
    } else {
      throw Exception('Failed to load RSS feed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: AppText(
                text: "C o u n t r y",
                fontSize: 18.0,
                color: AppColors.blackColor,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.list,
                color: AppColors.blackColor.withOpacity(0.2),
              ),
            )
          ],
        ),
        SizedBox(
          child: feed == null
              ? const Center(
                  child: CupertinoActivityIndicator(),
                )
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  //  itemCount: feed!.items?.length,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    var item = feed!.items?[index];
                    return NewsWidget(
                        title: item?.title ?? '',
                        subtitle: "",
                        publishDate: item?.pubDate?.toString() ?? "",
                        author: item?.source?.url.toString() ?? "",
                        link: item?.link?.toString() ?? "");
                  },
                ),
        ),
        Row(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewMore(
                              getURL:
                                  "https://news.google.com/rss?ceid=${countryCode}:${langCode}&hl=${langCode.toLowerCase()}&gl=${countryCode}",
                              name: "C o u n t r y",
                            )),
                  );
                },
                child: const AppText(
                  text: "View More",
                  fontSize: 18.0,
                  color: AppColors.blackColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
