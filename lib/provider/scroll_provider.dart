import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paggination/provider/count_riverpod.dart';
import 'package:paggination/provider/home_provider.dart';

final scrollProvider = StateProvider<ScrollController>((ref) {
  ScrollController controller = ScrollController();
  controller.addListener(() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      // load bit eariler
      // final count = ref.read(countProvider);
      final isLoading = ref.read(loadingProvider);
      if (!isLoading) {
        ref.read(loadingProvider.notifier).state = true;
        ref.read(commentsProvider.notifier).loadData().then((e) {
          // ref.read(countProvider.notifier).state += 10;
          ref.read(loadingProvider.notifier).state = false;
        });
      }
    }
  });

  return controller;
});
