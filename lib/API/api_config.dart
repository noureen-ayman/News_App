import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiConfig {
  static final String baseUrl = dotenv.env['BASE_URL'] ?? "";
  static final String apiKey = dotenv.env['API_KEY'] ?? "";

  static const String sourceApi = "v2/top-headlines/sources";
  static const String articlesApi = "v2/everything";
}
