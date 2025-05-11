



import 'package:demoproject/models/product.dart';
import 'package:flutter/material.dart';

import '../providers/favorite_provider.dart';

class ProductCard extends StatefulWidget {
  //const ProductCard({super.key});
  final Product product;
  const ProductCard({super.key,required this.product});


  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Container(
      width: MediaQuery.of(context).size.width/2,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        children: [

          SizedBox(

            height: 100,
            width: 100,
            child: Image.asset(
              widget.product.image,
              fit:BoxFit.cover,

            ),
          ),

          Text(
            widget.product.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,

            ),
          ),
          Text(
            widget.product.category,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.red,

            ),
          ),
          Text(
            '\$' '${widget.product.price}',
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap:() => provider.togglFavorit(widget.product),


                child: Icon(
                  provider.isExist(widget.product)
                      ? Icons.favorite

                      : Icons.favorite_border_outlined,
                  color: Colors.red,
                ),
              ),
            ],
          )



        ],
      ),
    );
  }
}
