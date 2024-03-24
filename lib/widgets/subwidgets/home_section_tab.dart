import 'package:flutter/cupertino.dart';
import 'package:highlights/screens/viewmorescreen.dart';
import 'package:highlights/widgets/news_widget.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed_plus/webfeed_plus.dart';
import 'package:flutter/material.dart';
import 'package:webfeed_plus/domain/rss_feed.dart';

import '../../utils/appcolors.dart';
import '../../utils/helper/topic_functions.dart';
import '../apptext.dart';

class HomeSectionTab extends StatefulWidget {
  final String topic;
  const HomeSectionTab({super.key, required this.topic});

  @override
  _HomeSectionTabState createState() => _HomeSectionTabState();
}

class _HomeSectionTabState extends State<HomeSectionTab> {
  RssFeed? feed;

  Future<void> loadFeed() async {
    try {
      var response = await http.get(Uri.parse("https://news.google.com/rss/headlines/section/topic/${widget.topic.toUpperCase()}?ceid=US:EN&hl=en&gl=US"));
      if (response.statusCode == 200) {
        setState(() {
          feed = RssFeed.parse(response.body);
        });
      } else {
        throw Exception('Failed to load RSS feed');
      }
    } catch (e,s) {
      print('Error loading RSS feed: $e');
      print('Stack loading RSS feed: $s');

    }
  }

  @override
  Widget build(BuildContext context) {
    loadFeed(); ///Not Safe For Use
    return  Column(
      children: [
         Row(
          children: [
             Padding(
              padding: const EdgeInsets.all(15.0),
              child: AppText(
                text: convertToSpaces(widget.topic),
                fontSize: 18.0,
                color: AppColors.blackColor,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(Icons.list,color: AppColors.blackColor.withOpacity(0.2),),
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
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  ViewMore(getURL: "https://news.google.com/rss/headlines/section/topic/${widget.topic.toUpperCase()}?ceid=US:EN&hl=en&gl=US",name: convertToSpaces(widget.topic),)),
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