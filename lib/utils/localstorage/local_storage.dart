import 'package:bitebuddy/utils/localstorage/storage_keys.dart';
import 'package:get_storage/get_storage.dart';

class StorageService {
  static final storage = GetStorage();

  static dynamic userSession = storage.read(StorageKeys.userSession);
  static dynamic isFirstTime = storage.read(StorageKeys.isFirstTime);
  static dynamic cartItems = storage.read(StorageKeys.cartItems);
}
