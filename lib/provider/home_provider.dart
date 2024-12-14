import 'package:paggination/model/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/home_controller.dart';

class CommentsData {
  List<Comments>? data;

  CommentsData({required this.data});

  CommentsData.initial() : data = null;

  CommentsData copyWith({List<Comments>? data}) {
    return CommentsData(
      data: data ?? this.data,
    );
  }
}

final commentsProvider =
    StateNotifierProvider<CommentController, CommentsData>((ref) {
  return CommentController(CommentsData.initial());
});
