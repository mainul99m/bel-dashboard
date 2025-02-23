class ApiEndpoint {
  static const String baseUrl = 'https://api.bengalelasmolab.org/v1/';
  static const String imageUrl = 'https://images.bengalelasmolab.org/';

  static final _AuthEndpoint auth = _AuthEndpoint();
  static final _GetDataEndpoint get = _GetDataEndpoint();
}

class _AuthEndpoint {
  final String login = "users/login";
}

class _GetDataEndpoint {
  final String shark = "sharks";
  final String ray = "rays";
  final String guitar = "guitars";
}