import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/controller/check_out_controller.dart';
import 'package:provider/provider.dart';
import '../app_styles.dart';
import '../controller/lang_controller.dart';
import '../l10n/app_localizations.dart';
import 'chat_page.dart';

class Alexander extends StatefulWidget {
  const Alexander({super.key});

  @override
  State<Alexander> createState() => _AlexanderState();
}

class _AlexanderState extends State<Alexander> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Column(
      children: [
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/photo man.png'),
          ),
          title: Text(
            AppLocalizations.of(context)!.your_delivery_hero,
            style: AppStyles.getFontStyle(
              langController,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isDarkMode ? Colors.white : Color(0xff878787),
            ),
          ),
          subtitle: Row(
            children: [
              Text(
                AppLocalizations.of(context)!.aleksandr_v,
                style: AppStyles.getFontStyle(
                  langController,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: isDarkMode ? Colors.grey : Color(0xff2F2E36),
                ),
              ),
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Color(0xffF2AB58), size: 16),
                    Text(
                      ' 4,9',
                      style: AppStyles.getFontStyle(
                        langController,
                        color: Color(0xffB8B8B8),
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).cardColor,
                ),
                child: Icon(Icons.phone, color: Colors.green),
              ),
              SizedBox(width: 10.w),
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:
                      isDarkMode
                          ? Theme.of(context).cardColor
                          : Color(0xffF5F5F5),
                ),
                child: Consumer<CheckOutController>(
                  builder: (context, checkOutController, child) {
                    return IconButton(
                      onPressed: () {
                        checkOutController.toggleChatScreen();
                      },
                      icon: Icon(Icons.message, color: Colors.orange),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Container(height: 1.h, width: 440.w, color: Color(0xffF5F5F5)),
        SizedBox(height: 10.h),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.your_location,
              style: AppStyles.getFontStyle(
                langController,
                fontSize: 12,
                color: Color(0xff878787),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Icon(Icons.location_on_outlined, color: Color(0xff4CAF50)),
                Text(
                  AppLocalizations.of(context)!.loc,
                  style: AppStyles.getFontStyle(
                    langController,
                    fontSize: 12,
                    color: Color(0xff6C7278),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
