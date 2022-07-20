import "package:flutter/material.dart";
import '../templates//recepie_item.dart';

class Favourites extends StatelessWidget {
  final favouriteMeals;
  const Favourites(this.favouriteMeals) ;

  @override
  Widget build(BuildContext context) {

    return  Container(
      child: ListView.builder(itemBuilder: (ctx,index){

        return RecepieItem(favouriteMeals[index]);
      },
        itemCount: favouriteMeals.length,
      ),
    );
  }
}
