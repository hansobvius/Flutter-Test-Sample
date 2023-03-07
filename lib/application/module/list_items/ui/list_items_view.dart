import 'package:flutter/material.dart';
import 'package:flutter_driver_sample/application/module/list_items/controller/list_item_controller.dart';

class ListItemsView extends StatefulWidget {

  const ListItemsView({super.key});

  @override
  State<ListItemsView> createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItemsView> {

  final ListItemController _controller = ListItemController();

  List<String>? _generatedWordList;

  @override
  void initState() {
    super.initState();
    _initListView();
  }

  void _initListView() {
    print('_initListView');
    _controller.generateList((list) {
      setState(() {
        _generatedWordList = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('ITEM_VIEW_BUILD'),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'English Words List',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Builder(
        builder: (context) {

          if (_controller.isLoading) {
            return const Center(
              child: SizedBox(
                key: Key('CIRCULAR_PROGRESS'),
                height: 40.0,
                width: 40.0,
                child: CircularProgressIndicator(color: Colors.black)
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                key: const Key('LIST_VIEW_SEPARATED'),
                itemCount: _controller.wordListLength,
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemBuilder: (context, index) {
                  String key = '${index}_LIST_TILE';
                  return ListTile(
                    key: Key(key),
                    title: Text('$index position'),
                    subtitle: Text(_generatedWordList![index]),
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder( //<-- SEE HERE
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                }
            ),
          );
        }
      )
    );
  }
}