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
    _controller.generateList((list) {
      setState(() {
        _generatedWordList = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: 40.0,
                width: 40.0,
                child: CircularProgressIndicator()
              ),
            );
          }

          return ListView.separated(
              itemCount: _controller.wordListLength,
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_generatedWordList![index]),
                );
              }
          );
        }
      )
    );
  }
}