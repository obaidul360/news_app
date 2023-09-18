import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/ui/news_details.dart';

class NewsItemList extends StatelessWidget {
  final NewsModel newsModel;

  const NewsItemList({Key? key, required this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetails(newsModel: newsModel)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 200,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              imageUrl: newsModel.urlToImage.toString(),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  child: Text(newsModel.source!.name.toString()),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30)),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(newsModel.publishedAt.toString()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(newsModel.author == null
                ? ""
                : "wirtten by " + newsModel.author.toString()),
            Text(newsModel.title.toString()),
          ],
        ),
      ),
    );
  }
}
