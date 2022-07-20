import 'package:flutter/material.dart';
import 'package:recepies/models/meal.dart';
import 'package:recepies/screens/recepie_page.dart';

class RecepieItem extends StatelessWidget {
  var  title;
  var duration;
  var complexity;
  var imgSrc;
  var affordability;
  var meal;

  RecepieItem( @required this.meal){

     this.title =meal.title;
     this.imgSrc=meal.imageUrl;
     this.complexity=meal.complexity;
     this.duration=meal.duration;
     this.affordability=meal.affordability;
}

  void selectRecepie(BuildContext context) {
    Navigator.of(context).pushNamed(
      RecepiePage.routeName,
      arguments: {'meal': this.meal},
    ).then((value) {});
  }

  String get complexityText{
    return complexity.toString().substring(11);// subsstring "Complexity.Simple"
  }
  String get affordabilityText {
    switch(affordability){

      case Affordability.Luxurious :
        return "Luxurious";
        break;
      case Affordability.Pricey:
         return "Pricey";
         break;
      case Affordability.Affordable:
        return "Affordable";
        break;
      default:
        return "Unknown";

    }
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () { selectRecepie(context);},
      child: Card(
          shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          ) ,
          child:Column(
            children: [
              Stack(
              children: <Widget>[
              ClipRRect(
              borderRadius:BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight:Radius.circular(15),
    ),
              child:Image.network(
                imgSrc,
                height: 250,
                width:double.infinity,
                fit: BoxFit.cover,
              ),
    ),
              Positioned(
                right: 10,
                bottom: 14,
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                    color: Colors.black38,
                    width:240,
                    child: Text(title,style: Theme.of(context).textTheme.headlineMedium,)
                ),
                        ),
                                ],
                        ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule_outlined),
                        Text(" $duration mins"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.eco_sharp),
                        Text(complexityText),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        Text(affordabilityText)
                      ],
                    )
                  ],
                   ),
              ),
                      ],
      ),
    ),
    );
  }
}
