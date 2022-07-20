import 'package:flutter/material.dart';
import 'package:recepies/screens/drawer.dart';

 class Settings extends StatefulWidget {
  final Function(Map<String, bool>) saveFilters;
  Map<String,bool> filters;
  Settings( @required this.filters,@required this.saveFilters) ;
  static final routeName = 'settings';

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _glutenFree=false;
  bool _lactoseFree=false;
  bool _vegeterian=false;
  bool _vegan=false;
  @override
   initState(){
      _glutenFree=widget.filters["gluten-free"]!;
      _lactoseFree=widget.filters["lactose-free"]!;
      _vegeterian=widget.filters["vegeterian"]!;
      _vegan=widget.filters["vegan"]!;
      super.initState();
   }
  Widget  _buildSwitchTile(String title, String description, bool currentValue,Function updateValue ){
    return SwitchListTile(
      value: currentValue,
      onChanged: (value){ setState((){updateValue(value);});},
      title: Text(title,style: Theme.of(context).textTheme.headlineSmall,),
      subtitle: Text(description,style: Theme.of(context).textTheme.displayMedium,),
    );
  }
 Map<String, bool> get newFilters{
    return {
      'gluten-free':_glutenFree,
      'lactose-free':_lactoseFree,
      'vegeterian':_vegeterian,
      'vegan':_vegan,
    };
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings",style: Theme.of(context).textTheme.headlineMedium,),actions: [IconButton(onPressed: (){widget.saveFilters({
        'gluten-free':_glutenFree,
        'lactose-free':_lactoseFree,
        'vegeterian':_vegeterian,
        'vegan':_vegan,
      }
        );}, icon: Icon(Icons.save))],),

      body:Container(child:Column(
        children: [
          Text("Adjust your Recepies",style: Theme.of(context).textTheme.headlineSmall,),
          _buildSwitchTile("Gluten Free", "Include only gluten free meals", _glutenFree, (value) {_glutenFree=value;}),
          _buildSwitchTile("Lactose Free", "Include only lactose free meals", _lactoseFree, (value) {_lactoseFree=value;}),
          _buildSwitchTile("Vegeterian Free", "Include only Vegeterian meals", _vegeterian, (value) {_vegeterian=value;}),
          _buildSwitchTile("Vegan Free", "Include only Vegan meals", _vegan, (value) {_vegan=value;}),

        ],
      )),
      drawer: DrawerWidget(),
    );

  }
}
