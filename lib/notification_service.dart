import "package:flutter_local_notifications/flutter_local_notifications.dart";

import 'package:notification_demo_flutters/utils.dart';

class NotificationService {
  int id = 0;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings =
      const AndroidInitializationSettings(
          'logo'); //default icon for notifcation drawable folder with same name

  void initializedNotificationi() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: _androidInitializationSettings,
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("channelId", "channelName",
            importance: Importance.max, priority: Priority.high);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await _flutterLocalNotificationsPlugin.show(
        id, "Title", "Here is the  body man cheer UP ||", notificationDetails);
  }

  void schyduleNotification() async {
    final bigpicture = await Utils.getImageFilePathFromAssets(
        'assets/images/largicon.png', 'bigpicture');
    final smallpicture = await Utils.getImageFilePathFromAssets(
        'assets/images/smallicon.jpg', 'smallpicture');
    print(bigpicture);

    print(smallpicture);

    final styleinformationDesign = BigPictureStyleInformation(
      //for design adding images big and small in notificaitonbar
      FilePathAndroidBitmap(smallpicture),
      largeIcon: FilePathAndroidBitmap(bigpicture),
    );
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("channelId", "channelName",
            styleInformation: styleinformationDesign,
            importance: Importance.max,
            priority: Priority.high);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await _flutterLocalNotificationsPlugin.periodicallyShow(
      id,
      "Title Scheduled",
      "Here is the  body man cheer UP ||",
      RepeatInterval.everyMinute,
      notificationDetails,
    );
  }

  void stopNotification() {
    _flutterLocalNotificationsPlugin.cancelAll();
  }
}
