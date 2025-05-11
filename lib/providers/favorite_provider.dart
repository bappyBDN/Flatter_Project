import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:demoproject/project/models/product.dart';

import '../models/product.dart';


class FavoriteProvider extends ChangeNotifier {
  final List <Product>_favorites =[];
  List<Product>get favorite=> _favorites;

  void togglFavorit(Product product){
    if(_favorites.contains(product)){
      _favorites.remove(product);
    }
    else{
      _favorites.add(product);
    }
    notifyListeners();
  }
  bool isExist(Product product){
    final isExist = _favorites.contains(product);
    return isExist;
  }
  static FavoriteProvider of(
      BuildContext context,{
        bool listen =true,
      }
      ){
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}