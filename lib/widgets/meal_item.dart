// ignore_for_file: constant_pattern_never_matches_value_type, dead_code

import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.selectedit});
final Meal meal;
String get comtext{
switch(meal.complexity){
  case Complexity.simple: return 'Simple';
  case Complexity.challenging: return 'Challenging';break;
  case Complexity.hard: return 'Hard';break;
  default: return 'UnKnown';break;
}
}
String get affortext{
switch(meal.affordability){
  case Affordability.affordable: return 'Affordable';
  case Affordability.pricey: return 'Pricey';break;
  case Affordability.luxurious: return 'Luxurious';break;
  default: return 'UnKnown';break;


}}
  
final Function (Meal meal) selectedit ;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: InkWell(
        onTap: () => selectedit(meal),
        child:Stack(
          children: [
            Hero
            (
              
              tag: meal.id,
              child: FadeInImage(placeholder: MemoryImage(kTransparentImage),
             image:NetworkImage(meal.imageUrl))),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding:const EdgeInsets.symmetric(vertical: 6,horizontal: 44),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(meal.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style:const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    const SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       Row(
                        children: [
                        const  Icon(Icons.schedule),
                         const SizedBox(width: 8,),
                          Text(meal.duration.toString(),style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),),

                          const Text(' min',style:  TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),)
                        ],
                       ),
                        Row(
                        children: [
                        const  Icon(Icons.work),
                         const SizedBox(width: 8,),
                          Text(comtext,style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),),
                        ],
                       ),
                        Row(
                        children: [
                        const  Icon(Icons.attach_money),
                         const SizedBox(width: 8,),
                          Text(affortext,style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),),
                        ],
                       ),
                      ],
                    )
                  ],
                )),
            )
          ],
        ) ,
      ),
    );
  }
}
