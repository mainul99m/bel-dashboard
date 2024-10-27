class ApiEndpoint {
  static final String baseUrl = 'https://api.bengalelasmolab.org/v1/';
  static final String imageUrl = 'https://images.bengalelasmolab.org/';

  static final _AuthEndpoint auth = _AuthEndpoint();
}

class _AuthEndpoint {
  final String login = "users/login";
}

class _DataEndpoint {
  final String shark = "sharks";
  final String ray = "rays";
  final String guitar = "guitars";
}