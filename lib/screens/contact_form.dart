import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

const _titlePage = 'New contact';
const _fullNameInputLabel = 'Full Name';
const _accountNumberInputLabel = 'Account Number';
const _btnTitle = 'Create';

class ContactForm extends StatefulWidget {

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titlePage),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: _fullNameInputLabel,
              ),
              style: TextStyle(fontSize: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountController,
                decoration: InputDecoration(
                  labelText: _accountNumberInputLabel,
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite, // i
                child: ElevatedButton(
                  onPressed: () {
                    final String? name = _nameController.text;
                    final int? account = int.tryParse(_accountController.text);

                    if (name != null && account != null) {
                      final Contact newContact = Contact(0, name, account);
                      _dao.save(newContact).then((id) => Navigator.pop(context));
                    }
                  },
                  child: Text(_btnTitle),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
