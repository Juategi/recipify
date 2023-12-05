import 'package:recipy/domain/entities/allergen.dart';
import 'package:recipy/domain/entities/ingredient.dart';
import 'package:recipy/domain/entities/macro.dart';

class Recipe {
  String id;
  String title;
  String subtitle;
  String creatorName;
  double rating;
  String thumbnail;
  int calories;
  String preparationDetails;
  List<Allergen> allergens;
  List<Macro> macros;
  List<Ingredient> ingredients;
  Recipe({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.creatorName,
    required this.rating,
    required this.thumbnail,
    required this.calories,
    required this.preparationDetails,
    required this.allergens,
    required this.macros,
    required this.ingredients,
  });
}
