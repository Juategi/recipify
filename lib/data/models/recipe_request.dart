class RecipeRequest {
  String id;
  String title;
  String subtitle;
  String creatorName;
  double rating;
  String thumbnail;
  int calories;
  String preparationDetails;
  List<AllergenRequest> allergens;
  List<MacroRequest> macros;
  List<IngredientRequest> ingredients;
  RecipeRequest({
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

  static RecipeRequest fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> macros = json['macros'];

    return RecipeRequest(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      creatorName: json['creator_name'],
      rating: json['rating'].toDouble(),
      thumbnail: json['thumbnail'],
      calories: json['calories'],
      preparationDetails: json['preparation_details'],
      allergens: (json['allergens'] as List<dynamic>)
          .map((e) => AllergenRequest(name: e as String))
          .toList(),
      macros: macros.keys
          .map((key) => MacroRequest(name: key, value: macros[key].toDouble()))
          .toList(),
      ingredients: (json['ingredients'] as List)
          .map((e) => IngredientRequest.fromJson(e))
          .toList(),
    );
  }
}

class AllergenRequest {
  String name;
  AllergenRequest({
    required this.name,
  });
}

class MacroRequest {
  String name;
  double value;
  MacroRequest({
    required this.name,
    required this.value,
  });
}

class IngredientRequest {
  String name;
  String amount;
  IngredientRequest({
    required this.name,
    required this.amount,
  });

  static IngredientRequest fromJson(Map<String, dynamic> json) {
    return IngredientRequest(
      name: json['name'],
      amount: json['amount'],
    );
  }
}
