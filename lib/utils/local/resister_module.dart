import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class RegisterModule {
  Future<Box> get openBox async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    return Hive.openBox<String>('box');
  }
}
