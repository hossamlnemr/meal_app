import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectscreen});
 
 final void Function(String identifier) onSelectscreen;
  @override
  Widget build(BuildContext context) {
    return   Drawer(
      child: Column(
        children: [
          DrawerHeader(
           padding:const EdgeInsets.all(20), 
           decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
            ]),
           ),
            child: Row(
            children: [
              Icon(Icons.fastfood,
              color:Theme.of(context).colorScheme.primary ,
              size: 48,
              ),
              const SizedBox(width: 18,),
              Text('Cooking Up ..',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary
              ),
              ),
            ],
          ),
          ),
          ListTile(
            onTap: (){
              onSelectscreen('meals');
              },
            leading: Icon(
              Icons.restaurant,
              color:Theme.of(context).colorScheme.onBackground ,
              ),
            title: Text('Meals',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary
                ),
                ),
          ),
          ListTile(
            onTap: (){
              onSelectscreen('filters');
              },
            leading: Icon(
              Icons.settings,
              color:Theme.of(context).colorScheme.onBackground ,
              ),
            title: Text('Filters',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary
                ),
                ),
          ),

        ],
      ),
    );
  }
}