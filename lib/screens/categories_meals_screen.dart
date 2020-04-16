import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';


class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;
  

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadInitData = false;
  
  @override

  void initState() {
  //...
    super.initState();
  }
  @override
  void didChangeDependencies() {//放在initState()會太早出現 導致error 所以改放到這裡
    if(!_loadInitData) {
       final routeArgs = 
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _loadInitData = true;
    }
    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     displayedMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

 
  Widget build(BuildContext context) {
    
  
    return Scaffold( 
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
      body: ListView.builder(itemBuilder: (ctx, index) {
        return MealItem(
          id: displayedMeals[index].id,
          title: displayedMeals[index].title, 
          imageUrl: displayedMeals[index].imageUrl, 
          duration: displayedMeals[index].duration, 
          complexity: displayedMeals[index].complexity, 
          affordability: displayedMeals[index].affordability,
          //removeItem: _removeMeal,
        );
      }, 
      itemCount: displayedMeals.length,
      ),
    );
  }
}