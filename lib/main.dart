import 'package:demoproject/pages/cart_details.dart';
import 'package:demoproject/pages/favorite_screen.dart';
import 'package:demoproject/pages/home.dart';
import 'package:demoproject/pages/home_page.dart';
import 'package:demoproject/pages/login_page.dart';
import 'package:demoproject/pages/profile_screen.dart';
import 'package:demoproject/pages/sign_up_page.dart';
import 'package:demoproject/providers/cart_provider.dart';
import 'package:demoproject/providers/favorite_provider.dart';
import 'package:demoproject/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

 Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
////...................///..............
class MyApp extends StatelessWidget {
  const MyApp({super.key, required });

// This widget is the root of your application.
@override
Widget build(BuildContext context)=>MultiProvider(providers: [
  ChangeNotifierProvider(create: (_)=>FavoriteProvider()),
  ChangeNotifierProvider(create: (_)=>CartProvider()),

],
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(

      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    routes: {
      '/' :(context) => SplashScreen(
  // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
     child: LoginPage(),
   ),
   '/login': (context) => LoginPage(),
   '/signUp': (context) => SignUpPage(),
   '/home': (context) => HomePage(title: '',),
    },
    //home: const MyHomePage(title: 'Flutter Demo Home Page'),
   // home:LoginPage(),
  ),
);
}

///.......................////////////..........
///




/////////////////------------------/////
//class MyApp extends StatelessWidget {

 //@override

 //Widget build(BuildContext context) {

  // return MaterialApp(
  // debugShowCheckedModeBanner: false,
  //     title: 'Flutter Firebase',
  // routes: {
  //  '/': (context) => SplashScreen(
     // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
  //   child: LoginPage(),
   // ),
   // '/login': (context) => LoginPage(),
   // '/signUp': (context) => SignUpPage(),
   // '/home': (context) => HomePage(title: '',),
   // },
  // );
 // }
 //}