import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData lightMode = ThemeData(
    primaryColorLight: Colors.white,
    primaryColorDark: Colors.black,

    // appBarTheme customization
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFFFDF8F6),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actionsPadding: EdgeInsets.only(right: 15.sp),
      // actions IconThemeData
      actionsIconTheme: IconThemeData(
        size: 24.sp,
        color: Colors.white,
        fill: 1.0,
      ),
      // normal Icontheme
      iconTheme: IconThemeData(size: 24.sp, color: Colors.white, fill: 1.0),
      //  titleStyle customization
      titleTextStyle: GoogleFonts.lora(
        fontSize: 16.h,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontStyle: FontStyle.italic,
      ),
    ),
    // IconTheme customization
    actionIconTheme: ActionIconThemeData(
      drawerButtonIconBuilder: (context) => Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Icon(Icons.arrow_back_ios_new, color: Colors.blueAccent),
      ),
    ),

    // TextThemes
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.dmSerifText(
        fontSize: 50.sp,
        fontWeight: FontWeight.w200,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        minimumSize: WidgetStatePropertyAll(Size(80.w, 50.h)),
        padding: WidgetStatePropertyAll(EdgeInsets.all(8.sp)),
        splashFactory: NoSplash.splashFactory,
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(25.sp),
            side: BorderSide(style: BorderStyle.none),
          ),
        ),
      ),
    ),
  );
}
