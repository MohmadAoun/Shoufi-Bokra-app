import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoufibokra/consts/app_images.dart';
import 'package:shoufibokra/utils/helpers/add_sized_box.dart';
import 'package:shoufibokra/views/pages/shared_pages/login_page.dart';
import 'package:shoufibokra/views/pages/shared_pages/signup_page.dart';
import 'package:shoufibokra/views/widgets/shared_widgets/auth_form/change_lang.dart';
import 'package:shoufibokra/views/widgets/shared_widgets/auth_form/form_button.dart';
import 'package:shoufibokra/views/widgets/shared_widgets/layout/logo_image.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppImages.APP_BACKGROUND),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent.withOpacity(0.4),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const LogoImage(),
              AddVerticalSpace(
                  height: MediaQuery.of(context).size.height * 0.03),
              FormButton(
                buttonText: 'Log In',
                buttonOnPressed: () {
                  Get.to(() => const LogInPage());
                },
              ),
              AddVerticalSpace(
                  height: MediaQuery.of(context).size.height * 0.015),
              FormButton(
                fillColor: false,
                buttonText: 'Sing Up',
                buttonOnPressed: () {
                  Get.to(() => const SignUpPage());
                },
              ),
              AddVerticalSpace(
                  height: MediaQuery.of(context).size.height * 0.015),
              const LanguageToggler(),
              AddVerticalSpace(
                  height: MediaQuery.of(context).size.height * 0.16),
            ],
          ),
        ),
      ),
    );
  }
}
