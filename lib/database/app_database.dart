import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const _db = 'bytebank.db';

Future<Database> getDatabase() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, _db);
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDao.createContactsTableSql);
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
  );
}


