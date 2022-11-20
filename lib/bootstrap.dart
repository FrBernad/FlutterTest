import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/config/logger/logger.dart';

import 'config/providers.dart' as providers;
import 'flavors.dart';

/// Initializes services and controllers before application start
Future<ProviderContainer> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer(
    overrides: [],
    observers: [if (F.appFlavor == Flavor.local) _Logger()],
  );

  await providers.initializeProviders(container);

  return container;
}

class _Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.d(
      'Provider: ${provider.name ?? provider.runtimeType}\n'
      'New Value: $newValue',
    );
  }
}
