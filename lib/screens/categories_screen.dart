import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../templates/category_item.dart';
import '../models/category.dart';
class Categories extends StatelessWidget {
  static const routeName='/category-page';
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
       GridView(

        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 15,
            crossAxisSpacing: 13,
            childAspectRatio: 3/2
        ),
        children: DUMMY_CATEGORIES.map((ctg) {
           return CategoryItem(category: ctg);
        }).toList(),

      );
  }
}
