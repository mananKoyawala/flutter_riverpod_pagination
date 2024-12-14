import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paggination/provider/count_riverpod.dart';
import 'package:paggination/provider/home_provider.dart';
import 'package:paggination/provider/scroll_provider.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  // ScrollController controller = ScrollController();
  late CommentsData _commentsData;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _commentsData = ref.watch(commentsProvider);
    final isLoading = ref.watch(loadingProvider);
    final controller = ref.watch(scrollProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: controller,
              itemCount: _commentsData.data?.length ?? 10,
              itemBuilder: (context, index) {
                final data = _commentsData.data?[index];
                return Container(
                  margin: const EdgeInsets.all(10),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    leading: Text(data?.id.toString() ?? ''),
                    title: Text(data?.body ?? ''),
                  ),
                );
              },
            ),
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
