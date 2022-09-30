import 'package:flutter/material.dart';
import 'package:scheduled_notifications/scheduled_notifications.dart';
import 'Scaffold_all.dart';

class SmsPage extends StatelessWidget {
  //const SmsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaflod_all(
      body:  Center(
        child:  RaisedButton(
          onPressed: _scheduleNotification,
          child:  Text('Schedule notification in 5 seconds'),
        ),
      ),
    );
  }
}


_scheduleNotification() async {
  int notificationId = await ScheduledNotifications.scheduleNotification(
       DateTime.now().add(new Duration(seconds: 1)).millisecondsSinceEpoch,
      "",
      "Content title",
      "Content");
}