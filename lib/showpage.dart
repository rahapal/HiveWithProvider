import 'package:flutter/material.dart';

import 'package:hivewithprovider/provider/detailsprovider.dart';
import 'package:provider/provider.dart';

import 'editpage.dart';

class ShowPage extends StatefulWidget {
  const ShowPage({super.key});

  @override
  State<ShowPage> createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Page'),
      ),
      body: Consumer<DetailsProvider>(
        builder: (context, detailsProvider, child) {
          return ListView.builder(
            itemCount: detailsProvider.details.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Column(
                    children: [
                      Text(detailsProvider.details[index].name),
                      Text(detailsProvider.details[index].phone),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      detailsProvider.deleteItem(index);
                    },
                    child: const Text('Delete'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditPage(
                            getDetail: detailsProvider.getDetail(index),
                          ),
                        ),
                      );
                    },
                    child: const Text('Edit'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
