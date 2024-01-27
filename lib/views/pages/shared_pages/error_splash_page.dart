import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoufibokra/consts/app_images.dart';
import 'package:shoufibokra/consts/app_style.dart';
import 'package:shoufibokra/controllers/shared_controllers/auth_services/logged_in_status_controller.dart';

class ErrorSplashScreen extends StatelessWidget {
  const ErrorSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loggedInContoller = Get.find<LoggedInStatus>();
    return Scaffold(
      body: Container(
        color: Get.isDarkMode
            ? AppColors.PRIMARY_DARK_COLOR
            : AppColors.PRIMARY_LIGHT_COLOR,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  Get.isDarkMode
                      ? AppImages.APP_SPLASH_LIGHT
                      : AppImages.APP_SPLASH_LIGHT,
                ),
                width: MediaQuery.of(context).size.width * 0.75,
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Error you are not connected to the internet please connect first',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                onPressed: () async {
                  final isConnected =
                      await ConnectivityWrapper.instance.isConnected;
                  if (isConnected) {
                    String route = loggedInContoller.checkLoggedInStatus();
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitDown,
                      DeviceOrientation.portraitUp,
                    ]);
                    Get.offAllNamed(route);
                  }
                },
                icon: const Icon(
                  Icons.replay_outlined,
                  size: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
