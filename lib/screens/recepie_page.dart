import 'package:flutter/material.dart';
import 'package:recepies/models/meal.dart';

class RecepiePage extends StatelessWidget {
  final Function toggleFavourite;
  final Function isFavourite;
  const RecepiePage(this.isFavourite ,this.toggleFavourite) ;
  static const routeName='/category-page/recepie-page';

  Widget _buildTitle(BuildContext context ,String text){
    return  Container(

      margin: EdgeInsets.all(2),
      child:Text(text,style: Theme.of(context).textTheme.headlineSmall,),

    );
  }
  @override
  Widget build(BuildContext context) {
    final args= (ModalRoute.of(context)!.settings.arguments as Map<String , dynamic>);
    final Meal meal=args['meal'];
    return Scaffold(
      appBar: AppBar(title: Text(meal.title,style: Theme.of(context).textTheme.headlineLarge)),
      body: Column(
        children: [
          Container(
            height: 240,
            width: double.infinity,
            child:Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,),
          ),
          _buildTitle(context, "Ingredients"),
          Card(
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Container(
              //padding: EdgeInsets.symmetric(vertical: 7,horizontal: 5),
              width:double.infinity,
              height:150,

              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border :Border.all(width: 8 ,color:Color.fromRGBO(10, 10, 10, 0.8),),color: Colors.white70),
              child: ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (context ,index){
                       return Container(
                    height: 32,
                    width:300,
                    color:Color.fromRGBO(10, 10, 10, 0.8),
                    child:ListTile(
                      //tileColor: Colors.black54,

                      leading: CircleAvatar(backgroundColor: Colors.red, maxRadius:8, child: FittedBox(child: Text("${index+1}",)),),
                      title:  Text(meal.ingredients[index],style:Theme.of(context).textTheme.displaySmall),
                    )
                );
              }

              ),
            ),
          ),
          _buildTitle(context, "Steps"),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 6,
            color: Color.fromRGBO(240, 240, 240, 0.8),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
              width:double.infinity,
              height:185,
             //
              // margin: EdgeInsets.only(left: 6,right: 6),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border :Border.all(color: Color.fromRGBO(240, 240, 240, 0.8),),color: Color.fromRGBO(240, 240, 240, 0.8),),
              child: ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (context ,index){
                    return Container(
                        //height: 34,
                        width:300,
                        color:Color.fromRGBO(240, 240, 240, 0.8),
                        child:ListTile(
                          //tileColor: Colors.black54,

                          leading: CircleAvatar(backgroundColor: Colors.red, maxRadius:8, child: FittedBox(child: Text("${index+1}",)),),
                          title:  Container(width: 400,child: Text(meal.steps[index],style:Theme.of(context).textTheme.displayMedium)),
                        )

                    );
                  }

              ),
            ),
          ),
        ],
      ),
      floatingActionButton: IconButton(
        iconSize: 30.0,
        icon: isFavourite(meal.id)?Icon(Icons.favorite_sharp,color: Theme.of(context).accentColor,):Icon(Icons.favorite_border_sharp),
        onPressed: (){
        toggleFavourite(meal);
      },

      ),

    );
  }
}
