
import 'package:flutter/material.dart';
import 'package:recepies/screens/categories_screen.dart';
import 'package:recepies/screens/category_page.dart';
import '../models/category.dart';
class CategoryItem extends StatelessWidget {

  final Category category;
  const CategoryItem({Key? key, required this.category}) : super(key: key);
  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      Categories.routeName,
      arguments: {
        'id': category.id,
        'title':category.title
      }
    );

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16.0),
      onTap: () { selectCategory(context);},
      child: Container(
        padding: const EdgeInsets.all(4),
        child: Text(category.title,style: Theme.of(context).textTheme.headlineMedium,),
        decoration: BoxDecoration(
            gradient:LinearGradient(
              colors: [category.color.withOpacity(0.6), category.color],
              begin:Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
            borderRadius: BorderRadius.circular(16.0)),
      ),
    );
  }
}
