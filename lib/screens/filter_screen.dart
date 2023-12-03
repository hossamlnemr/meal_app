// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filter_provider.dart';
// import 'package:meal_app/screens/tabs_screen.dart';

// import '../widgets/main_drawr.dart';

class FilterScreens extends ConsumerWidget {
  const FilterScreens({super.key,});


 
  
 
  @override
  Widget build(BuildContext context,WidgetRef ref) {
   final Map<Filter, bool> activfilters=ref.watch(filterprovider);
    return  Scaffold(
      appBar: AppBar(
        title: const Text('your filters'),
      ),
//        drawer: MainDrawer(onSelectscreen: (identifier){
//           Navigator.of(context).pop();
//         if (identifier=='meals'){
//   Navigator.pushReplacement(context, MaterialPageRoute(
//     builder: (ctx)=>const TapsScreen()),
//     );
// }

//        },

//       ),
      body: Column(
          children: [
             customfilter(
              context,
             'Gulten-free',
             'only include gulten-free meals',
               (bool value) {
                ref.read(filterprovider.notifier).setFilter(Filter.gulten, value);
                   },
                   activfilters[Filter.gulten]!
             ),
              customfilter(
              context,
             'lactoes-free',
             'only include lactoes-free meals',
               (bool value) {
                 ref.read(filterprovider.notifier).setFilter(Filter.lactoes, value);
                   },
                     activfilters[Filter.lactoes]!
             ),
             customfilter(
              context,
             'vegan',
             'only include vegan meals',
               (bool value) {
                 ref.read(filterprovider.notifier).setFilter(Filter.vegan, value);
                   },
                     activfilters[Filter.vegan]!
             ),
             customfilter(
              context,
             'vegetarian',
             'only include vegetarian meals',
               (bool value) {
                  ref.read(filterprovider.notifier).setFilter(Filter.vegetarian, value);
                   },
                     activfilters[Filter.vegetarian]!
             ),
          ],
        ),
      ) ;
    
  }

  SwitchListTile customfilter(BuildContext context,String title,String subtitle,Function(bool newval)onchange,bool filter) {
    return SwitchListTile(
         activeColor: Theme.of(context).colorScheme.tertiary,
         contentPadding: const EdgeInsets.only(right: 34,left: 22),
          title: Text(title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              ),
              ),
                subtitle: Text(subtitle,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              ),
              ),
               value: filter,
               onChanged: onchange,
                 
              
        );
  }
}