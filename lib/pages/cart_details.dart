

import 'package:demoproject/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({super.key});

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  @override
  Widget build(BuildContext context) {
   final provider = CartProvider.of(context);
   final finalList = provider.cart;
   _buildProductQuantity(IconData icon,int index){
     return GestureDetector(
       onTap:() {
         setState(() {
           icon ==Icons.add ? provider.incrementQuantity(index)
               : provider.decrementQuantity(index);
         });
       },
       child: Container(
         decoration: BoxDecoration(
           shape: BoxShape.circle,
           color: Colors.red.shade100,
         ),
         child: Icon(
           icon,
           size: 17,

         ),
       ),
     );
   }

   return  Scaffold(
     appBar: AppBar(
       title: const Text('My cart'),
       centerTitle: true,
     ),
     body: Column(
       children: [
         Expanded(
           child: ListView.builder(
               itemCount: finalList.length,
               itemBuilder:  (context ,index){
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Slidable(
                     endActionPane: ActionPane(
                       motion: const ScrollMotion(),
                       children: [
                         SlidableAction(
                           onPressed: (context){
                             finalList[index].quantity=1;
                             finalList.removeAt(index);
                             setState((){});
                           },
                           backgroundColor: Colors.grey,
                           foregroundColor: Colors.red,
                           icon: Icons.delete,
                           label: 'Delete',
                         ),
                       ],
                     ),
                     child: ListTile(
                       title: Text(
                         finalList[index].name,
                         style: const TextStyle(
                           fontSize: 20,
                           fontWeight:  FontWeight.bold,
                         ),
                       ),
                       subtitle: Text(
                         finalList[index].description,
                         overflow: TextOverflow.ellipsis,
                       ),
                       leading:CircleAvatar(
                         radius: 30,
                         backgroundImage: AssetImage(finalList[index].image),
                         backgroundColor: Colors.red.shade100,
                       ),
                       trailing: Column(
                         children: [
                           _buildProductQuantity(Icons.add, index),
                           Text(
                             finalList[index].quantity.toString(),
                             style: const TextStyle(
                               fontSize: 12,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                           _buildProductQuantity(Icons.remove, index),
                         ],
                       ),
                     ),
                   ),
                 );
               }

           ),
         ),
          Container(
     padding: const EdgeInsets.all(20),
     width: double.infinity,
     height: 100,
     decoration: const BoxDecoration(
     color:Colors.white,
     borderRadius: BorderRadius.only(
     topLeft: Radius.circular(10),
     topRight: Radius.circular(10),
           ),
         ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${provider.getTotalPrice()}',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: (){
                    //provider.toggleProduct(product);
                   // Navigator.push(
                     // context,
                    //  MaterialPageRoute(
                      //  builder: (context) => CartDetails(),
                     // ),
                   // );
                  },
                  icon: const Icon(Icons.send),
                  label: const Text(

                      "Confirm Order"),
                ),
              ],
            ),
        ),
       ],
     ),

   );
  }
}
