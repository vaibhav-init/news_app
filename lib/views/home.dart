import 'package:flutter/material.dart';
import 'package:news_app/utilities/data.dart';
import 'package:news_app/models/catagoryModel.dart';
import 'package:news_app/utilities/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/views/catagory.dart';
import 'article.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNewsAsap();
  }

  void getNewsAsap() async {
    News newsClass = News();
    await newsClass.getNews();
    setState(() {
      articles = newsClass.news;

      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          : Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          catagoryTitle: categories[index].categoryName,
                          imageUrl: categories[index].imageUrl,
                        );
                      }),
                ),

                ///Blogs section->
                Expanded(
                  flex: 8,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    scrollDirection: Axis.vertical,
                    itemCount: articles.length,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BlogTile(
                          imageUrl: articles[index].urlToImage,
                          title: articles[index].title,
                          desc: articles[index].description,
                          url: articles[index].url);
                      url:
                      articles[index].url;
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final catagoryTitle;
  final imageUrl;
  const CategoryCard({super.key, this.imageUrl, this.catagoryTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryView(title: catagoryTitle),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
              margin: const EdgeInsets.only(right: 12),
              height: 80,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(imageUrl),
                    fit: BoxFit.cover),
              ),
              child: null),
          Container(
            width: 120,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black26,
            ),
            child: Center(
              child: Text(
                catagoryTitle,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
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
