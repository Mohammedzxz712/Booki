import 'package:bookly/core/helpers/spacing.dart';
import 'package:bookly/core/theming/styles.dart';
import 'package:bookly/core/widgets/app_text_bottom.dart';
import 'package:bookly/features/card/controller/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/utils/utils.dart';
import '../../controller/cart_event.dart';
import '../../controller/cart_state.dart';
import '../widgets/appbar.dart';
import '../widgets/cart_item.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc()..add(GetCartEvent()),
      child: Scaffold(

        backgroundColor: ColorsManager.offWhite,
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
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.separated(
                      itemCount: state.carts.length,
                      separatorBuilder: (context, index) => verticalSpace(16),
                      itemBuilder: (context, index) {
                        if (state.enCart == EnState.loading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: ColorsManager.maincolor,
                            ),
                          );
                        }
                        final order = state.carts[index];
                        return CartItem(order: order);
                      },
                    ),
                  );
                },
              ),
              AppTextButton(
                  buttonText: 'Check Out',
                  textStyle: TextStyles.font16WhiteMedium,
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
