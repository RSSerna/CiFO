import 'package:cifo_flutter/core/constants/constants.dart';
import 'package:cifo_flutter/core/errors/exceptions.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


abstract class SecureStorage {
  Future<String> getSecuredUserToken();
  Future<String> getSecuredRefreshToken();
  Future<void> secureUserToken({required String tokenToSecure});
  Future<void> secureRefreshToken({required String tokenToSecure});
  Future<void> removeUserToken();
}

class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage flutterSecureStorage;

  SecureStorageImpl(this.flutterSecureStorage);

  @override
  Future<String> getSecuredUserToken() async {
    final token = await flutterSecureStorage.read(key: Constants.securedToken);
    if (token != null) {
      return token;
    } else {
      throw TokenException();
    }
  }

  @override
  Future<String> getSecuredRefreshToken() async {
    final token = await flutterSecureStorage.read(key: Constants.securedToken);
    if (token != null) {
      return token;
    } else {
      throw TokenException();
    }
  }

  @override
  Future<void> secureUserToken({required String tokenToSecure}) async {
    await flutterSecureStorage.write(
        key: Constants.securedToken, value: tokenToSecure);
  }

  @override
  Future<void> secureRefreshToken({required String tokenToSecure}) async {
    await flutterSecureStorage.write(
        key: Constants.securedRefreshToken, value: tokenToSecure);
  }

  @override
  Future<void> removeUserToken() async {
    await flutterSecureStorage.delete(key: Constants.securedToken);
  }
}
