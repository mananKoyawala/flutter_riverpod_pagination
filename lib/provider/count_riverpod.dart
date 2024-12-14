import 'package:flutter_riverpod/flutter_riverpod.dart';

final countProvider = StateProvider<int>((ref) {
  return 10;
});

void changeCountProvider(WidgetRef ref) {
  ref.read(countProvider.notifier).state + 10;
}

final loadingProvider = StateProvider<bool>((ref) => false);
