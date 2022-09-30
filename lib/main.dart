import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketapp/pages/Scaffold_all.dart';
import 'package:marketapp/pages/mainPage.dart';
import 'package:provider/provider.dart';
import 'Connect.dart';
import 'Public.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UsesVar().createSharedPObj();
  runApp(ChangeNotifierProvider<UsesVar>(
      create: (BuildContext context) => UsesVar(), child: MyApp()));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,//Colors.green[900],
      // statusBarIconBrightness: Brightness.light,
      //   statusBarBrightness: Brightness.dark,
    ),
  );
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

Provider.of<UsesVar>(context,listen: false).loadSharedP();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<UsesVar>(context).useThem(),
      home: Container(
        color: UsesVar().IsLight()?Colors.white:Colors.grey[800],
        width: screenWidth,
        height: screenHeight,
        child: Connect_api(
            URL: "http://${IP}/api/imgs",
            Return: Connect_api(
                URL: "http://${IP}/api/categories",
                Return:Connect_api(
                    URL: "http://${IP}/api/ps",
                    Return: Scaflod_all(
                      body: MainPage(),
                      EnableMenu: true,
                    ),
                    LIndex: 5),
                LIndex: 1),
            LIndex: 0),
      ),
    );
  }
}
