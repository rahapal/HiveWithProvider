import 'package:hive/hive.dart';
import 'package:hivewithprovider/provider/detailsprovider.dart';
import 'package:hivewithprovider/showpage.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'database/details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hive Provider'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'Name'),
              controller: _nameController,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Phone'),
              controller: _phoneController,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<DetailsProvider>().addItem(
                            Details(
                                id: const Uuid().v4(),
                                name: _nameController.text,
                                phone: _phoneController.text),
                          );
                    },
                    child: const Text('Save')),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ShowPage(),
                      ),
                    );
                  },
                  child: const Text('Details'),
                ),
              ],
            ),
          ],
        ));
  }
}
