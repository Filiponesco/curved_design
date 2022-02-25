import 'package:curve_design/borders.dart';
import 'package:curve_design/colors.dart';
import 'package:curve_design/widgets/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// issue: https://github.com/material-foundation/google-fonts-flutter/issues/141
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curves Design',
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.light().textTheme,
        ),
        scaffoldBackgroundColor: AppColors.scaffoldColor,
        splashColor: AppColors.secondGradientColor,
        highlightColor: AppColors.firstGradientColor.withOpacity(.5),
        listTileTheme: ListTileThemeData(
          tileColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(borderRadius: AppBorders.mediumCorner),

        )
      ),
      darkTheme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData.dark().textTheme,
      )),
      themeMode: ThemeMode.light,
      home: const MyHomePage(),
    );
  }
}
