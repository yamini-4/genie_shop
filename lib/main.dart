import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genie/view/auth/login_screen.dart';

import 'constants/colors.dart';
import 'constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //initialize flutter fire
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414.0, 896.0),
      builder: () {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
          // home: FirebaseAuth.instance.currentUser == null
          //     ? LoginScreen()
          //     : HomePage(),
          title: appName,
          theme: ThemeData(
            primarySwatch: Colors.pink,
            textTheme: TextTheme(
              bodyText1: TextStyle(
                fontFamily: "Comfortaa",
              ),
              bodyText2: TextStyle(
                fontFamily: "Comfortaa",
              ),
              headline5: TextStyle(
                fontFamily: "Comfortaa",
              ),
              headline6: TextStyle(
                fontFamily: "Comfortaa",
              ),
            ),
            tabBarTheme: TabBarTheme(
              labelStyle: TextStyle(
                  fontFamily: "Comfortaa", fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontFamily: "Comfortaa"),
            ),
            appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: "Comfortaa",
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp),
            ),
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(
                fontFamily: "Comfortaa",
                fontSize: 18.sp,
                color: labelColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
