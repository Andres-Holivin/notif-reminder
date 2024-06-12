import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:idg/application/dependency/setup_locator.dart';
import 'package:idg/application/router/root_router.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  late AndroidInitializationSettings _initializationSettingsAndroid;
  late DarwinInitializationSettings _initializeIOSSettings;
  late InitializationSettings _initializationSettings;
  @pragma('vm:entry-point')
  static void notificationTapBackground(
      NotificationResponse notificationResponse) {
    // ignore: avoid_print
    print('notification(${notificationResponse.id}) action tapped: '
        '${notificationResponse.actionId} with'
        ' payload: ${notificationResponse.payload}');
    if (notificationResponse.input?.isNotEmpty ?? false) {
      // ignore: avoid_print
      print(
          'notification action tapped with input: ${notificationResponse.input}');
    }
  }

  LocalNotificationService() {
    initializeNotification();
    requestPermissions();
  }

  Future<void> initializeNotification() async {
    if (Platform.isIOS) {
      print("IOS");
      _initializeIOSSettings = DarwinInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) {
          print(id);
          print(title);
          print(body);
          print(payload);
        },
      );
      _initializationSettings = InitializationSettings(
        iOS: _initializeIOSSettings,
      );
    } else if (Platform.isAndroid) {
      _initializationSettingsAndroid = const AndroidInitializationSettings(
        'app_icon',
      );
      _initializationSettings = InitializationSettings(
        android: _initializationSettingsAndroid,
      );
    }
    await _flutterLocalNotificationsPlugin.initialize(
      _initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        print(details.payload);
        getIt<RootRouter>().router.push("/note", extra: details.payload);
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  Future<bool> checkPermissions() async {
    bool? result;
    if (Platform.isIOS) {
      result = (await _flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  IOSFlutterLocalNotificationsPlugin>()
              ?.checkPermissions())
          ?.isEnabled;
    } else if (Platform.isAndroid) {
      result = await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.areNotificationsEnabled();
    }
    return result ?? false;
  }

  Future<bool> requestPermissions() async {
    bool? result;
    if (Platform.isIOS) {
      result = await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          _flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>();

      result = await androidImplementation?.requestNotificationsPermission();
    }
    return result ?? false;
  }

  Future<void> showNotification({
    int? id,
    String? title,
    String? body,
  }) async {
    await _flutterLocalNotificationsPlugin.show(
      id ?? 0,
      title ?? 'Title',
      body ?? 'Body',
      const NotificationDetails(
          android: AndroidNotificationDetails(
              'full screen channel id', 'full screen channel name',
              channelDescription: 'full screen channel description',
              priority: Priority.high,
              importance: Importance.high,
              fullScreenIntent: true)),
    );
  }

  Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<List<PendingNotificationRequest>>
      getPendingNotificationRequests() async {
    return await _flutterLocalNotificationsPlugin.pendingNotificationRequests();
  }

  Future<void> zonedScheduleNotification(
      {required int id,
      required String title,
      required String body,
      required DateTime scheduledDate,
      String? payload}) async {
    print(tz.TZDateTime.from(scheduledDate, tz.local));
    print(tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)));
    await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduledDate, tz.local),
        payload: payload,
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'full screen channel id', 'full screen channel name',
                channelDescription: 'full screen channel description',
                priority: Priority.high,
                importance: Importance.high,
                fullScreenIntent: true)),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}
