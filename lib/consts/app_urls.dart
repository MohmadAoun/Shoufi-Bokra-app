// ignore_for_file: constant_identifier_names

class AppUrl {
  static const BASE_URL = 'https://wise-octopus-causal.ngrok-free.app';
  static const GEOCODING_BASE_URL = 'https://geocode.maps.co/reverse?';
  static const GEOCODING_API_KEY = '658ad1c5140be026446265dvn1582e6';
  static const API_URL = '$BASE_URL/api/';
  static const IMAGEPREFIX_URL = BASE_URL;
  static const REGISTRATION_URL = '${API_URL}register';
  static const LOGIN_URL = '${API_URL}login';
  static const STORE_URL = '${API_URL}storeEvent';
  static const GET_EVENT_URL = '${API_URL}events';
  static const GETUSER_URL = '${API_URL}user';
  static const UPDATEPROFILE_URL = '${API_URL}update';
}
