class Food {
  final String name;
  final String category;
  final String about;
  final String source;
  final String imageUrl;
  final bool bookmark;
  final String ingredientList;
  final String recipeList;

  // ingredientList, recipeList DB에 어떻게 저장되냐에 따라 자료형 + 생성자 변경

  Food.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        category = map['category'],
        about = map['about'],
        source = map['source'],
        imageUrl = map['imageUrl'],
        bookmark = map['bookmark'],
        ingredientList = map['ingredientList'],
        recipeList = map['recipeList'];

  @override
  String toString() => "Food<$name:$about>";
}
