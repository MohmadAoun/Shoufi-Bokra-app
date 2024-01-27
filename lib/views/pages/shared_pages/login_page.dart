import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shoufibokra/utils/helpers/get_snackbar.dart';
import 'package:shoufibokra/utils/helpers/add_sized_box.dart';
import 'package:shoufibokra/views/widgets/shared_widgets/auth_form/form_input.dart';
import 'package:shoufibokra/views/widgets/shared_widgets/layout/logo_image.dart';
import 'package:shoufibokra/views/widgets/shared_widgets/auth_form/form_button.dart';
import 'package:shoufibokra/views/widgets/shared_widgets/auth_form/change_lang.dart';
import 'package:shoufibokra/controllers/shared_controllers/auth_services/login_controller.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LogoImage(),
                    const AddVerticalSpace(height: 25),
                    FormInputField(
                      hintText: 'Phone number'.tr,
                      controller: controller.phoneNumber,
                      textInputType: TextInputType.phone,
                    ),
                    const AddVerticalSpace(height: 10),
                    FormInputField(
                      hintText: 'Password'.tr,
                      controller: controller.password,
                      obscureText: true,
                    ),
                    const AddVerticalSpace(height: 10),
                    FormButton(
                      buttonText: 'Log In with phone number'.tr,
                      buttonOnPressed: () {},
                    ),
                    const AddVerticalSpace(height: 10),
                    FormButton(
                      buttonText: 'Log In'.tr,
                      buttonOnPressed: () {
                        if (controller.phoneNumber.text.isNotEmpty &&
                            controller.password.text.isNotEmpty) {
                          controller.login();
                        } else {
                          errorSnackBar('Please fill all the fields');
                        }
                      },
                    ),
                    const AddVerticalSpace(height: 10),
                    const LanguageToggler(),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.isLoading.value,
              child: Container(
                color: Colors.black.withOpacity(
                    0.5), // Add a semi-transparent background color
                child: const Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
