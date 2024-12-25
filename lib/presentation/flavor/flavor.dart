import 'package:level_up_life/data/utility/service_manager/name_flavor.dart';
import 'package:level_up_life/presentation/flavor/develop/name_environtment_dev.dart';
import 'package:level_up_life/presentation/flavor/production/name_environtment_prod.dart';
import 'package:level_up_life/presentation/flavor/quality/name_environtment_quality.dart';
import 'package:level_up_life/presentation/flavor/staging/name_environtment_STAGING.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Flavor {
  static Future<void> initialize(String env) async {
    switch (env.toLowerCase()) {
      case "dev":
        await dotenv.load(fileName: "lib/presentation/flavor/env/dev.env");
        setNameFlavor(NameEnvirontmentDev());
        break;
      case "quality":
        await dotenv.load(fileName: "lib/presentation/flavor/env/quality.env");
        setNameFlavor(NameEnvirontmentQuality());
        break;
      case "staging":
        await dotenv.load(fileName: "lib/presentation/flavor/env/staging.env");
        setNameFlavor(NameEnvirontmentStaging());
        break;
      case "production":
        await dotenv.load(fileName: "lib/presentation/flavor/env/prod.env");
        setNameFlavor(NameEnvirontmentProd());
        break;
      default:
        await dotenv.load(fileName: "lib/presentation/flavor/env/prod.env");
        setNameFlavor(NameEnvirontmentProd());
        break;
    }
  }
}