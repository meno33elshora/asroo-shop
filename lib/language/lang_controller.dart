import 'package:get/get.dart';
import 'ar.dart';
import 'en.dart';
import 'fr.dart';

class LangController extends Translations{
  @override
  Map<String, Map<String, String>> get keys =>{
    ene : en,
    ara : ar,
    frf : fr,
  };


  // 'English πΊπΈ', 'Arabic πͺπ¬' , 'France π«π·'
}


String arabic = 'Arabic πΈπ¦';
String english = 'English π¬π§';
String france = 'French π«π·';

String ara = 'ar';
String ene = 'en';
String frf = 'fr';
