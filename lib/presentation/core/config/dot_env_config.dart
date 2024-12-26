import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvConfig {
  static String supabaseApikey = dotenv.get('SUPABASE_API_KEY');
}