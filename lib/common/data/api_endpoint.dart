class ApiEndpoint {
  static const String bggBase = 'https://www.boardgamegeek.com/xmlapi2';

  static const String hotGames = '$bggBase/hot?boardgame';

  static String thing(Iterable<String> idList, {bool includeStats = true}) =>
      '$bggBase/thing?id=${idList.join(',')}${includeStats ? '&stats=1' : ''}';

  static String search(String query) =>
      '$bggBase/search?query=$query&type=boardgame';
}
