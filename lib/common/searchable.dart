abstract class Searchable {
  /// Returns an integer from 0 to x indicating how well the searchable matches
  /// the query. Higher numbers indicate better matches.
  /// Return value of 0 indicates no match.
  int queryMatch(String query);
}
