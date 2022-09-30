import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


const String IP="192.168.23.1";
/*172.16.11.179*/
/*192.168.23.1*/

double screenWidth = 100, screenHeight = 10;
String Language = "TM";
int selectScrol = 0;
int inCategoriId = 0;
int NavBar_activ;
bool IsSepet = false;
int SeperNum = 0;
bool IsLike = false;
int LikeNum = 0;
String addtime;
double Dostawka=5.0;

List GaleryList = [],
    CategoriesList = [],
    InCategoriesList = [],
    ProductsList = [],
    NewList=[],
    MyBasket=[],
    MyLike=[],
    MyBaskets=[],
    AllProducts=[];

class BasketElement{
 final int id,num,sale;
 final double price,old;
 final String img,ThatDate;
 BasketElement({this.id,this.num,this.price=0.0,this.img,this.sale,this.old=0.0,this.ThatDate});
}

class BBoxSh{
  final double num;
  final Color col;
  BBoxSh({this.num=2.0,this.col});

List<BoxShadow>BBSh(){
  return [BoxShadow(
      color: col==null?Color(0xffC3C3C3):col,
      offset: Offset(num, num),
      blurRadius: 3,
      spreadRadius: 0.5),
    BoxShadow(
        color: col==null?Color(0xffC3C3C3):col,
        offset: Offset(-num, -num),
        blurRadius: 3,
        spreadRadius: 0.5)];
}

}

/*TextStyle===================================================================*/
TextStyle stlGreen = TextStyle(color: Colors.green, fontFamily: "Itim"),
    stlFont = TextStyle(color: Colors.red, fontFamily: "Arciform"),
    stlInCategori = TextStyle(fontFamily: "Itim", fontSize: screenWidth * 0.05);

/*!TextStyle==================================================================*/
/*ThemeDate===================================================================*/
//light+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ThemeData _LightThem = ThemeData(
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: Colors.black,
      // displayColor: Colors.blue,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey[500]),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(60)),
          borderSide: BorderSide(color: Colors.green)
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(60)),
          borderSide: BorderSide(color: Colors.grey[500])
      ),
    ),
    canvasColor: Colors.white,
    primarySwatch: Colors.green,
    appBarTheme: AppBarTheme(color: Colors.white,iconTheme: IconThemeData(color: Colors.green)),
    accentIconTheme: IconThemeData(color: Colors.black));
Color LightCategori = Colors.white;
Color LightDot = Colors.green[900];
//!light++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//dark+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ThemeData _DarkThem = ThemeData(
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: Colors.white,
      //   displayColor: Colors.blue,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey[400]),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(60)),
          borderSide: BorderSide(color: Colors.blue)
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(60)),
          borderSide: BorderSide(color: Colors.grey[400])
      ),
    ),
    canvasColor: Colors.grey[800],
    primarySwatch: Colors.blue,
  //  primaryColorDark: Colors.red,
    appBarTheme: AppBarTheme(color: Colors.grey[900],iconTheme: IconThemeData(color: Colors.green)),
    accentIconTheme: IconThemeData(color: Colors.white));

Color DarkCategori = Colors.grey[800];
Color DarkDot = Colors.lightBlueAccent;

//!dark++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/*!ThemeDate==================================================================*/
int changeScrol(index, id) {
  selectScrol = index;
  inCategoriId = id;
  // notifyListeners();
}
bool _LightMod=true ;
class UsesVar with ChangeNotifier {

  static SharedPreferences _sharedPObj;
  Future<void> createSharedPObj()async{
    _sharedPObj=await SharedPreferences.getInstance();
  }

  void saveSharedP(bool value){
    _sharedPObj.setBool("ThemeD", value);
  }

  void loadSharedP(){
    _LightMod = _sharedPObj.getBool("ThemeD")??true;
/*    if(_sharedPObj.getBool("ThemeD")==null)
      {_LightMod=true;}
    else {
      _LightMod = _sharedPObj.getBool("ThemeD");
    }*/
  }

  ThemeData useThem() {
    return _LightMod ? _LightThem : _DarkThem;
  }

  void changeThem() {
    _LightMod = !_LightMod;
    saveSharedP(_LightMod);
    notifyListeners();
    // print("${_LightMod}");
  }

  bool IsLight() {
    return _LightMod;
  }

  int changeScrol(index, id) {
    selectScrol = index;
    inCategoriId = id;
    notifyListeners();
  }

  int selScrol() {
    return selectScrol;
  }

  int inCategoriID() {
    return inCategoriId;
  }

  int navBar_act_change(num) {
    NavBar_activ = num;
    notifyListeners();
  }

  int navBar_act() {
    return NavBar_activ;
  }

  bool IsSepetDate() {
    return IsSepet;
  }

  bool IsLikeDate() {
    return IsLike;
  }

  void trueSepetDate() {
    IsSepet = true;
    notifyListeners();
  }

  void trueLikeDate() {
    IsLike = true;
    notifyListeners();
  }

  void falseSepetDate() {
    IsSepet = false;
    notifyListeners();
  }

  void falseLikeDate() {
    IsLike = false;
    notifyListeners();
  }

  int getSepetNum() {
    return SeperNum;
  }
  int getLikeNum() {
    return LikeNum;
  }

  void AddLike() {
   LikeNum = MyLike.length;
    notifyListeners();
  }

  void AddSepet() {
    SeperNum = MyBasket.length;
    notifyListeners();
  }

  void SepetEmpety() {
    SeperNum = 0;
  }
  double sum=0.0;
void PPriceSum(){
  sum=0;
    MyBasket.forEach((element) { sum+=element.price*element.num;});
    notifyListeners();
}

  void oldPPriceSum(OldMyBasket){
    sum=0;
    OldMyBasket.forEach((element) { sum+=element.price*element.num;});
    notifyListeners();
  }

double getSum() {
    return sum;
  }

  void changeDostawka(double num){
    Dostawka=num;
    notifyListeners();
  }

  double getDostavka() {
    return Dostawka;
  }

}

/*class UsesFunctions {
  Future<List> getDate(String api) async {
    final response = await http.get(api);
    return json.decode(response.body);
  }
}*/
