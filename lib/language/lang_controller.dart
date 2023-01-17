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


  // 'English 🇺🇸', 'Arabic 🇪🇬' , 'France 🇫🇷'
}


String arabic = 'Arabic 🇸🇦';
String english = 'English 🇬🇧';
String france = 'French 🇫🇷';

String ara = 'ar';
String ene = 'en';
String frf = 'fr';
