class ArticleModel {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;

  ArticleModel(
      {required this.url,
      required this.title,
      required this.author,
      required this.content,
      required this.description,
      required this.urlToImage});
}
