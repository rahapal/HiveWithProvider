import 'package:hivewithprovider/provider/detailsprovider.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import 'database/details.dart';

class EditPage extends StatefulWidget {
  final Details getDetail;

  const EditPage({Key? key, required this.getDetail}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.getDetail.name;
    _phoneController.text = widget.getDetail.phone;

    super.initState();
  }

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
                      context.read<DetailsProvider>().editItem(Details(
                          id: widget.getDetail.id,
                          name: _nameController.text,
                          phone: _phoneController.text));
                      Navigator.pop(context);
                    },
                    child: const Text('Save')),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ));
  }
}
