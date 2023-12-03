import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/favorite_provider.dart';
import 'package:meal_app/screens/cates_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/main_drawr.dart';

import '../providers/filter_provider.dart';
import 'filter_screen.dart';


class TapsScreen extends ConsumerStatefulWidget {
  const TapsScreen({super.key});

  @override
  ConsumerState<TapsScreen> createState() => _TapsScreenState();
}

class _TapsScreenState extends ConsumerState<TapsScreen> {
  int _selectedPageIndex=0;


void _setScreen(String identifier){
    Navigator.of(context).pop();

if (identifier=='filters'){
  Navigator.push(context, MaterialPageRoute(
    builder: (ctx)=> const FilterScreens(
    )),
    );
}

}

 


  void _selecPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }

  
  @override
  Widget build(BuildContext context) {
   final avilableMales=ref.watch(filtermealprovider);
   
    Widget activePage= catescreen( avilableMales:avilableMales,);
    var activePageTitle='pick your catogery';

    if(_selectedPageIndex==1){
      final List<Meal> favoriteMeal=ref.watch(favoritemealprovider);
      activePage= MealsScreen(
        meals:favoriteMeal,
       );
      activePageTitle= 'Favorites';
    }

    return  Scaffold(
      appBar: AppBar(title:  Text(activePageTitle),),
      body:  activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selecPage,
        currentIndex: _selectedPageIndex,
        items: const [
      BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: 'Categories'),
      BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Favorites')
      ]),
      drawer: MainDrawer(onSelectscreen: _setScreen,

      ),
    );
  }
}