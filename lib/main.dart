import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jala_test/core/di.dart';
import 'package:jala_test/routes/root_router.dart';
import 'package:jala_test/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jala_test/shared/styles/text_styles.dart';

void main() {
  injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(360, 720),
        builder: (_, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // TRY THIS: Try running your application with "flutter run". You'll see
              // the application has a purple toolbar. Then, without quitting the app,
              // try changing the seedColor in the colorScheme below to Colors.green
              // and then invoke "hot reload" (save your changes or press the "hot
              // reload" button in a Flutter-supported IDE, or press "r" if you used
              // the command line to start the app).
              //
              // Notice that the counter didn't reset back to zero; the application
              // state is not lost during the reload. To reset the state, use hot
              // restart instead.
              //
              // This works for code too, not just values: Most code changes can be
              // tested with just a hot reload.
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              primaryColor: Colors.blue,
              useMaterial3: true,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.blue,
                titleTextStyle: TextStyles.title2.copyWith(
                  color: Colors.white,
                ),
              ),
              textTheme: GoogleFonts.latoTextTheme(),
            ),
            builder: (_, widget) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: const TextScaler.linear(1),
                ),
                child: widget!,
              );
            },
            onGenerateRoute: RootRouter.generateRoute,
            initialRoute: Routes.root,
          );
        });
  }
}
