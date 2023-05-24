// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$translatorHash() => r'3e6aa58f32f7f7fa63e4d2d3b390f5b0919d6c83';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Translator extends BuildlessAutoDisposeAsyncNotifier<String> {
  late final String originalText;

  Future<String> build(
    String originalText,
  );
}

/// See also [Translator].
@ProviderFor(Translator)
const translatorProvider = TranslatorFamily();

/// See also [Translator].
class TranslatorFamily extends Family<AsyncValue<String>> {
  /// See also [Translator].
  const TranslatorFamily();

  /// See also [Translator].
  TranslatorProvider call(
    String originalText,
  ) {
    return TranslatorProvider(
      originalText,
    );
  }

  @override
  TranslatorProvider getProviderOverride(
    covariant TranslatorProvider provider,
  ) {
    return call(
      provider.originalText,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'translatorProvider';
}

/// See also [Translator].
class TranslatorProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Translator, String> {
  /// See also [Translator].
  TranslatorProvider(
    this.originalText,
  ) : super.internal(
          () => Translator()..originalText = originalText,
          from: translatorProvider,
          name: r'translatorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$translatorHash,
          dependencies: TranslatorFamily._dependencies,
          allTransitiveDependencies:
              TranslatorFamily._allTransitiveDependencies,
        );

  final String originalText;

  @override
  bool operator ==(Object other) {
    return other is TranslatorProvider && other.originalText == originalText;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, originalText.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<String> runNotifierBuild(
    covariant Translator notifier,
  ) {
    return notifier.build(
      originalText,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
