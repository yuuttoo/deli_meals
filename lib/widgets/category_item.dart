import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {//換頁
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
    arguments: {
      'id': id,
      'title': title,
      });     
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(//Inkwell 會回來的gesturedector
            onTap: () => selectCategory(context),
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
          child: Container(
        padding: const EdgeInsets.all(15),//加上const不會每次都重新rerun
        child: Text(
          title, 
          style: Theme.of(context).textTheme.title,
          ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
        ),
    );
  }
}