import 'dart:io';

import 'package:level_up_life/data/services/service_manager/supabase_flavor.dart';

class SupabaseServiceConfig {
  static final SupabaseServiceConfig _instance = SupabaseServiceConfig._internal();
  factory SupabaseServiceConfig() => _instance;
  SupabaseServiceConfig._internal();

  String get getBaseUrl => supabaseFlavorValue.baseUrl;
  String get _nameApiKey => supabaseFlavorValue.apikey;

  String _accessToken = "";
  Map<String, String> get tokenHeader => {
    "apikey": _nameApiKey,
    HttpHeaders.authorizationHeader: "Bearer $_accessToken",
  };

  void updateAccessToken(String token) {
    _accessToken = token;
  }
}