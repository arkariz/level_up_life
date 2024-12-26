import 'package:dio/dio.dart';
import 'package:level_up_life/data/base_service/base_service.dart';
import 'package:level_up_life/data/services/service_manager/supabase_service_config.dart';

class SupabaseManager extends BaseService {
  static SupabaseManager? _instance;
  final SupabaseServiceConfig serviceConfig = SupabaseServiceConfig();

  factory SupabaseManager() {
    _instance ??= SupabaseManager._internal();
    return _instance!;
  }

  SupabaseManager._internal() : super(additionalInterceptor: _buildAdditionalInterceptors());

  static List<Interceptor> _buildAdditionalInterceptors() {
    final interceptors = <Interceptor>[];
    return interceptors;
  }

  @override
  String get baseUrl => serviceConfig.getBaseUrl;
}
