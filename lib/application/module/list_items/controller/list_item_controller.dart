import 'package:english_words/english_words.dart';

class ListItemController {

  final List<String> _wordList = [];

  int get wordListLength => _wordList.length;

  bool isLoading = false;

  Future generateList(Function(List<String> list) onResult) async {
    isLoading = true;
    Future.delayed(const Duration(milliseconds: 25), () {
      var newWordList = nouns.take(1000).toList();
      if (newWordList.isNotEmpty) {
        _wordList.addAll(newWordList);
        isLoading = false;
        // print('LENTH ${_wordList.length}');
        onResult(_wordList);
      }
    });
  }
}