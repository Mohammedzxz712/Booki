import 'package:bookly/core/helpers/spacing.dart';
import 'package:bookly/core/theming/styles.dart';
import 'package:bookly/core/widgets/app_text_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/appbar.dart';
import '../widgets/cart_item.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> orders = [
      {
        'title': 'Amareta',
        'author': 'Amro Abdelhamed',
        'price': '135 \$',
        'imageUrl':
            'https://s3-alpha-sig.figma.com/img/7550/f03b/726335f4d8fd52e6d06b9f9440d677f2?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=Nq4ngsh8u0yRgVDtgGjNW3gUKgc4~Mt7tHI1tBO8-0P-XEvOYp4DLaJ3596LO7MKsDVF3zXpQacB0dGKlpM0HlejugfgxvuhHXsWqZoP4fQkHjYISxnL2EGPmxyCwd2pWn5JgXPm51HDBWelZ0nok~5HBw4ePaGsCk2XpUPm6ofCRTbU9DD~GRosYZC89HOrKJHAFN7X5XvFYD1TMY0bEQrRfcyUWbxyZvCtbIkV44f8Nx79nN8mtvKaEu3wsT2MUdgEbIQAD2CvdTueyPjDOFIjwccxBHThIPxOvpi2Ui1j~Wk3a0DVglRXoBSxAycgTm-UzBgZdsKUYu3mu5NXOA__',
      },
      {
        'title': 'Game Of Thrones',
        'author': 'George R. R. Martin',
        'price': '135 \$',
        'imageUrl':
            'https://upload.wikimedia.org/wikipedia/en/d/d8/Game_of_Thrones_title_card.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarCart(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text('Cart', style: TextStyles.font24BlackBold)),
            verticalSpace(22),
            Text('Your Orders', style: TextStyles.font16BlackBold),
            verticalSpace(16),
            Expanded(
              child: ListView.separated(
                itemCount: orders.length,
                separatorBuilder: (context, index) => verticalSpace(16),
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return CartItem(order: order);
                },
              ),
            ),

            AppTextButton(
                buttonText: 'Check Out',

                textStyle: TextStyles.font16WhiteMedium,
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}



