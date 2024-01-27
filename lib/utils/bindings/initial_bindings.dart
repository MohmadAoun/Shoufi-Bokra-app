import 'package:get/get.dart';
import 'package:shoufibokra/controllers/shared_controllers/auth_services/logged_in_status_controller.dart';
import 'package:shoufibokra/controllers/shared_controllers/theme_controller.dart';

import '../../controllers/users_controllers/update_profile_controller.dart';
import 'package:shoufibokra/controllers/shared_controllers/auth_services/login_controller.dart';
import 'package:shoufibokra/controllers/shared_controllers/auth_services/signup_controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(ThemeController());
    Get.put(LoggedInStatus());
    Get.put(SignUpController());
    Get.put(UpdateProfileController());
  }
}
