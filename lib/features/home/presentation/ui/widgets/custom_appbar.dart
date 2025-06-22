import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../generated/assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: ColorsManager.offWhite,
      elevation: 0,
      title: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(Assets.imagesMohammed),
          ),
          horizontalSpace(10),
          const Text(
            'Hi, Mohammed',
            style:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Spacer(),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none_sharp,
                    color: Colors.grey),
                onPressed: () {},
              ),
              Positioned(
                top: 7,
                right: 9,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
