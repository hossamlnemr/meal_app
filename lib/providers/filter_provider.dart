import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'meals_provider.dart';
enum Filter{
  gulten,
  lactoes,
  vegan,
  vegetarian,
  }
class FilterMealsNotifier extends StateNotifier<Map<Filter,bool>>{
  FilterMealsNotifier():super({
     Filter.gulten:false,
    Filter.lactoes:false,
    Filter.vegan:false,
    Filter.vegetarian:false,
  });
  void setFilters(Map<Filter,bool> chosenfilter){
state=chosenfilter;
 }
void setFilter(Filter filter,bool isactive){
state={...state,filter:isactive};
 }


}

final filterprovider=StateNotifierProvider<FilterMealsNotifier,Map<Filter,bool>>((ref) => FilterMealsNotifier());


final filtermealprovider =Provider((ref){
final meals= ref.watch(mealprovider);
       final Map<Filter, bool> activfilters=ref.watch(filterprovider);

 return   meals.where((meal){
  if(activfilters[Filter.gulten]! && !meal.isGlutenFree){
    return false;
  }
   if(activfilters[Filter.lactoes]! && !meal.isLactoseFree){
    return false;
  } 
  if(activfilters[Filter.vegan]! && !meal.isVegan){
    return false;
  }
   if(activfilters[Filter.vegetarian]! && !meal.isVegetarian){
    return false;
  }
  return true;
    }).toList();
    });






