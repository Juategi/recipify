import 'package:recipy/data/models/recipe_request.dart';
import 'package:recipy/domain/entities/allergen.dart';
import 'package:recipy/domain/entities/ingredient.dart';
import 'package:recipy/domain/entities/macro.dart';

import '../../domain/entities/recipe.dart';

class RecipeMapper {
  static Recipe fromRequest(RecipeRequest recipeRequest) {
    return Recipe(
      id: recipeRequest.id,
      title: recipeRequest.title,
      subtitle: recipeRequest.subtitle,
      creatorName: recipeRequest.creatorName,
      rating: recipeRequest.rating,
      thumbnail: recipeRequest.thumbnail,
      calories: recipeRequest.calories,
      preparationDetails: recipeRequest.preparationDetails,
      allergens: recipeRequest.allergens
          .map((allergen) => Allergen(name: allergen.name))
          .toList(),
      macros: recipeRequest.macros
          .map((macro) => Macro(name: macro.name, value: macro.value))
          .toList(),
      ingredients: recipeRequest.ingredients
          .map((ingredient) =>
              Ingredient(name: ingredient.name, amount: ingredient.amount))
          .toList(),
    );
  }
}
