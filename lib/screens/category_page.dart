import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../templates/recepie_item.dart';

class CategoryPage extends StatefulWidget {
  List<Meal> availableMeals;
  CategoryPage(this.availableMeals);
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  //final name;
  String? title;
  var displayMeals;
  void initState(){
    super.initState();
  }
  void didChangeDependencies(){
    final args=ModalRoute.of(context)?.settings.arguments as Map<String, String> ;
    final id=args['id'];
    title=args['title'];
    displayMeals= widget.availableMeals.where((meal) => meal.categories.contains(id)).toList() as List<Meal>;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(title! ,style: Theme.of(context).textTheme.headlineLarge,),),
      body: Container(
        child: ListView.builder(itemBuilder: (ctx,index){
        return RecepieItem(displayMeals[index]);
        },
        itemCount: displayMeals.length,
        ),
      ),
    );
  }
}
