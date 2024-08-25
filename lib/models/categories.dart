class CategoryModel {
  String vector;
  bool isselected;

  CategoryModel({
    required this.vector,
    required this.isselected
  });
  
  static List <CategoryModel> getcategories(){

    List <CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        vector: 'assets/vectors/AI.svg', 
      isselected: false)
    );

     categories.add(
      CategoryModel(
        vector: 'assets/vectors/app.svg',
      isselected: true)
    );

     categories.add(
      CategoryModel(
        vector: 'assets/vectors/web.svg', 
      isselected: false)
    );

     categories.add(
      CategoryModel(
        vector: 'assets/vectors/notify.svg', 
      isselected: false)
    );

    return categories;
  }

}
