import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utilities/news.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/article_model.dart';
import 'article.dart';

class CategoryView extends StatefulWidget {
  final String title;
  const CategoryView({super.key, required this.title});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ArticleModel> art = [];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsAsap();
  }

  void getNewsAsap() async {
    CategoryNews newsClass = CategoryNews();
    await newsClass.getNews(widget.title);
    setState(() {
      art = newsClass.news;

      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(art.length);
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'I',
              style: TextStyle(color: Colors.deepOrange),
            ),
            Text(
              'N',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'D',
              style: TextStyle(color: Colors.green),
            ),
            Text('News'),
          ],
        ),
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              scrollDirection: Axis.vertical,
              itemCount: art.length,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return BlogTile(
                    imageUrl: art[index].urlToImage,
                    title: art[index].title,
                    desc: art[index].description,
                    url: art[index].url);
              },
            ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final imageUrl, title, desc, url;

  const BlogTile(
      {super.key, @required this.imageUrl,
      @required this.title,
      @required this.desc,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(Url: url),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(imageUrl: imageUrl),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            Text(
              desc,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
