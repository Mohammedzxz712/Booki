import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  void _showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpace(10),
              Text(
                'Logout',
                style: TextStyles.font22BlackBold,
                textAlign: TextAlign.center,
              ),
              verticalSpace(20),
              Text(
                'Are you sure you want to logout?',
                style: TextStyles.font16GrayRegular,
              ),
              verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close Bottom Sheet
                    },
                    style: const ButtonStyle(
                      side: MaterialStatePropertyAll(BorderSide(color:Color(0xff303030))),
                    ),
                    child: Text('Cancel' , style: TextStyle(color: const Color(0xff303030), fontSize: 16.sp, fontWeight: FontWeight.w600)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close Bottom Sheet
                      // Perform logout action here
                    },
                   style: const ButtonStyle(
                     side: MaterialStatePropertyAll(BorderSide(color: Colors.red)),
                   ),

                    child: Text('Logout' , style: TextStyle(color: Colors.red, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showLogoutBottomSheet(context),
      child: Row(
        children: [
          const Icon(
            Icons.logout,
            color: ColorsManager.maincolor,
            size: 30,
          ),
          horizontalSpace(10),
          Text(
            'Logout',
            style: TextStyles.font16MainColorBold,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
