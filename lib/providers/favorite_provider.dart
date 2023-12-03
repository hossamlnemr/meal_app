import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifier():super([]);
bool toggleMealFav(Meal meal){
final isExisting=state.contains(meal);

if (isExisting){
  
   // state.remove(meal);
 state=state.where((element) => element.id != meal.id).toList();
//_showmessage('meal has deleted from favorite');
return false;
  
}
  else{
   state=[...state,meal];
      //state.add(meal);
  return true;
//_showmessage('meal has added to favorite');
  }
 }


}

final favoritemealprovider=StateNotifierProvider<FavoriteMealsNotifier,List<Meal>>((ref) {
  return FavoriteMealsNotifier()  ;
});