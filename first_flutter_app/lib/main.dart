import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to flutter",
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to flutter')
      ),
      body: const Center(
        child: RandomWords(),
      ),
      ),
    );
  }
}


class RandoWordsStates extends State<RandomWords> {
    final _suggestions = <WordPair>[];
    final _biggerFont = const TextStyle(fontSize: 18.0);

    Widget _buildSuggestions() {
      return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) {
            return Divider()
          }
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10))
          }
          return _buildRows(_suggestions)
        }
      )
    }

    Widget _buildRows(WordPair pair) {
      return ListTile (
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
      );
    }
    @override
    Widget build(BuildContext context) {
      final WordPair wordPair = WordPair.random();
      return Text(wordPair.asPascalCase);
    }
}

class RandomWords extends StatefulWidget {
  @override
  RandoWordsStates createState() => new RandomWordsState();
}