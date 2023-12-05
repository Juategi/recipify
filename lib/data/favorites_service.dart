class FavoritesService {
  final List<String> _favorites = [];

  Future getFavorites() async {
    return _favorites;
  }

  Future addFavorite(String id) async {
    _favorites.add(id);
  }

  Future removeFavorite(String id) async {
    _favorites.remove(id);
  }
}
