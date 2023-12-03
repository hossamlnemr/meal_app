// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import '../models/meal.dart';
import '../widgets/cate_grid_item.dart';

class catescreen extends StatefulWidget {
  const catescreen({super.key,  required this.avilableMales});
final List<Meal> avilableMales;

  @override
  State<catescreen> createState() => _catescreenState();
}

class _catescreenState extends State<catescreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
@override
void initState() {
    super.initState();
    _controller=AnimationController(
      vsync: this,
    duration:const Duration(seconds: 1),
    lowerBound: 0,
    upperBound: 1,

    );
    _controller.forward();

  }

@override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      // ignore: sort_child_properties_last
      child:  GridView(gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3/2,
        
      ),
      children: [
       for(final category in availableCategories)
        CategoryGridItem(category: category, avilableMales:widget.avilableMales,)
      ],
      ),
       builder: ((ctx, child) => SlideTransition(position:
        Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOutExpo)),
       
       child: child,
       )
       
        ),
      );
  }
}