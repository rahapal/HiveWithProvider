import 'package:flutter/material.dart';
import 'package:hivewithprovider/provider/detailsprovider.dart';
import 'package:provider/provider.dart';

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
        builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.details.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${value.details[index].name}'),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Contact: ${value.details[index].phone}'),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          value.deleteItem(index);
                        },
                        icon: const Icon(Icons.delete)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                  ],
                );
              });
        },
      ),
    );
  }
}
