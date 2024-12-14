import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paggination/model/model.dart';
import 'package:paggination/provider/home_provider.dart';
import 'package:paggination/service/service.dart';

class CommentController extends StateNotifier<CommentsData> {
  CommentController(super._state) {
    _setUp();
  }

  Future<void> _setUp() async {
    loadData(10);
  }

  HTTPClient c = HTTPClient();

  Future<void> loadData(int count) async {
    // first time data being loaded
    if (state.data == null) {
      http.Response? res =
          await c.get('https://dummyjson.com/comments?limit=$count');
      if (res != null) {
        final data = jsonDecode(res.body);
        print(data);
        final comments = data["comments"] as List<dynamic>? ?? [];
        List<Comments> commentslist =
            comments.map((element) => Comments.fromJson(element)).toList();
        print(comments);
        state = state.copyWith(data: commentslist);
      }
    }
    // paginated data
    else {
      http.Response? res =
          await c.get('https://dummyjson.com/comments?limit=10&skip=$count');
      if (res != null) {
        final currentData = state.data;
        final data = jsonDecode(res.body);
        print(data);
        final comments = data["comments"] as List<dynamic>? ?? [];
        List<Comments> commentslist =
            comments.map((element) => Comments.fromJson(element)).toList();
        print(comments);
        state = state.copyWith(data: [...?currentData, ...commentslist]);
      }
    }
  }
}
