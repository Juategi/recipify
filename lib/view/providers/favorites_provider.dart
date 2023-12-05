import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipy/domain/repositories/favorites_repository.dart';
import 'package:recipy/domain/usecases/add_favorite_case.dart';
import 'package:recipy/domain/usecases/get_favorites_case.dart';
import 'package:recipy/domain/usecases/remove_favorite_case.dart';

import 'repository_provider.dart';

class AsyncFavoritesNotifier extends AsyncNotifier<List<String>> {
  late AddFavoriteCase _addFavoriteCase;
  late RemoveFavoriteCase _removeFavoriteCase;
  late GetFavoriteCase _getFavoriteCase;

  @override
  Future<List<String>> build() async {
    FavoritesRepository repository = ref.watch(favoriteRepositoryProvider);
    _addFavoriteCase = AddFavoriteCase(repository);
    _removeFavoriteCase = RemoveFavoriteCase(repository);
    _getFavoriteCase = GetFavoriteCase(repository);
    return await _getFavoriteCase.call();
  }

  Future<void> toggleFavorite(String id) async {
    bool isFavorite = state.value?.contains(id) ?? false;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      if (isFavorite) {
        await _removeFavoriteCase.call(id);
      } else {
        await _addFavoriteCase.call(id);
      }
      return await _getFavoriteCase.call();
    });
  }
}

final asyncFavoritesProvider =
    AsyncNotifierProvider<AsyncFavoritesNotifier, List<String>>(() {
  return AsyncFavoritesNotifier();
});
