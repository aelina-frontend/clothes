
import 'package:clothes/presentation/cubit/clothes_cubit.dart';
import 'package:clothes/presentation/main_screen.dart';
import 'package:clothes/presentation/responsive/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ClothesCubit()..fetchPosts()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.adamina().fontFamily,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}



// void main() => runApp(
//   DevicePreview(
//     enabled: !kReleaseMode,
//     builder: (context) => MyApp(), // Wrap your app
//   ),
// );
//
// class MyApp extends StatelessWidget
// {
//   @override
//   Widget build(BuildContext context)
//   {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (_) => ClothesCubit()..fetchPosts()),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         useInheritedMediaQuery: true,
//         locale: DevicePreview.locale(context),
//         builder: DevicePreview.appBuilder,
//         theme: ThemeData(
//           fontFamily: GoogleFonts.adamina().fontFamily,
//         ),
//         darkTheme: ThemeData.dark(),
//         home: const MainScreen(),
//       ),
//     );
//   }
// }