import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService {
  final box = GetStorage();

  bool get isLoggedIn => box.read('isLoggedIn') ?? false;
  set isLoggedIn(bool value) => box.write('isLoggedIn', value);

  bool get savedTheme => box.read('savedTheme') ?? false;
  set savedTheme(bool value) => box.write('savedTheme', value);

  bool get savedScreenSize => box.read('savedScreenSize') ?? false;
  set savedScreenSize(bool value) => box.write('savedScreenSize', value);

  String? get token => box.read('token');
  set token(String? value) => box.write('token', value);

  String? get role => box.read('role');
  set role(String? value) => box.write('role', value);

  final RxString _profileImageUrl = RxString('');
  String? get profileImageUrl => _profileImageUrl.value;

  set profileImageUrl(String? value) {
    if (value != null) {
      _profileImageUrl.value = value;
      box.write('profileImageUrl', value);
    }
  }

  final RxString _firstName = RxString('');
  String? get firstName => _firstName.value;
  set firstName(String? value) {
    if (value != null) {
      _firstName.value = value;
      box.write('firstName', value);
    }
  }

  final RxString _lastName = RxString('');
  String? get lastName => _lastName.value;
  set lastName(String? value) {
    if (value != null) {
      _lastName.value = value;
      box.write('lastName', value);
    }
  }

  final RxString _phoneNumber = RxString('');
  String? get phoneNumber => _phoneNumber.value;
  set phoneNumber(String? value) {
    if (value != null) {
      _phoneNumber.value = value;
      box.write('phoneNumber', value);
    }
  }

  Map<String, dynamic> get user => box.read('user');
  set user(Map<String, dynamic> value) {
    box.write('user', value);
    value.forEach(
      (key, value) {
        switch (key) {
          case 'firstName':
            firstName = value;
            break;
          case 'lastName':
            lastName = value;
            break;
          case 'phoneNumber':
            phoneNumber = value;
            break;
        }
      },
    );
  }

  Map<String, dynamic> get events => box.read('events');
  set events(Map<String, dynamic> value) {
    box.write('events', value);
    value.forEach((key, value) {
      switch (key){
        case 'title':
        case 'description':
        case 'organizer_id':
        case 'type_id':
        case 'genre_id':
        case 'sub_genre_id':
        case 'location_id':
        case 'title':
        case 'title':
        case 'title':
        case 'title':
        case 'title':
        case 'title':
'title' => 'required|max=45',
            'description' => 'required',
            'type_id' => 'required',
            'genre_id' => 'required',
            'sub_genre_id' => 'required',
            'locatoin_id' => 'required',
            'event_start_date' => 'required',
            'event_end_date' => 'required',
            'ticket_book_start_date' => 'required',
      }
    });
  }

  ThemeMode get theme {
    String? themeAsString = box.read('theme');
    if (themeAsString != null) {
      return ThemeMode.values
          .firstWhere((mode) => mode.toString() == themeAsString);
    }
    return ThemeMode.system;
  }

  set theme(ThemeMode value) => box.write('theme', value.toString());
}
