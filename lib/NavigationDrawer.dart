import 'package:flutter/material.dart';
import 'package:marketapp/pages/SmsPage.dart';
import 'package:marketapp/pages/simpleSearch.dart';
import 'package:marketapp/widgets/DrawBarBtn.dart';
import 'package:provider/provider.dart';
import 'package:scheduled_notifications/scheduled_notifications.dart';
import 'Public.dart';
import 'main.dart';

class NavigationDrawer extends StatelessWidget {
  //const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              DrowBarMenu() //buildMenuItem(context),
            ],
          ),
        ),
      );
  Widget buildHeader(BuildContext context) => Container(
        color: Colors.green.shade800,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );

  // Widget buildMenuItem(BuildContext context) => DrowBarMenu();
}

_scheduleNotification() async {
  int notificationId = await ScheduledNotifications.scheduleNotification(
      new DateTime.now().add(new Duration(seconds: 5)).millisecondsSinceEpoch,
      "Ticker text",
      "Content title",
      "Content");
}

class DrowBarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          DrawBarBtn(
            color: UsesVar().IsLight() ? Colors.white : Colors.grey[800],
            onTap: (context) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MyApp()));
            },
            leading: Icon(
              Icons.home_outlined,
            ),
            title: Text("HOME"),
            trailing: IconButton(
                onPressed: () {
                  Provider.of<UsesVar>(context, listen: false).changeThem();
                },
                icon: Icon(UsesVar().IsLight()
                    ? Icons.wb_sunny_outlined
                    : Icons.dark_mode)),
          ),
          DrawBarBtn(
            color: UsesVar().IsLight() ? Colors.white : Colors.grey[800],
    onTap: (context) {
    Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => SmsPage()));
    },
            leading: Icon(
              Icons.sms,
            ),
            title: Text("HABAR"),
            trailing: Container(),
          ),
          //////////////////////////////////////////
          const Divider(color: Colors.black),
          //////////////////////////////////////////
          Lang(),
          //////////////////////////////////////////
          const Divider(color: Colors.black),
        ],
      ),
    );
  }
}

class Lang extends StatefulWidget {
  @override
  State<Lang> createState() => _LangState();
}

class _LangState extends State<Lang> {
  @override
  Widget build(BuildContext context) {
    return DrawBarBtn(
      color: UsesVar().IsLight() ? Colors.white : Colors.grey[800],
      leading: const Icon(Icons.language),
      title: Text("LANGUAGE"),
      trailing: Container(
        // color: Colors.red,
        // width: 10,
        child: DropdownButton<String>(
          dropdownColor:
              UsesVar().IsLight() ? Colors.grey[300] : Colors.grey[700],
          value: Language,
          icon: Icon(
            Icons.arrow_drop_down_circle_outlined,
            size: 20,
            color: UsesVar().IsLight() ? Colors.green[900] : Colors.green,
          ),
          elevation: 1,
          style: TextStyle(
              color: UsesVar().IsLight() ? Colors.black : Colors.white),
          underline: Container(
            height: 2,
            color: Colors.transparent,
          ),
          onChanged: (String newValue) {
            setState(() {
              Language = newValue;
            });
          },
          items: <String>['TM', 'RU', 'EN']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
      // onTap: () {},
    );
  }
}
