import 'dart:math';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MessagesController extends GetxController {
  late FlutterLocalNotificationsPlugin _fnp;

  final List<String> messages = [
    "Mensaje 1",
    "Mensaje 2",
    "Mensaje 3",
    "Mensaje 4",
    "Mensaje 5"
  ];

  MessagesController() {
    var ais = const AndroidInitializationSettings('face_icon');
    var iis = const IOSInitializationSettings();
    var iss = InitializationSettings(android: ais, iOS: iis);
    _fnp = FlutterLocalNotificationsPlugin();
    _fnp.initialize(iss);
  }

  Future showNotification() async {
    int identi = Random().nextInt(16);
    //print('Show notification id: $identi');
    var ands = const AndroidNotificationDetails("channelId-0", "channelName",
        channelDescription: "Test Class",
        playSound: true,
        importance: Importance.high,
        priority: Priority.max);
    var inds = const IOSNotificationDetails(presentSound: true);
    var nd = NotificationDetails(android: ands, iOS: inds);
    var bodyMessage = messages[Random().nextInt(5)];
    var title = DateFormat("yyyy-MM-dd kk:mm").format(DateTime.now());
    _fnp.show(identi, title, bodyMessage, nd);
  }
}
