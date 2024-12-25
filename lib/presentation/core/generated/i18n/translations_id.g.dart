///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsId extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsId({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.id,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <id>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsId _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsExampleId example = _TranslationsExampleId._(_root);
	@override late final _TranslationsRegisterId register = _TranslationsRegisterId._(_root);
}

// Path: example
class _TranslationsExampleId extends TranslationsExampleEn {
	_TranslationsExampleId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get hello => 'Halo dunia!';
}

// Path: register
class _TranslationsRegisterId extends TranslationsRegisterEn {
	_TranslationsRegisterId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get email => 'Email';
	@override String get emailPlaceholder => 'Masukkan email Anda';
	@override String get password => 'Password';
	@override String get passwordPlaceholder => 'Masukkan password Anda';
	@override String get confirmPassword => 'Konfirmasi Password';
	@override String get confirmPasswordPlaceholder => 'Konfirmasi password Anda';
	@override String get signUp => 'Daftar';
	@override late final _TranslationsRegisterValidationId validation = _TranslationsRegisterValidationId._(_root);
}

// Path: register.validation
class _TranslationsRegisterValidationId extends TranslationsRegisterValidationEn {
	_TranslationsRegisterValidationId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsRegisterValidationEmailId email = _TranslationsRegisterValidationEmailId._(_root);
	@override late final _TranslationsRegisterValidationPasswordId password = _TranslationsRegisterValidationPasswordId._(_root);
	@override late final _TranslationsRegisterValidationConfirmPasswordId confirmPassword = _TranslationsRegisterValidationConfirmPasswordId._(_root);
}

// Path: register.validation.email
class _TranslationsRegisterValidationEmailId extends TranslationsRegisterValidationEmailEn {
	_TranslationsRegisterValidationEmailId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get required => 'Email wajib diisi';
	@override String get invalid => 'Email tidak valid';
}

// Path: register.validation.password
class _TranslationsRegisterValidationPasswordId extends TranslationsRegisterValidationPasswordEn {
	_TranslationsRegisterValidationPasswordId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get required => 'Password wajib diisi';
	@override String get minLength => 'Password minimal 6 karakter';
}

// Path: register.validation.confirmPassword
class _TranslationsRegisterValidationConfirmPasswordId extends TranslationsRegisterValidationConfirmPasswordEn {
	_TranslationsRegisterValidationConfirmPasswordId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get required => 'Konfirmasi Password wajib diisi';
	@override String get mustMatch => 'Password dan Konfirmasi Password harus sama';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsId {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'example.hello': return 'Halo dunia!';
			case 'register.email': return 'Email';
			case 'register.emailPlaceholder': return 'Masukkan email Anda';
			case 'register.password': return 'Password';
			case 'register.passwordPlaceholder': return 'Masukkan password Anda';
			case 'register.confirmPassword': return 'Konfirmasi Password';
			case 'register.confirmPasswordPlaceholder': return 'Konfirmasi password Anda';
			case 'register.signUp': return 'Daftar';
			case 'register.validation.email.required': return 'Email wajib diisi';
			case 'register.validation.email.invalid': return 'Email tidak valid';
			case 'register.validation.password.required': return 'Password wajib diisi';
			case 'register.validation.password.minLength': return 'Password minimal 6 karakter';
			case 'register.validation.confirmPassword.required': return 'Konfirmasi Password wajib diisi';
			case 'register.validation.confirmPassword.mustMatch': return 'Password dan Konfirmasi Password harus sama';
			default: return null;
		}
	}
}

