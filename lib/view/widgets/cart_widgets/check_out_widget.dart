import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../app_constants.dart';
import '../../../app_styles.dart';
import '../../../controller/cart_controller.dart';
import '../../../controller/lang_controller.dart';
import '../custom_button_widget.dart';

class CheckOutWidget extends StatelessWidget {
  VoidCallback? onPressed;

  CheckOutWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, cartController, _) {
        final subTotal = cartController.calculateSubTotal();
        const deliveryCharge = 10.0;
        const discount = 10.0;
        final total = subTotal + deliveryCharge - discount;

        return Container(
          width: 387.w,
          decoration: BoxDecoration(
            color: AppConstants.buttonColor,
            borderRadius: BorderRadius.circular(7.r),
            image: DecorationImage(
              image: AssetImage("assets/images/back.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Column(
              children: [
                _buildRow(
                  AppLocalizations.of(context)!.subtotal,
                  "\$$subTotal",
                  14.sp,
                  FontWeight.w500,
                  context,
                ),
                SizedBox(height: 6.h),
                _buildRow(
                  AppLocalizations.of(context)!.delivery_charge,
                  "\$$deliveryCharge",
                  14.sp,
                  FontWeight.w500,
                  context,
                ),
                SizedBox(height: 6.h),
                _buildRow(
                  AppLocalizations.of(context)!.discount,
                  "-\$$discount",
                  14.sp,
                  FontWeight.w500,
                  context,
                ),
                SizedBox(height: 6.h),
                _buildRow(
                  AppLocalizations.of(context)!.total,
                  "\$$total",
                  18.sp,
                  FontWeight.w700,
                  context,
                ),
                SizedBox(height: 28.h),
                CustomButtonWidget(
                  title: AppLocalizations.of(context)!.place_my_order,
                  borderRadius: 7.r,
                  width: double.infinity,
                  height: 60.h,
                  titleColor: AppConstants.buttonColor,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor,
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                  onPressed: onPressed,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRow(
    String label,
    String value,
    double fontSize,
    FontWeight fontWeight,
    BuildContext context,
  ) {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppStyles.getFontStyle(
            langController,
            fontSize: fontSize,
            color: Theme.of(context).scaffoldBackgroundColor,
            fontWeight: fontWeight,
          ),
        ),
        Text(
          value,
          style: AppStyles.getFontStyle(
            langController,
            fontSize: fontSize,
            color: Theme.of(context).scaffoldBackgroundColor,
            fontWeight: fontWeight,
          ),
        ),
      ],
    );
  }
}
