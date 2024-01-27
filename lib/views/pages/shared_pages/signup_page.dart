import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../utils/helpers/add_sized_box.dart';
import '../../widgets/shared_widgets/auth_form/form_input.dart';
import '../../widgets/shared_widgets/layout/logo_image.dart';
import '../../widgets/shared_widgets/auth_form/change_lang.dart';
import '../../widgets/shared_widgets/auth_form/form_button.dart';
import 'package:shoufibokra/utils/helpers/get_snackbar.dart';
import 'package:shoufibokra/views/widgets/shared_widgets/auth_form/form_dropdownmenu.dart';
import '../../../controllers/shared_controllers/auth_services/signup_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.find<SignUpController>();
    String selectedRole = 'User';
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
                    FormDropDownMenu(
                      selectedRole: selectedRole,
                      hintText: 'Role',
                      values: const ['User', 'Organizer'],
                      onChanged: (value) {
                        if (value == 'Organizer') {
                          selectedRole = 'Organizer';
                          controller.visible.value = true;
                        } else {
                          selectedRole = 'User';
                          controller.visible.value = false;
                        }
                      },
                    ),
                    const AddVerticalSpace(height: 10),
                    FormInputField(
                      hintText: 'First name',
                      controller: controller.firstName,
                    ),
                    const AddVerticalSpace(height: 10),
                    FormInputField(
                      hintText: 'Last name',
                      controller: controller.lastName,
                    ),
                    Obx(() {
                      return AddVerticalSpace(
                        visible: controller.visible.value,
                        height: 10,
                      );
                    }),
                    Obx(() {
                      return FormInputField(
                        visible: controller.visible.value,
                        hintText: 'Display name',
                        controller: controller.displayName,
                      );
                    }),
                    const AddVerticalSpace(height: 10),
                    FormInputField(
                      hintText: 'Phone number',
                      controller: controller.phoneNumber,
                      textInputType: TextInputType.phone,
                    ),
                    const AddVerticalSpace(height: 10),
                    FormInputField(
                      hintText: 'Password',
                      controller: controller.password,
                      obscureText: true,
                    ),
                    const AddVerticalSpace(height: 10),
                    FormButton(
                      buttonText: 'Sign Up',
                      buttonOnPressed: () {
                        if (controller.phoneNumber.text.isNotEmpty &&
                            controller.password.text.isNotEmpty &&
                            controller.firstName.text.isNotEmpty &&
                            controller.lastName.text.isNotEmpty) {
                          controller.role.text = selectedRole;
                          controller.singup();
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
