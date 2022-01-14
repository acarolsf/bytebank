import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {

  static const createContactsTableSql = 'CREATE TABLE $_titleContactsTable('
  '$_idContactTable INTEGER PRIMARY KEY, '
  '$_nameContactTable TEXT, '
  '$_accountContactTable INTEGER)';

  static const _titleContactsTable = 'contacts';
  static const _nameContactTable = 'name';
  static const _idContactTable = 'id';
  static const _accountContactTable = 'account_number';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_titleContactsTable, contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_nameContactTable] = contact.name;
    contactMap[_accountContactTable] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_titleContactsTable);
    List<Contact> contacts = _toList(result);
    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_idContactTable],
        row[_nameContactTable],
        row[_accountContactTable],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}