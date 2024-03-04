import 'package:capstone_project_category/widget/categoryList.dart';
import 'package:flutter/material.dart';
import 'package:capstone_project_category/home/bottom.dart';
import 'package:capstone_project_category/home/basicAppBar.dart';
//import 'package:capstone_project_category/home/main_screen.dart';
import 'foodcategory.dart';

class CategoryMain extends StatefulWidget {
  const CategoryMain({super.key});

  @override
  State<CategoryMain> createState() => _CategoryMainState();
}

class _CategoryMainState extends State<CategoryMain> {
  int _currentIndex = 0; // bottomnavigation index 번호
  String inputText = '';
  double? sizeX, sizeY;

  List<FoodCategory> foodCategories = [];

  void generateCategory() {
    for (var i = 0; i < 27; i++) {
      foodCategories.add(
        FoodCategory.fromMap(
          {
            'category': '[kimchi$i]',
            'imageUrl': 'kimchi.webp',
            'explanation': "kimchi is ~",
          },
        ),
      );
    }
  }
  // 음식 리스트 확인하기 위한 임시 코드 - 삭제예정

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  // 아이콘 눌렀을때 인덱스 번호 설정
  // home = 0, mail = 1, camera = 2, search = 3 , chatbot = 4

  void textChanged(String text) {
    inputText = text;
  }

  @override
  void initState() {
    super.initState();
    generateCategory();
  }

  @override
  Widget build(BuildContext context) {
    sizeX = MediaQuery.of(context).size.width;
    sizeY = MediaQuery.of(context).size.height - 220;
    return Scaffold(
      appBar: const BasicAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 7,
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
                    setState(() => inputText = value); // 입력값 inputText로 실시간 저장
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              CategoryList(
                foodCategories: foodCategories,
                searchText: inputText,
              ),
            ],
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
