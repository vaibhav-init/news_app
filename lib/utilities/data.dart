import '../models/catagoryModel.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> cats = [];
  CategoryModel model1 = CategoryModel();
  model1.imageUrl =
      'https://images.unsplash.com/photo-1664575601711-67110e027b9b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80';
  model1.categoryName = 'Business';
  cats.add(model1);
  CategoryModel model2 = CategoryModel();
  model2.categoryName = "Entertainment";
  model2.imageUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  cats.add(model2);
  CategoryModel model3 = CategoryModel();
  model3.categoryName = "General";
  model3.imageUrl =
      "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  cats.add(model3);
  CategoryModel model4 = CategoryModel();
  model4.categoryName = "Health";
  model4.imageUrl =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  cats.add(model4);
  CategoryModel model5 = CategoryModel();
  model5.categoryName = "Science";
  model5.imageUrl =
      "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  cats.add(model5);
  CategoryModel model6 = CategoryModel();
  model6.categoryName = "Sports";
  model6.imageUrl =
      "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  cats.add(model6);
  CategoryModel model7 = CategoryModel();
  model7.categoryName = "Technology";
  model7.imageUrl =
      "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  cats.add(model7);
  return cats;
}
