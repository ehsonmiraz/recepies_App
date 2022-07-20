import 'package:flutter/material.dart';
import 'package:recepies/screens/categories_screen.dart';
import 'package:recepies/screens/drawer.dart';
import 'package:recepies/screens/favourites.dart';

class TabsScreen extends StatefulWidget{
  static final routeName = '/';
  final favouriteMeals;
  TabsScreen(this.favouriteMeals);
  State<TabsScreen> createState() => _TabsScreenState() ;

}

class _TabsScreenState extends State<TabsScreen>{
  initState(){
    _pageIndex=0;
    _pages =[
      {'page':Categories(), 'title': 'Categories'},
      {'page':Favourites(widget.favouriteMeals), 'title': 'Favourites'},
    ];
  }

  List<Map<String, Object>> _pages=[];
  int _pageIndex=0;

  void _selectPage(int index){
    setState((){_pageIndex=index;});
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
          appBar: AppBar(title: Text(_pages[_pageIndex]['title'] as String,style: Theme.of(context).textTheme.headlineMedium,),
          ),
          drawer:  DrawerWidget(),

          body: _pages[_pageIndex]['page'] as Widget,
          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            currentIndex: _pageIndex,
            selectedItemColor: Theme.of(context).accentColor,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.category),label: "Category"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite,),label: "Favourites"),

            ],
          ),
    );
  }
}


