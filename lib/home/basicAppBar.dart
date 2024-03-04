import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void backArrowPressed() {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const KFoodBoxHome()),
      // );
    }
    // 각 화면에 따라 뒤로갈 화면 결정하게끔 수정해야함

    return AppBar(
      leading: IconButton(
        onPressed: backArrowPressed,
        icon: const Icon(Icons.arrow_back),
        iconSize: 40,
      ),
      title: const Text(
        'AppBar Text', // 표시할 내용도 화면마다 변경되게 수정해야함
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.food_bank), // 임시 로고
          iconSize: 40,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
