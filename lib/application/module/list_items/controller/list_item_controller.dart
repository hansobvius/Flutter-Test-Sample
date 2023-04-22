import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';

class ListItemController {

  final List<String> _wordList = [];

  int get wordListLength => _wordList.length;

  bool isLoading = false;

  Future generateList(Function(List<String> list) onResult) async {
    isLoading = true;
    Future.delayed(const Duration(milliseconds: 5000), () {
      var newWordList = nouns.take(1000).toList();
      if (newWordList.isNotEmpty) {
        _wordList.addAll(newWordList);
        isLoading = false;
        debugPrint('WORDS LIST LENGTH ${_wordList.length}');
        onResult(_wordList);
      }
    });
  }
}