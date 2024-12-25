///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final TranslationsExampleEn example = TranslationsExampleEn.internal(_root);
	late final TranslationsRegisterEn register = TranslationsRegisterEn.internal(_root);
}

// Path: example
class TranslationsExampleEn {
	TranslationsExampleEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get hello => 'Hello World!';
}

// Path: register
class TranslationsRegisterEn {
	TranslationsRegisterEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get email => 'Email';
	String get emailPlaceholder => 'Enter your email';
	String get password => 'Password';
	String get passwordPlaceholder => 'Enter your password';
	String get confirmPassword => 'Confirm Password';
	String get confirmPasswordPlaceholder => 'Confirm your password';
	String get signUp => 'Sign Up';
	late final TranslationsRegisterValidationEn validation = TranslationsRegisterValidationEn.internal(_root);
}

// Path: register.validation
class TranslationsRegisterValidationEn {
	TranslationsRegisterValidationEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsRegisterValidationEmailEn email = TranslationsRegisterValidationEmailEn.internal(_root);
	late final TranslationsRegisterValidationPasswordEn password = TranslationsRegisterValidationPasswordEn.internal(_root);
	late final TranslationsRegisterValidationConfirmPasswordEn confirmPassword = TranslationsRegisterValidationConfirmPasswordEn.internal(_root);
}

// Path: register.validation.email
class TranslationsRegisterValidationEmailEn {
	TranslationsRegisterValidationEmailEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get required => 'Email is required';
	String get invalid => 'Email is invalid';
}

// Path: register.validation.password
class TranslationsRegisterValidationPasswordEn {
	TranslationsRegisterValidationPasswordEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get required => 'Password is required';
	String get minLength => 'Password must be at least 6 characters';
}

// Path: register.validation.confirmPassword
class TranslationsRegisterValidationConfirmPasswordEn {
	TranslationsRegisterValidationConfirmPasswordEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get required => 'Confirm Password is required';
	String get mustMatch => 'Password and Confirm Password must match';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'example.hello': return 'Hello World!';
			case 'register.email': return 'Email';
			case 'register.emailPlaceholder': return 'Enter your email';
			case 'register.password': return 'Password';
			case 'register.passwordPlaceholder': return 'Enter your password';
			case 'register.confirmPassword': return 'Confirm Password';
			case 'register.confirmPasswordPlaceholder': return 'Confirm your password';
			case 'register.signUp': return 'Sign Up';
			case 'register.validation.email.required': return 'Email is required';
			case 'register.validation.email.invalid': return 'Email is invalid';
			case 'register.validation.password.required': return 'Password is required';
			case 'register.validation.password.minLength': return 'Password must be at least 6 characters';
			case 'register.validation.confirmPassword.required': return 'Confirm Password is required';
			case 'register.validation.confirmPassword.mustMatch': return 'Password and Confirm Password must match';
			default: return null;
		}
	}
}

