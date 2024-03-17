import 'package:capstone_project_category/categoryPage/food.dart';
import 'package:capstone_project_category/home/basicAppBar.dart';
import 'package:capstone_project_category/home/bottom.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodInformation extends StatefulWidget {
  const FoodInformation({super.key});

  @override
  State<FoodInformation> createState() => _FoodInformationState();
}

class _FoodInformationState extends State<FoodInformation> {
  int _currentIndex = 0; // bottomnavigation index 번호

  Food food = Food.fromMap(
    {
      'name': 'kimchi',
      'category': 'kimchi',
      'about': 'about fksdfksmfkmsfdvsnkvsnjjsvjnsvnjsvdjkdsvnjsvnjksvjdsvnk',
      'source': 'source',
      'imageUrl': 'kimchi.webp',
      'bookmark': false,
      'ingredientList': 'ingredient',
      'recipeList': 'recipe',
    },
  );

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Map<String, String>> imageList = [
    {
      "url":
          "https://recipe1.ezmember.co.kr/cache/recipe/2023/06/29/a1a5a04e39879f1033ae07367dfee5251.jpg",
      "name": "tteokbokki"
    },
    {
      "url":
          "https://www.sanghafarm.co.kr/sanghafarm_Data/upload/shop/product/201810/A0003528_2018102319172333992.jpg",
      "name": "sundae"
    },
    {
      "url":
          "https://recipe1.ezmember.co.kr/cache/recipe/2022/08/04/d6f211ffa5c3846d5134f4d6bb00a3a51.jpg",
      "name": "Bossam"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                ),
                items: imageList
                    .map((e) => ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Stack(
                            children: <Widget>[
                              Image.network(
                                e['url']!, // 여기서 `!`를 사용하여 `e['url']`이 null이 아님을 단언/ 안하면 오류 발생
                                width: 1050.0,
                                height: 350.0,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                // 이미지 위에 텍스트 위치
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(
                width: 500,
                child: Divider(color: Colors.black, thickness: 2.0),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "About",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            food.bookmark = !food.bookmark;
                          },
                          icon: food.bookmark
                              ? const Icon(Icons.bookmark_outlined)
                              : const Icon(Icons.bookmark_outline_rounded),
                          iconSize: 40,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 30,
                    ),
                    child: Text(
                      food.about,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 500,
                child: Divider(color: Colors.black, thickness: 2.0),
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recipe",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ingredients and portions",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 30,
                    ),
                    child: Text(
                      food.recipeList,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sequence",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 30,
                    ),
                    child: Text(
                      food.recipeList,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        label: const Text(
                          "Custom Recipe",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ),
                        ),
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "source: ${food.source}",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
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
