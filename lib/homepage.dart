import 'package:hivewithprovider/provider/detailsprovider.dart';
import 'package:hivewithprovider/showpage.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import 'database/details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final addprovider = Provider.of<DetailsProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hive Provider'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Name'),
              controller: _nameController,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Phone'),
              controller: _phoneController,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      addprovider.addItem(Details(
                          id: '1',
                          name: _nameController.text,
                          phone: _phoneController.text));
                    },
                    child: Text('Save')),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShowPage()));
                    },
                    child: Text('Details'))
              ],
            ),
          ],
        ));
  }
}
