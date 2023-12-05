import 'package:recipy/domain/entities/allergen.dart';
import 'package:recipy/domain/entities/ingredient.dart';
import 'package:recipy/domain/entities/macro.dart';
import 'package:recipy/domain/entities/recipe.dart';
import 'package:recipy/domain/repositories/recipe_repository.dart';

class RecipeRepositoryMock implements RecipeRepository {
  @override
  Future<List<Recipe>> getRecipes() async {
    List<Recipe> recipes = [
      Recipe(
        id: '1',
        title: 'Ensalada Mediterránea',
        subtitle: 'Una fresca y nutritiva opción',
        creatorName: 'Chef García',
        rating: 4.5,
        thumbnail:
            'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        calories: 250,
        ingredients: [
          Ingredient(name: 'Lechuga', amount: '2 tazas'),
          Ingredient(name: 'Tomates cherry', amount: '1 taza'),
          Ingredient(name: 'Queso feta', amount: '50g'),
          Ingredient(name: 'Aceitunas negras', amount: '1/4 taza'),
          Ingredient(name: 'Cebolla roja', amount: '1/4 taza'),
          Ingredient(name: 'Vinagreta balsámica', amount: '2 cucharadas')
        ],
        preparationDetails: 'Comenzar lavando y cortando la lechuga...',
        macros: [
          Macro(name: "Proteinas", value: 3),
          Macro(name: "Carbohidratos", value: 18),
          Macro(name: "Grasas", value: 16)
        ],
        allergens: [Allergen(name: "Lácteos"), Allergen(name: "Aceitunas")],
      ),
      Recipe(
        id: '2',
        title: 'Smoothie de Frutas Tropicales',
        subtitle: 'Perfecto para un día de verano',
        creatorName: 'Chef Martínez',
        rating: 4,
        thumbnail:
            'https://images.unsplash.com/photo-1467453678174-768ec283a940?q=80&w=1688&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        calories: 150,
        ingredients: [
          Ingredient(name: 'Fresas', amount: '1 taza'),
          Ingredient(name: 'Mango', amount: '1/2 taza'),
          Ingredient(name: 'Yogur natural', amount: '1 taza'),
          Ingredient(name: 'Miel', amount: '1 cucharada'),
          Ingredient(name: 'Hielo', amount: '1 taza')
        ],
        preparationDetails: 'Mezclar en la licuadora las fresas y el mango...',
        macros: [
          Macro(name: "Proteinas", value: 4),
          Macro(name: "Carbohidratos", value: 25),
          Macro(name: "Grasas", value: 2)
        ],
        allergens: [Allergen(name: "Frutas"), Allergen(name: "Lácteos")],
      ),
      Recipe(
        id: '3',
        title: 'Tacos de Pollo al Estilo Mexicano',
        subtitle: 'Una deliciosa mezcla de sabores tradicionales',
        creatorName: 'Chef López',
        rating: 4.8,
        thumbnail:
            'https://images.unsplash.com/photo-1525059696034-4967a8e1dca2?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        calories: 350,
        ingredients: [
          Ingredient(name: 'Pechuga de pollo', amount: '200g'),
          Ingredient(name: 'Tortillas de maíz', amount: '3 unidades'),
          Ingredient(name: 'Cilantro', amount: '1 puñado'),
          Ingredient(name: 'Cebolla', amount: '1/4 taza'),
          Ingredient(name: 'Salsa verde', amount: 'al gusto')
        ],
        preparationDetails: 'Cocinar el pollo y desmenuzarlo...',
        macros: [
          Macro(name: "Proteinas", value: 25),
          Macro(name: "Carbohidratos", value: 22),
          Macro(name: "Grasas", value: 15)
        ],
        allergens: [Allergen(name: "Pollo"), Allergen(name: "Maíz")],
      ),
      Recipe(
        id: '4',
        title: 'Salmón al Horno con Hierbas',
        subtitle: 'Ligero y lleno de omega 3',
        creatorName: 'Chef Martina',
        rating: 4.7,
        thumbnail: 'https://images.unsplash.com/photo-1543339308-43e59d6b73a6',
        calories: 475,
        ingredients: [
          Ingredient(name: 'Filete de salmón', amount: '200g'),
          Ingredient(name: 'Romero fresco', amount: '1 rama'),
          Ingredient(name: 'Tomillo', amount: '1 rama'),
          Ingredient(name: 'Papas pequeñas', amount: '5 unidades'),
          Ingredient(name: 'Aceite de oliva', amount: '2 cucharadas')
        ],
        preparationDetails: 'Marinar el salmón con hierbas y hornear...',
        macros: [
          Macro(name: "Proteinas", value: 30),
          Macro(name: "Carbohidratos", value: 20),
          Macro(name: "Grasas", value: 25)
        ],
        allergens: [Allergen(name: "Salmón")],
      ),
      Recipe(
        id: '5',
        title: 'Risotto de Champiñones',
        subtitle: 'Un clásico italiano cremoso',
        creatorName: 'Chef Giorgio',
        rating: 4.5,
        thumbnail: 'https://images.unsplash.com/photo-1551218808-94e220e084d2',
        calories: 420,
        ingredients: [
          Ingredient(name: 'Arroz arborio', amount: '1 taza'),
          Ingredient(name: 'Champiñones', amount: '200g'),
          Ingredient(name: 'Caldo de vegetales', amount: '2 tazas'),
          Ingredient(name: 'Queso parmesano', amount: '50g'),
          Ingredient(name: 'Mantequilla', amount: '1 cucharada')
        ],
        preparationDetails: 'Cocinar el arroz lentamente añadiendo caldo...',
        macros: [
          Macro(name: "Proteinas", value: 10),
          Macro(name: "Carbohidratos", value: 50),
          Macro(name: "Grasas", value: 20)
        ],
        allergens: [Allergen(name: "Lácteos"), Allergen(name: "Gluten")],
      ),
      Recipe(
        id: '6',
        title: 'Curry de Garbanzos',
        subtitle: 'Sabroso y nutritivo plato vegano',
        creatorName: 'Chef Anjali',
        rating: 4.6,
        thumbnail:
            'https://images.unsplash.com/photo-1585937421612-70a008356fbe',
        calories: 380,
        ingredients: [
          Ingredient(name: 'Garbanzos cocidos', amount: '1 taza'),
          Ingredient(name: 'Leche de coco', amount: '1 taza'),
          Ingredient(name: 'Curry en polvo', amount: '1 cucharada'),
          Ingredient(name: 'Tomate', amount: '1 unidad'),
          Ingredient(name: 'Espinacas', amount: '1 taza')
        ],
        preparationDetails: 'Sofreír las especias y cocinar con garbanzos...',
        macros: [
          Macro(name: "Proteinas", value: 15),
          Macro(name: "Carbohidratos", value: 40),
          Macro(name: "Grasas", value: 10)
        ],
        allergens: [Allergen(name: "Coco")],
      ),
    ];
    return recipes;
  }

  @override
  Future<Recipe> getRecipe(String id) async {
    return getRecipes()
        .then((recipes) => recipes.firstWhere((recipe) => recipe.id == id));
  }
}
