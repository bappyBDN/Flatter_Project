


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoproject/pages/profile_screen.dart';
import 'package:demoproject/pages/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../firebase_auth_implementation/toast.dart';
import '../providers/cart_provider.dart';
import '../providers/favorite_provider.dart';
import 'cart_details.dart';
import 'favorite_screen.dart';
import 'home.dart';
import 'login_page.dart';


class HomePage extends StatefulWidget {
  //final String title;
  const HomePage({super.key, required this.title});
  ////codeEditen
  // @override


  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("/home"),
      ),
      body: Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );


  }
  ///codeedited>>>>>


  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex=0;
  List screens =[
    const HomeScreen(),
    const FavoriteScreen(),
    const Profile(),
  ];



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title:const Text("Gorer Bazar BD"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=>const CartDetails(),
              ),
            ),
            icon: const Icon(Icons.add_shopping_cart),
          ),
        ],

      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value){
          setState(() =>currentIndex = value);
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Favorite",
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),

        ],
      ),

    );
  }

}