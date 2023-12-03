import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/favorite_provider.dart';

class MealDetail extends ConsumerWidget {
  const MealDetail({super.key, required this.meal});
final Meal meal;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final List<Meal> favoritemeal= ref.watch(favoritemealprovider);
    final bool isfav=favoritemeal.contains(meal);
    return  Scaffold(
      appBar: AppBar(title:Text(meal.title,) ,
      actions: [
        IconButton(onPressed: (){
       final wasAdded = ref.read(favoritemealprovider.notifier).toggleMealFav(meal);
        ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:Text (
      wasAdded?'meal has added from favorite'
      :'meal has deleted from favorite'
      ),
      ),
    );
        },
         icon: AnimatedSwitcher(
           duration: const Duration(seconds: 1),
transitionBuilder: (child, animation) {
  return RotationTransition(
    turns: Tween<double>(
      begin: 0.8,
      end: 1,
    ).animate(animation),
  child: child,
  );
},

          child: Icon(isfav?Icons.star:Icons.star_border,
           color: Colors.amber,
         key: ValueKey(isfav),
          ),
          ),
         ),
      ],
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                ),
            ),
            const  SizedBox(height: 14,),
            Text('ingredients',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
            ),
             const  SizedBox(height: 14,),
             for(final ingr in meal.ingredients)
             Text(ingr,
             style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
             ),
               const  SizedBox(height: 14,),

              Text('Steps',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
            ),
  const  SizedBox(height: 14,),
  
             for(final step in meal.steps)
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
               child: Text(step,
               style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                         ),
                         textAlign: TextAlign.center,
               ),
             ),
          ],
        ),
      ) ,
    );
  }
}