import 'package:flutter/material.dart';
import 'package:recepies/screens/tabs_screen.dart';
import './settings.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  Widget _buildListTile(BuildContext context,String text, IconData icon, Function() func){
   return Container(
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(17),color: Colors.teal),

      width:300,
      child: FlatButton(onPressed: func, child: Row(
        children: [
          Icon(icon,color: Colors.black45,),
          Text(text ,style: Theme.of(context).textTheme.headlineSmall,),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Container(
          color: Colors.white70,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
            color: Colors.pinkAccent,
            width: double.infinity,
            height: 100,
            child: Text(" \nCooking Up!",style: Theme.of(context).textTheme.headlineLarge,),
          ),
          SizedBox(height: 10,),
           _buildListTile(context," Recepies",Icons.restaurant,(){Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);}),
          SizedBox(height: 10,),
          _buildListTile(context, " Settings", Icons.settings, (){Navigator.of(context).pushReplacementNamed(Settings.routeName);})
          ],

      ),
      ),
    );

  }
}
