import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recepies/dummy_data.dart';

import './screens/categories_screen.dart';
import './screens/category_page.dart';
import './screens/recepie_page.dart';
import './screens/settings.dart';
import './screens/tabs_screen.dart';

import 'models/meal.dart';

 void main(){
   runApp(MyApp());
            }

 class MyApp extends StatefulWidget{
   const MyApp();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

     Map<String,bool> filters={
     'gluten-free':false,
     'lactose-free':false,
     'vegeterian':false,
     'vegan':false,
   };
     List <Meal> availableMeals=DUMMY_MEALS;
     List <Meal> favouriteMeal=[];
     void setFilters(Map<String, bool> newFilters){
       setState((){
       filters=newFilters;
       availableMeals=DUMMY_MEALS.where((meal){
         return (!filters["gluten-free"]! || meal.isGlutenFree)
              &&(!filters["lactose-free"]! || meal.isLactoseFree)
              &&(!filters["vegeterian"]! || meal.isVegetarian)
              &&(!filters["vegan"]! || meal.isVegan);
       }).toList();
       });

 }
     void toggleFavourite(Meal selectedMeal){
       final index =favouriteMeal.indexWhere((meal) => meal.id==selectedMeal.id);
       setState((){
         if(index>=0)
           favouriteMeal.removeAt(index);
         else
           favouriteMeal.add(selectedMeal);
       });
     }

     bool isFavourite(String id){
       return favouriteMeal.any((meal) => meal.id==id);
     }
   Widget build(BuildContext context){
     return MaterialApp(
       theme: ThemeData(
         primarySwatch: Colors.pink,
         accentColor: Colors.teal,
         textTheme: ThemeData.light().textTheme.copyWith(
           headlineSmall:GoogleFonts.indieFlower(textStyle:TextStyle(fontSize: 20,color: Color.fromRGBO(30, 30, 30, 0.8),fontWeight: FontWeight.w600)),
           headlineMedium:GoogleFonts.indieFlower(textStyle:TextStyle(fontSize: 25, color: Colors.white)),
           headlineLarge:GoogleFonts.indieFlower(textStyle:TextStyle(fontSize: 27,color: Colors.white,fontWeight: FontWeight.w400)),
           displaySmall: GoogleFonts.indieFlower(textStyle:TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w300)),
           displayMedium: GoogleFonts.indieFlower(textStyle:TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w400)),
         ),
           appBarTheme: ThemeData.light().appBarTheme.copyWith(
           )
       ),
      // home: HomePage(),
       initialRoute: '/',
       routes: {
         '/': (ctx)=> TabsScreen(favouriteMeal),
         '/category-page': (ctx) => CategoryPage(availableMeals),
         '/category-page/recepie-page':(ctx) => RecepiePage(isFavourite,toggleFavourite),
         'settings': (ctx)=> Settings(filters,setFilters),
       },
     );
   }
}


    /**/