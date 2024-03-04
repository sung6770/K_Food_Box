class FoodCategory {
  final String category;
  final String imageUrl;
  final String explanation;

  FoodCategory.fromMap(Map<String, dynamic> map)
      : category = map['category'],
        imageUrl = map['imageUrl'],
        explanation = map['explanation'];
}
