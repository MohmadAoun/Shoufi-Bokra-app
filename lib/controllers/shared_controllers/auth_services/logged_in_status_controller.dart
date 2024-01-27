import 'package:get/get.dart';
import 'package:shoufibokra/services/get_storage/get_storage.dart';

class LoggedInStatus extends GetxController {
  final storage = Get.find<StorageService>();

  String checkLoggedInStatus() {
    final isLoggedIn = storage.isLoggedIn;
    String? role = storage.role;
    if (isLoggedIn) {
      if (role != null) {
        return role == 'User' ? '/user_home' : '/organizer_home';
      }
      return '/';
    }
    return '/';
  }
}
