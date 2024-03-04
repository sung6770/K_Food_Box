import 'package:capstone_project_category/categoryPage/foodcategory.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final List<FoodCategory> foodCategories;
  final String searchText;

  const CategoryList(
      {super.key, required this.foodCategories, required this.searchText});

  List<Widget> makeCircleImages(List<FoodCategory> foodcategories) {
    List<Widget> results = [];
    for (var i = 0; i < foodcategories.length; i++) {
      if (foodcategories[i].category.contains(searchText)) {
        results.add(
          InkWell(
            onTap: () {}, // 해당 카테고리 페이지로 이동
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              child: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/image/${foodcategories[i].imageUrl}'),
                radius: 48,
                child: Transform.translate(
                    offset: const Offset(0, 55),
                    child: Text(foodcategories[i].category)),
              ),
            ),
          ),
        );
      }
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height - 220;
    return SizedBox(
      width: sizeX,
      height: sizeY,
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        children: makeCircleImages(foodCategories),
      ),
    );
  }
}
