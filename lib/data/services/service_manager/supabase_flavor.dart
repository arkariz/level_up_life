late SupabaseFlavor _flavor;

void setSupabaseFlavor(SupabaseFlavor flavor) {
  _flavor = flavor;
}

SupabaseFlavor get supabaseFlavorValue {
  return _flavor;
}

abstract class SupabaseFlavor {
  String get environtment;
  String get baseUrl;
  String get apikey;
}
