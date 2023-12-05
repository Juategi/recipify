import 'dart:convert';
import 'models/recipe_request.dart';
import 'package:http/http.dart' as http;

class RecipesService {
  final String baseUrl = '127.0.0.1:3002';

  Future<List<RecipeRequest>> getRecipes() async {
    var url = Uri.http(baseUrl, '/recipes');
    try {
      var response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception('Error getting recipes: ${response.statusCode}');
      }
      return (jsonDecode(response.body) as List<dynamic>)
          .map((e) => RecipeRequest.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception('Error getting recipes: $e');
    }
  }

  Future<RecipeRequest> getRecipe(String id) async {
    var url = Uri.http(baseUrl, '/recipes/$id');
    try {
      var response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception('Error getting recipe: ${response.statusCode}');
      }
      return RecipeRequest.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Exception('Error getting recipe: $e');
    }
  }
}

/*
  Response examples:
      //var recipes ='[{"id":"1","title":"Ensalada Mediterránea","subtitle":"Una fresca y nutritiva opción","creator_name":"Chef García","rating":4.5,"thumbnail":"https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","calories":250,"ingredients":[{"name":"Lechuga","amount":"2 tazas"},{"name":"Tomates cherry","amount":"1 taza"},{"name":"Queso feta","amount":"50g"},{"name":"Aceitunas negras","amount":"1/4 taza"},{"name":"Cebolla roja","amount":"1/4 taza"},{"name":"Vinagreta balsámica","amount":"2 cucharadas"}],"preparation_details":"Comenzar lavando y cortando la lechuga...","macros":{"protein":7,"carbs":18,"fats":16},"allergens":["Lácteos","Aceitunas"]},{"id":"2","title":"Smoothie de Frutas Tropicales","subtitle":"Perfecto para un día de verano","creator_name":"Chef Martínez","rating":4,"thumbnail":"https://images.unsplash.com/photo-1467453678174-768ec283a940?q=80&w=1688&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","calories":150,"ingredients":[{"name":"Fresas","amount":"1 taza"},{"name":"Mango","amount":"1/2 taza"},{"name":"Yogur natural","amount":"1 taza"},{"name":"Miel","amount":"1 cucharada"},{"name":"Hielo","amount":"1 taza"}],"preparation_details":"Mezclar en la licuadora las fresas y el mango...","macros":{"protein":4,"carbs":25,"fats":2},"allergens":["Frutas","Lácteos"]},{"id":"3","title":"Tacos de Pollo al Estilo Mexicano","subtitle":"Una deliciosa mezcla de sabores tradicionales","creator_name":"Chef López","rating":4.8,"thumbnail":"https://images.unsplash.com/photo-1525059696034-4967a8e1dca2?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","calories":350,"ingredients":[{"name":"Pechuga de pollo","amount":"200g"},{"name":"Tortillas de maíz","amount":"3 unidades"},{"name":"Cilantro","amount":"1 puñado"},{"name":"Cebolla","amount":"1/4 taza"},{"name":"Salsa verde","amount":"al gusto"}],"preparation_details":"Cocinar el pollo y desmenuzarlo...","macros":{"protein":25,"carbs":22,"fats":15},"allergens":["Pollo","Maíz"]},{"id":"4","title":"Salmón al Horno con Hierbas","subtitle":"Ligero y lleno de omega 3","creator_name":"Chef Martina","rating":4.7,"thumbnail":"https://images.unsplash.com/photo-1543339308-43e59d6b73a6","calories":475,"ingredients":[{"name":"Filete de salmón","amount":"200g"},{"name":"Romero fresco","amount":"1 rama"},{"name":"Tomillo","amount":"1 rama"},{"name":"Papas pequeñas","amount":"5 unidades"},{"name":"Aceite de oliva","amount":"2 cucharadas"}],"preparation_details":"Marinar el salmón con hierbas y hornear...","macros":{"protein":30,"carbs":20,"fats":25},"allergens":["Salmón"]},{"id":"5","title":"Risotto de Champiñones","subtitle":"Un clásico italiano cremoso","creator_name":"Chef Giorgio","rating":4.5,"thumbnail":"https://images.unsplash.com/photo-1551218808-94e220e084d2","calories":420,"ingredients":[{"name":"Arroz arborio","amount":"1 taza"},{"name":"Champiñones","amount":"200g"},{"name":"Caldo de vegetales","amount":"2 tazas"},{"name":"Queso parmesano","amount":"50g"},{"name":"Mantequilla","amount":"1 cucharada"}],"preparation_details":"Cocinar el arroz lentamente añadiendo caldo...","macros":{"protein":10,"carbs":50,"fats":20},"allergens":["Lácteos","Gluten"]},{"id":"6","title":"Curry de Garbanzos","subtitle":"Sabroso y nutritivo plato vegano","creator_name":"Chef Anjali","rating":4.6,"thumbnail":"https://images.unsplash.com/photo-1585937421612-70a008356fbe","calories":380,"ingredients":[{"name":"Garbanzos cocidos","amount":"1 taza"},{"name":"Leche de coco","amount":"1 taza"},{"name":"Curry en polvo","amount":"1 cucharada"},{"name":"Tomate","amount":"1 unidad"},{"name":"Espinacas","amount":"1 taza"}],"preparation_details":"Sofreír las especias y cocinar con garbanzos...","macros":{"protein":15,"carbs":40,"fats":10},"allergens":["Coco"]}]';
      //var recipe = '{"id":"1","title":"Ensalada Mediterránea","subtitle":"Una fresca y nutritiva opción","creator_name":"Chef García","rating":4.5,"thumbnail":"https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","calories":250,"ingredients":[{"name":"Lechuga","amount":"2 tazas"},{"name":"Tomates cherry","amount":"1 taza"},{"name":"Queso feta","amount":"50g"},{"name":"Aceitunas negras","amount":"1/4 taza"},{"name":"Cebolla roja","amount":"1/4 taza"},{"name":"Vinagreta balsámica","amount":"2 cucharadas"}],"preparation_details":"Comenzar lavando y cortando la lechuga...","macros":{"protein":7,"carbs":18,"fats":16},"allergens":["Lácteos","Aceitunas"]} ';
*/