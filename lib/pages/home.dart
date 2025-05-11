
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/my_product.dart';
import '../models/phone_product.dart';
import '../models/product_card.dart';
import '../providers/cart_provider.dart';
import '../providers/favorite_provider.dart';
import 'details_screen.dart';
import 'login_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override

  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected =0;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      //crossAxisAlignment: CrossAxisAlignment.start,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Our Products",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              _buildProductCategory(index: 0,name :"All Products"),
              _buildProductCategory(index: 1,name :"Phone"),
              //_buildProductCategory(index: 2,name :"Winter Products"),
              _buildProductCategory(index: 2,name :"Sneakers"),

            ],


          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: isSelected == 0? _buildAllProducts() : _buildPhone() ,
          ),

        ],

      ),
    );

  }
  _buildProductCategory({required int index,required String name}) =>
      GestureDetector(
        onTap: () =>setState(() => isSelected = index),
        child: Container(
            width: 100,
            height: 40,
            margin: const EdgeInsets.only(top: 10,right: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: isSelected == index ? Colors.red : Colors.red.shade300,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Text(
              name,
              style: const TextStyle(color: Colors.white),
            )

        ),
      );
  _buildAllProducts() => GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100/140),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    itemCount: MyProducts.allProducts.length,
    itemBuilder: (context,index){
      final allProducts = MyProducts.allProducts[index];
      return GestureDetector(
        onTap: ()=> Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>  DetailsScreen(product: allProducts)
          ),
        ),
        child: ProductCard(product: allProducts),

      );
    },

  );
  _buildPhone()=>GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100/140),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    itemCount: PhoneProducts.phoneProducts.length,
    itemBuilder: (context,index) {
      final phoneProducts = PhoneProducts.phoneProducts[index];
      return ProductCard(product: phoneProducts);
    },
  );



}






