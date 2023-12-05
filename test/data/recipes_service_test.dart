import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipy/data/http_client.dart';
import 'package:recipy/data/models/recipe_request.dart';
import 'package:recipy/data/services/recipes_service.dart';

import 'recipes_service_test.mocks.dart';

@GenerateMocks([HttpClient])
void main() {
  late RecipesService recipesService;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    recipesService = RecipesService(httpClient: mockHttpClient);
  });

  group('getRecipes', () {
    test('should return a list of RecipeRequest', () async {
      // Arrange
      const mockResponse =
          '[{"id":"1","title":"Ensalada Mediterránea","subtitle":"Una fresca y nutritiva opción","creator_name":"Chef García","rating":4.5,"thumbnail":"https://images","calories":250,"ingredients":[{"name":"Lechuga","amount":"2 tazas"},{"name":"Tomates cherry","amount":"1 taza"},{"name":"Queso feta","amount":"50g"},{"name":"Aceitunas negras","amount":"1/4 taza"},{"name":"Cebolla roja","amount":"1/4 taza"},{"name":"Vinagreta balsámica","amount":"2 cucharadas"}],"preparation_details":"Comenzar lavando y cortando la lechuga...","macros":{"protein":7,"carbs":18,"fats":16},"allergens":["Lácteos","Aceitunas"]},{"id":"2","title":"Smoothie de Frutas Tropicales","subtitle":"Perfecto para un día de verano","creator_name":"Chef Martínez","rating":4,"thumbnail":"https://images","calories":150,"ingredients":[{"name":"Fresas","amount":"1 taza"},{"name":"Mango","amount":"1/2 taza"},{"name":"Yogur natural","amount":"1 taza"},{"name":"Miel","amount":"1 cucharada"},{"name":"Hielo","amount":"1 taza"}],"preparation_details":"Mezclar en la licuadora las fresas y el mango...","macros":{"protein":4,"carbs":25,"fats":2},"allergens":["Frutas","Lácteos"]},{"id":"3","title":"Tacos de Pollo al Estilo Mexicano","subtitle":"Una deliciosa mezcla de sabores tradicionales","creator_name":"Chef López","rating":4.8,"thumbnail":"https://images","calories":350,"ingredients":[{"name":"Pechuga de pollo","amount":"200g"},{"name":"Tortillas de maíz","amount":"3 unidades"},{"name":"Cilantro","amount":"1 puñado"},{"name":"Cebolla","amount":"1/4 taza"},{"name":"Salsa verde","amount":"al gusto"}],"preparation_details":"Cocinar el pollo y desmenuzarlo...","macros":{"protein":25,"carbs":22,"fats":15},"allergens":["Pollo","Maíz"]},{"id":"4","title":"Salmón al Horno con Hierbas","subtitle":"Ligero y lleno de omega 3","creator_name":"Chef Martina","rating":4.7,"thumbnail":"https://images","calories":475,"ingredients":[{"name":"Filete de salmón","amount":"200g"},{"name":"Romero fresco","amount":"1 rama"},{"name":"Tomillo","amount":"1 rama"},{"name":"Papas pequeñas","amount":"5 unidades"},{"name":"Aceite de oliva","amount":"2 cucharadas"}],"preparation_details":"Marinar el salmón con hierbas y hornear...","macros":{"protein":30,"carbs":20,"fats":25},"allergens":["Salmón"]},{"id":"5","title":"Risotto de Champiñones","subtitle":"Un clásico italiano cremoso","creator_name":"Chef Giorgio","rating":4.5,"thumbnail":"https://images","calories":420,"ingredients":[{"name":"Arroz arborio","amount":"1 taza"},{"name":"Champiñones","amount":"200g"},{"name":"Caldo de vegetales","amount":"2 tazas"},{"name":"Queso parmesano","amount":"50g"},{"name":"Mantequilla","amount":"1 cucharada"}],"preparation_details":"Cocinar el arroz lentamente añadiendo caldo...","macros":{"protein":10,"carbs":50,"fats":20},"allergens":["Lácteos","Gluten"]},{"id":"6","title":"Curry de Garbanzos","subtitle":"Sabroso y nutritivo plato vegano","creator_name":"Chef Anjali","rating":4.6,"thumbnail":"https://images","calories":380,"ingredients":[{"name":"Garbanzos cocidos","amount":"1 taza"},{"name":"Leche de coco","amount":"1 taza"},{"name":"Curry en polvo","amount":"1 cucharada"},{"name":"Tomate","amount":"1 unidad"},{"name":"Espinacas","amount":"1 taza"}],"preparation_details":"Sofreír las especias y cocinar con garbanzos...","macros":{"protein":15,"carbs":40,"fats":10},"allergens":["Coco"]}]';
      when(mockHttpClient.get(
              endpoint: '/recipes', errorText: "Error getting recipes"))
          .thenAnswer((_) async => mockResponse);

      // Act
      final result = await recipesService.getRecipes();

      // Assert
      expect(result, isA<List<RecipeRequest>>());
      expect(result.length, 6);
      expect(result[0].id, '1');
      expect(result[0].title, 'Ensalada Mediterránea');
      expect(result[0].subtitle, 'Una fresca y nutritiva opción');
      expect(result[0].creatorName, 'Chef García');
      expect(result[0].rating, 4.5);
      expect(result[0].thumbnail, 'https://images');
      expect(result[0].calories, 250);
      expect(result[0].preparationDetails,
          'Comenzar lavando y cortando la lechuga...');
      expect(result[0].macros.length, 3);
      expect(result[0].macros[0].name, 'protein');
      expect(result[0].macros[0].value, 7);
      expect(result[0].macros[1].name, 'carbs');
      expect(result[0].macros[1].value, 18);
      expect(result[0].macros[2].name, 'fats');
      expect(result[0].macros[2].value, 16);
      expect(result[0].allergens.length, 2);
      expect(result[0].allergens[0].name, 'Lácteos');
      expect(result[0].allergens[1].name, 'Aceitunas');
      expect(result[0].ingredients.length, 6);
      expect(result[0].ingredients[0].name, 'Lechuga');
      expect(result[0].ingredients[0].amount, '2 tazas');
      expect(result[0].ingredients[1].name, 'Tomates cherry');
      expect(result[0].ingredients[1].amount, '1 taza');
      expect(result[0].ingredients[2].name, 'Queso feta');
      expect(result[0].ingredients[2].amount, '50g');
      expect(result[0].ingredients[3].name, 'Aceitunas negras');
      expect(result[0].ingredients[3].amount, '1/4 taza');
      expect(result[0].ingredients[4].name, 'Cebolla roja');
      expect(result[0].ingredients[4].amount, '1/4 taza');
      expect(result[0].ingredients[5].name, 'Vinagreta balsámica');
      expect(result[0].ingredients[5].amount, '2 cucharadas');
    });

    test('should throw an exception if an error occurs', () async {
      // Arrange
      when(mockHttpClient.get(
              endpoint: '/recipes', errorText: "Error getting recipes"))
          .thenThrow(Exception('Error getting recipes'));

      // Act
      final call = recipesService.getRecipes;

      // Assert
      expect(call(), throwsException);
    });
  });

  group('getRecipe', () {
    test('should return a RecipeRequest', () async {
      // Arrange
      const mockResponse =
          '{"id":"1","title":"Ensalada Mediterránea","subtitle":"Una fresca y nutritiva opción","creator_name":"Chef García","rating":4.5,"thumbnail":"https://images","calories":250,"ingredients":[{"name":"Lechuga","amount":"2 tazas"},{"name":"Tomates cherry","amount":"1 taza"},{"name":"Queso feta","amount":"50g"},{"name":"Aceitunas negras","amount":"1/4 taza"},{"name":"Cebolla roja","amount":"1/4 taza"},{"name":"Vinagreta balsámica","amount":"2 cucharadas"}],"preparation_details":"Comenzar lavando y cortando la lechuga...","macros":{"protein":7,"carbs":18,"fats":16},"allergens":["Lácteos","Aceitunas"]} ';
      when(mockHttpClient.get(
              endpoint: '/recipes/1', errorText: "Error getting recipe"))
          .thenAnswer((_) async => mockResponse);

      // Act
      final result = await recipesService.getRecipe('1');

      // Assert
      expect(result, isA<RecipeRequest>());
      expect(result.id, '1');
      expect(result.title, 'Ensalada Mediterránea');
      expect(result.subtitle, 'Una fresca y nutritiva opción');
      expect(result.creatorName, 'Chef García');
      expect(result.rating, 4.5);
      expect(result.thumbnail, 'https://images');
      expect(result.calories, 250);
      expect(result.preparationDetails,
          'Comenzar lavando y cortando la lechuga...');
      expect(result.macros.length, 3);
      expect(result.macros[0].name, 'protein');
      expect(result.macros[0].value, 7);
      expect(result.macros[1].name, 'carbs');
      expect(result.macros[1].value, 18);
      expect(result.macros[2].name, 'fats');
      expect(result.macros[2].value, 16);
      expect(result.allergens.length, 2);
      expect(result.allergens[0].name, 'Lácteos');
      expect(result.allergens[1].name, 'Aceitunas');
      expect(result.ingredients.length, 6);
      expect(result.ingredients[0].name, 'Lechuga');
      expect(result.ingredients[0].amount, '2 tazas');
      expect(result.ingredients[1].name, 'Tomates cherry');
      expect(result.ingredients[1].amount, '1 taza');
      expect(result.ingredients[2].name, 'Queso feta');
      expect(result.ingredients[2].amount, '50g');
      expect(result.ingredients[3].name, 'Aceitunas negras');
      expect(result.ingredients[3].amount, '1/4 taza');
      expect(result.ingredients[4].name, 'Cebolla roja');
      expect(result.ingredients[4].amount, '1/4 taza');
      expect(result.ingredients[5].name, 'Vinagreta balsámica');
      expect(result.ingredients[5].amount, '2 cucharadas');
    });

    test('should throw an exception if an error occurs', () async {
      // Arrange
      when(mockHttpClient.get(
              endpoint: '/recipes/1', errorText: "Error getting recipe"))
          .thenThrow(Exception('Error getting recipe'));

      // Act
      call() => recipesService.getRecipe('1');

      // Assert
      expect(call(), throwsException);
    });
  });
}
