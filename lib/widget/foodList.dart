import 'package:capstone_project_category/categoryPage/food.dart';
import 'package:flutter/material.dart';

class FoodList extends StatelessWidget {
  final List<Food> foods;
  final String category;
  final String searchText;

  const FoodList({
    super.key,
    required this.foods,
    required this.category,
    required this.searchText,
  });

  List<Widget> makeFoodList(List<Food> foods) {
    List<Widget> results = [];
    for (var i = 0; i < foods.length; i++) {
      if (foods[i].category.compareTo(category) == 0 &&
          foods[i].name.contains(searchText)) {
        results.add(
          InkWell(
            onTap: () {}, // 해당 카테고리 페이지로 이동
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              child: Container(
                width: 500,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.lime.shade50,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image(
                          image:
                              AssetImage('assets/image/${foods[i].imageUrl}'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        foods[i].name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                //     AssetImage('assets/image/${foods[i].imageUrl}'),
                // child: Transform.translate(
                //     offset: const Offset(0, 55),
                //     child: Text(foods[i].category)),
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
    final sizeY = MediaQuery.of(context).size.height - 480;
    return SizedBox(
      width: sizeX,
      height: sizeY,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: makeFoodList(foods),
      ),
    );
  }
}
