import 'package:capstone_project_category/categoryPage/food.dart';
import 'package:capstone_project_category/categoryPage/foodcategory.dart';
import 'package:flutter/material.dart';
import 'package:capstone_project_category/home/bottom.dart';
import 'package:capstone_project_category/home/basicAppBar.dart';
import 'package:capstone_project_category/widget/foodList.dart';

class CategoryDetail extends StatefulWidget {
  const CategoryDetail({super.key});

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  int _currentIndex = 0; // bottomnavigation index 번호
  String inputText = '';
  List<Food> foods = [];
  FoodCategory selectedCategory = FoodCategory.fromMap(
    {
      'category': 'kimchi',
      'imageUrl': 'kimchi.webp',
      'explanation':
          "Kimchi is a traditional Korean fermented food. It's made by fermenting sauerkraut, cabbage, radish, and other vegetables with spices like chili peppers, green onions, and garlic. It is considered one of the national foods of South Korea.",
    },
  );
  // 해당 카테고리의 정보를 가져오도록 수정

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  // 아이콘 눌렀을때 인덱스 번호 설정
  // home = 0, mail = 1, camera = 2, search = 3 , chatbot = 4

  void generateFood() {
    for (var i = 0; i < 27; i++) {
      foods.add(
        Food.fromMap(
          {
            'name': 'kimchi$i',
            'category': 'kimchi',
            'about': 'about',
            'source': 'source',
            'imageUrl': 'kimchi.webp',
            'bookmark': false,
            'ingredientList': 'ingredient',
            'recipeList': 'recipe',
          },
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    generateFood();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    selectedCategory.explanation,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 500,
                  child: Divider(color: Colors.black, thickness: 2.0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: SearchBar(
                    trailing: [
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          FocusManager.instance.primaryFocus
                              ?.unfocus(); // 검색 아이콘 누르면 키보드 숨김
                        },
                      ),
                    ],
                    backgroundColor: const MaterialStatePropertyAll(
                      Color(0xFFF1F0C9),
                    ),
                    shadowColor: const MaterialStatePropertyAll(Colors.black),
                    overlayColor: const MaterialStatePropertyAll(Colors.lime),
                    constraints: const BoxConstraints(
                      maxWidth: 350.0,
                      minHeight: 55.0,
                    ),
                    shape: MaterialStateProperty.all(
                      ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                    hintText: "Enter a category name",
                    onChanged: (value) {
                      setState(
                          () => inputText = value); // 입력값 inputText로 실시간 저장
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                FoodList(
                  foods: foods,
                  category: selectedCategory.category,
                  searchText: inputText,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
