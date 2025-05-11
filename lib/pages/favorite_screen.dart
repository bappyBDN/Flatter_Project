

import 'package:flutter/material.dart';
//import 'package:sdproject/providers/favorite_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../providers/favorite_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final  provider = FavoriteProvider.of(context);
    final finalList = provider.favorite;
    return  Scaffold(
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:20,left:20),
              child: Row(
                children: const [
                  Text(
                    "Favorite",
                    style:TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,

                    ),
                  ),
                ],
              ),
            ),
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
                          trailing: Text(
                            '\$${finalList[index].price}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }

              ),
            ),
          ]
      ),
    );

  }
}


