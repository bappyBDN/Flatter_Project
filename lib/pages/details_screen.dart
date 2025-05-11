

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../providers/cart_provider.dart';
import 'cart_details.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox (height: 30.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 130,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.shade300,
                ),
                child: Image.asset(product.image,fit : BoxFit.cover),
              ) ,
            ],
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 160,
            decoration: const BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [

                Text(
                  product.name.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$' '${product.price}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  product.description,
                  // textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),

              ],
            ),

          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: const[
              Text(
                "Available Colors",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8.0),
          Row(
            children: const [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.red,
              ),
              SizedBox(width: 7.5),
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blue,
              ),
              SizedBox(width: 7.5),
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.black,
              ),
            ],
          ),


          // Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // children: const[
          //   Text(
          //   "Available Size",
          //   style: TextStyle(
          //   fontSize: 12,
          //   fontWeight: FontWeight.bold,
          //),
          //        ),
          //    ],
          //      ),
          //    const SizedBox(height: 8.0),
          //  Row(
          //  children: [

          //  AvailableSize(size: "BD 40") ,
          //AvailableSize(size: "BD 42"),
          //       AvailableSize(size: "BD 43"),
          //     AvailableSize(size: "BD 45"),

          //   ],
          //  ),

          //
          // const SizedBox(height: 40.0),



        ],

      ),
      bottomSheet: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height /10,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$' '${product.price}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              ElevatedButton.icon(
                onPressed: (){
                  provider.toggleProduct(product);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartDetails(),
                    ),
                  );
                },
                icon: const Icon(Icons.send),
                label: const Text(

                    "Add to Cart"),
              ),
            ],
          ),
        ),
      ),


    );

  }
}

