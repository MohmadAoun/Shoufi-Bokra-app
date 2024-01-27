import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../consts/app_style.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../widgets/shared_widgets/layout/custom_appbar.dart';
import '../../widgets/user/layout/user_textbutton.dart';
import '../../../services/get_storage/get_storage.dart';
import 'package:shoufibokra/utils/helpers/get_snackbar.dart';
import 'package:shoufibokra/utils/helpers/image_helper.dart';
import 'package:shoufibokra/utils/helpers/add_sized_box.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../controllers/shared_controllers/theme_controller.dart';
import 'package:shoufibokra/views/widgets/shared_widgets/auth_form/form_input.dart';
import 'package:shoufibokra/views/widgets/shared_widgets/auth_form/form_button.dart';
import 'package:shoufibokra/controllers/users_controllers/update_profile_controller.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = Get.find<StorageService>();
    final themeController = Get.find<ThemeController>();
    final imageHelper = Get.put(ImageHelper());
    final updateProfileController = Get.put(UpdateProfileController());
    XFile file;
    CroppedFile? croppedFile;
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.06,
              ),
              child: CustomAppBar(
                title: 'Update Profile',
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(
                      () => CircleAvatar(
                        backgroundColor:
                            themeController.currentTheme.value == ThemeMode.dark
                                ? AppColors.DARK_ACCENT_COLOR
                                : AppColors.LIGHT_ACCENT_COLOR,
                        maxRadius: 70,
                        child: Center(
                          child: storage.profileImageUrl == ''
                              ? Image(
                                  image: AssetImage(
                                      themeController.profileImage.value),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                )
                              : ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: storage.profileImageUrl as String,
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) {
                                      errorSnackBar(
                                          'Failed to load image $error');
                                      return const Icon(Icons.error);
                                    },
                                  ),
                                ),
                        ),
                      ),
                    ),
                    AddVerticalSpace(
                        height: MediaQuery.of(context).size.height / 40),
                    Obx(
                      () => UserTextButton(
                        onPressed: () async {
                          file = (await imageHelper.pickImage())!;
                          croppedFile = await imageHelper.crop(file: file);
                          croppedFile != null
                              ? updateProfileController.changedFields.value =
                                  true
                              : null;
                          croppedFile != null
                              ? updateProfileController.selectedImage.value =
                                  true
                              : updateProfileController.selectedImage.value =
                                  false;
                        },
                        text:
                            updateProfileController.selectedImage.value == false
                                ? 'Select profile image'
                                : 'Image is loaded',
                        icon:
                            updateProfileController.selectedImage.value == false
                                ? Icons.add_a_photo
                                : Icons.check,
                        currentTheme: themeController.currentTheme.value,
                      ),
                    ),
                    AddVerticalSpace(
                        height: MediaQuery.of(context).size.height / 80),
                    FormInputField(
                      hintText: 'First Name',
                      controller: updateProfileController.firstName,
                    ),
                    AddVerticalSpace(
                        height: MediaQuery.of(context).size.height / 80),
                    FormInputField(
                      hintText: 'Last Name',
                      controller: updateProfileController.lastName,
                    ),
                    AddVerticalSpace(
                        height: MediaQuery.of(context).size.height / 80),
                    FormInputField(
                      hintText: 'Phone Number',
                      textInputType: TextInputType.phone,
                      controller: updateProfileController.phoneNumber,
                    ),
                    AddVerticalSpace(
                        height: MediaQuery.of(context).size.height / 80),
                    FormButton(
                      buttonText: 'Submit',
                      buttonOnPressed: () {
                        updateProfileController.updateProfile(croppedFile);
                        updateProfileController.changedFields.value = false;
                        updateProfileController.selectedImage.value = false;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: updateProfileController.isLoading.value,
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
