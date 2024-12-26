import 'package:level_up_life/data/services/service_manager/supabase_flavor.dart';
import 'package:level_up_life/presentation/flavor/develop/supabase_environtment_dev.dart';
import 'package:level_up_life/presentation/flavor/production/supabase_environtment_prod.dart';
import 'package:level_up_life/presentation/flavor/quality/supabase_environtment_quality.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:level_up_life/presentation/flavor/staging/supabase_environtment_staging.dart';

class Flavor {
  static Future<void> initialize(String env) async {
    switch (env.toLowerCase()) {
      case "dev":
        await dotenv.load(fileName: "lib/presentation/flavor/env/dev.env");
        setSupabaseFlavor(SupabaseEnvirontmentDev());
        break;
      case "quality":
        await dotenv.load(fileName: "lib/presentation/flavor/env/quality.env");
        setSupabaseFlavor(SupabaseEnvirontmentQuality());
        break;
      case "staging":
        await dotenv.load(fileName: "lib/presentation/flavor/env/staging.env");
        setSupabaseFlavor(SupabaseEnvirontmentStaging());
        break;
      case "production":
        await dotenv.load(fileName: "lib/presentation/flavor/env/prod.env");
        setSupabaseFlavor(SupabaseEnvirontmentProd());
        break;
      default:
        await dotenv.load(fileName: "lib/presentation/flavor/env/prod.env");
        setSupabaseFlavor(SupabaseEnvirontmentProd());
        break;
    }
  }
}