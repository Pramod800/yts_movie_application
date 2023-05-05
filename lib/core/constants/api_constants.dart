class ApiConstants {
  static String baseUrl = 'https://yts.mx/api/v2';

  static String moviesList = 'https://yts.mx/api/v2/list_movies.json';

  static String popularMovies =
      'https://api.themoviedb.org/3/movie/popular?api_key=<<api_key>>&language=en-US&page=1';

  static String movieDetails =
      'https://yts.mx/api/v2/movie_details.json?movie_id=15&with_images=true&with_cast=true';

  static String moviesSearch =
      'https://yts.mx/api/v2/list_movies.json?query_term=13&limit=5';

  static String likeCount =
      'https://yts.mx/api/v2/list_movies.json?sort_by=like_count';
}
