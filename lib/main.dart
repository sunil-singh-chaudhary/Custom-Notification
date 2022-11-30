import 'package:flutter/material.dart';
import 'package:notification_demo_flutters/notification_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NotificationService notificationservice = NotificationService();
  @override
  void initState() {
    super.initState();
    notificationservice.initializedNotificationi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.more),
          elevation: 10,
          title: Center(child: Text("Notification"))),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                onPressed: () {
                  print("Send Notification click");
                  notificationservice.sendNotification();
                },
                child: Text("Send Notification")),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                print("scheduled Notification click");
                notificationservice.schyduleNotification();
              },
              child: Text("schedule Notification"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("cancel Notification"),
            ),
          ],
        ),
      ),
    );
  }
}
