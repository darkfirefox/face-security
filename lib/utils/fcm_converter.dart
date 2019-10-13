import 'dart:io';

import 'package:face_security/models/notification.dart';

class FCMConverter {
  FCMConverter._();

  static Notification parseMessage(Map<String, dynamic> message) {
    Map<String, String> parsed = <String, String>{};
    if (Platform.isAndroid) {
      parsed = _parseAndroid(message);
    } else if (Platform.isIOS) {
      parsed = _parseIOS(message);
    }
    return Notification(
        id: null,
        body: parsed[_bodyKey],
        title: parsed[_titleKey],
        dateTime: parsed[_dateTimeKey] == null
            ? DateTime.now()
            : DateTime.tryParse(parsed[_dateTimeKey]) ?? DateTime.now(),
        viewable: false);
  }

  static Map<String, String> _parseAndroid(Map<String, dynamic> message) {
    final Map<String, String> result = <String, String>{};
    if (message.containsKey('notification')) {
      final dynamic notification = message['notification'];
      if (notification != null) {
        final dynamic title = notification['title'];
        final dynamic body = notification['body'];
        if (title is String) {
          result[_titleKey] = title;
        }
        if (body is String) {
          result[_bodyKey] = body;
        }
      }
    }
    if (message.containsKey('data')) {
      final dynamic data = message['data'];
      if (data != null) {
        final dynamic clientId = data['dateTime'];
        if (clientId is String) {
          result[_dateTimeKey] = clientId;
        }
      }
    }
    return result;
  }

  static Map<String, String> _parseIOS(Map<String, dynamic> message) {
    return <String, String>{};
  }

  static const String _titleKey = 'title';
  static const String _bodyKey = 'body';
  static const String _dateTimeKey = 'dateTime';
}
