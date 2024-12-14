import 'package:paggination/model/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/home_controller.dart';

class CommentsData {
  List<Comments>? data;
  int count;
  bool hasNext;

  CommentsData(
      {required this.data, required this.count, required this.hasNext});

  CommentsData.initial()
      : data = null,
        count = 10,
        hasNext = true;

  CommentsData copyWith({List<Comments>? data, int? count, bool? hasNext}) {
    return CommentsData(
      data: data ?? this.data,
      count: (count ?? this.count) + 10,
      hasNext: hasNext ?? this.hasNext,
    );
  }
}

final commentsProvider =
    StateNotifierProvider<CommentController, CommentsData>((ref) {
  return CommentController(CommentsData.initial());
});
