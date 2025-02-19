import 'package:bookly/core/utils/onBoarding_list.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/spacing.dart';
import '../widgets/custom_indecator.dart';
import '../widgets/page_item.dart';
import '../widgets/sign_and_login_button.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: onBoardingList.length,
                controller: boardController,
                onPageChanged: (int index) {
                  setState(() {});
                },
                itemBuilder: (context, index) => PageItem(
                  index: index,
                ),
              )),
          CustomIndecator(boardController: boardController),
          verticalSpace(49),
          const SignAndLoginButton(),
          verticalSpace(49),
        ],
      ),
    );
  }
}
