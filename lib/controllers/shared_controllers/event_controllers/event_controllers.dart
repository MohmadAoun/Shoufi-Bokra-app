import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shoufibokra/services/get_storage/get_storage.dart';
import 'package:shoufibokra/utils/helpers/get_snackbar.dart';
import '../../../consts/app_urls.dart';

class EventController extends GetxController {
  final storage = Get.find<StorageService>();
  getEvents() async {
    try {
      final response = await http.get(Uri.parse(AppUrl.GET_EVENT_URL),
          headers: {'Authorization': 'Bearer ${storage.token}'});

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        jsonResponse['events'];
      }
    } catch (e) {
      errorSnackBar('Network error $e');
    }
  }
}
