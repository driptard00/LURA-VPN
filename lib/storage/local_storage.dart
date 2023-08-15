import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage{

  final FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();

  // STORE ID
  storeUserId(String userId) async{
    try {
      await _flutterSecureStorage.write(key: "UserId", value: userId);
      print("Saved Id");
    } catch (e) {
      print(e);
      print("Could not save id");
    }
  }

  // FETCH ID
  Future<String> fetchUserId() async{
    String userId = await _flutterSecureStorage.read(key: "UserId") ?? "";
    print("Fetched Id successful");

    return userId;
  }

  // STORE TOKEN
  storeUserToken(String token) async{
    try {
      await _flutterSecureStorage.write(key: "Token", value: token);
      print("Saved Token");
    } catch (e) {
      print(e);
      print("Could not save token");
    }
  }

  // FETCH TOKEN
  Future<String> fetchUserToken() async{
    String token = await _flutterSecureStorage.read(key: "Token") ?? "";
    print("Fetched token successful");

    return token;
  }

  // STORE FIRST NAME
  storeFirstName(String name) async{
    try {
      await _flutterSecureStorage.write(key: "FirstName", value: name);
      print("Saved Name");
    } catch (e) {
      print(e);
      print("Could not save name");
    }
  }

  // FETCH FIRST NAME
  Future<String> fetchFirstName() async{
    String name = await _flutterSecureStorage.read(key: "FirstName") ?? "";
    print("Fetched name successful");

    return name;
  }

  // STORE FIRST EMAIL
  storeEmail(String email) async{
    try {
      await _flutterSecureStorage.write(key: "Email", value: email);
      print("Saved Emsil");
    } catch (e) {
      print(e);
      print("Could not save email");
    }
  }

  // FETCH FIRST EMAIL
  Future<String> fetchEmail() async{
    String email = await _flutterSecureStorage.read(key: "Email") ?? "";
    print("Fetched email successful");

    return email;
  }

  // STORE LOCATION
  storeLocation(String location) async{
    try {
      await _flutterSecureStorage.write(key: "Location", value: location);
      print("Saved Location");
    } catch (e) {
      print(e);
      print("Could not save location");
    }
  }

  // FETCH lOCATION
  Future<String> fetchLocation() async{
    String location = await _flutterSecureStorage.read(key: "Location") ?? "";
    print("Fetched location successful");

    return location;
  }

  // DELETE USER FROM STORAGE
  Future<void> deleteUserStorage() async{
    await _flutterSecureStorage.deleteAll();
    print("Deleted Storage :)");
  }
}