import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key,  this.title,required this.meals, });
  final String? title;
  final List <Meal> meals;
  @override
  Widget build(BuildContext context) {
    
    return title==null?conten(context)
    : Scaffold(
      appBar: AppBar(title: Text(title!),),
      body: conten(context) ,
    );
  }

  SingleChildScrollView conten(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: 
          meals.map((meal) => MealItem(meal: meal,selectedit: (Meal meal) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx)=>MealDetail(meal: meal)
                ));
            
          },)).toList(),
      ),
    );
  }
}