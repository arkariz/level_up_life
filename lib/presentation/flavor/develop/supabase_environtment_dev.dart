import 'package:level_up_life/data/services/service_manager/supabase_flavor.dart';
import 'package:level_up_life/presentation/core/config/dot_env_config.dart';

class SupabaseEnvirontmentDev extends SupabaseFlavor {
  @override
  String get apikey => DotEnvConfig.supabaseApikey;

  @override
  String get baseUrl => "https://piorvisgjgksbyrviasu.supabase.co/rest/v1/";

  @override
  String get environtment => "dev";

}