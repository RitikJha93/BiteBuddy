import 'package:bitebuddy/common/widgets/loader.dart';
import 'package:bitebuddy/features/authentication/controllers/first_time_check.dart';
import 'package:bitebuddy/utils/constants/colors.dart';
import 'package:bitebuddy/utils/device/device_utilities.dart';
import 'package:bitebuddy/utils/localstorage/local_storage.dart';
import 'package:bitebuddy/utils/routes/app_router.dart';
import 'package:bitebuddy/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //loading env file
  await dotenv.load(fileName: ".env");
  //loading get storage
  await GetStorage.init();

  await TDeviceUtilites.setStatusBarColor(Colors.black38);
  //initialising supabase
  await Supabase.initialize(
    url: dotenv.env["SUPABASE_URL"]!,
    anonKey: dotenv.env["SUPABASE_ANON_KEY"]!,
  ).then((value) => Get.put(FirstTimeCheck()));

  print(StorageService.cartItems);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "BiteBuddy",
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      
      getPages: AppRouter.pages,
      home: Scaffold(
        body: Container(
          color: TColors.primaryColor,
          child: Center(
            child: Loader(loaderColor: TColors.light),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
