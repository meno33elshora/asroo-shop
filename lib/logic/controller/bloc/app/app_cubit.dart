import 'package:asroo/services/cache/cache_helper.dart';
import 'package:asroo/utils/theme.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../language/lang_controller.dart';
import '../../../../models/get_home_data_model.dart';
import '../../../../services/network/remote_data_source.dart';
import '../../../../view/pages/main_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  final productList = <ProductModel>[];
  var favouriteList = <ProductModel>[];
  Map<dynamic, dynamic> isFavMap = {};
  bool isFavourite = false;
  bool isCart = false;
  ProductModel? productModel;
  var storage = GetStorage();
  Map<dynamic, dynamic> productMap = {};
  var langLocal = ene;
  var address = 'Your Address';


  List<ProductModel> searchList = <ProductModel>[];

  List<String> categoryString = <String>[];
  bool isCategoryLoaded = false;

  void onSavedFavouriteList() {
    List? storedShopping = storage.read<List>('isFavouritesList');
    if (storedShopping != null) {
      favouriteList = storedShopping
          .map<ProductModel>((e) => ProductModel.fromJson(e))
          .toList();
    }
  }

  // void _saveProduct(List<ProductModel> productModel) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   List<String> personsEncoded = productModel.map((person) => jsonEncode(person.toJson())).toList();
  //     await sharedPreferences.setStringList('addFavourite', personsEncoded).then((value) {print("done");});
  //     emit(SaveDataState());
  // }

  // void _getProduct(List<ProductModel> productModel) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   productModel.map((person) => jsonDecode(person.toString())).toList();
  //   sharedPreferences.getStringList('addFavourite');
  //   emit(SaveDataState());
  // }

  void getData() async {
    emit(AppLoadingHomeState());
    var product = await RemoteDataSource().getData();
    try {
      if (product.isNotEmpty) {
        productList.addAll(product);
      }
    } finally {
      emit(AppGetDataHomeState());
    }
  }

  void addFavouriteList(int productId) async {
    var index = favouriteList.indexWhere((element) => element.id == productId);

    if (index >= 0) {
      favouriteList.removeAt(index);
      Get.snackbar('Delete Item', 'Oops..',
          backgroundColor: Colors.white,
          colorText: Colors.redAccent,
          margin: const EdgeInsets.all(10.0));
      await storage.remove("isFavouritesList");
    } else {
      var productItem =
          productList.firstWhere((element) => element.id == productId);
      favouriteList.add(productItem);
      Get.snackbar('Done Add Item', 'Add More Products in Fav',
          backgroundColor: Colors.white,
          colorText: Get.isDarkMode ? pinkClr : mainColor,
          margin: const EdgeInsets.all(10.0));
      await storage.write("isFavouritesList", favouriteList);
      emit(SaveDataState());
    }
    emit(IsFavouriteListState());
  }

  /// bool toggle between two icon
  bool isFavouriteItem(int productId) {
    return favouriteList.any((element) => element.id == productId);
  }

  void changeMode() {
    Get.isDarkMode
        ? Get.changeThemeMode(ThemeMode.light)
        : Get.changeThemeMode(ThemeMode.dark);
    emit(ChangeThemeState());
  }

  void addProductInCart(ProductModel productModel) {
    if (productMap.containsKey(productModel)) {
      productMap[productModel] += 1;
    } else {
      productMap[productModel] = 1;
    }
    emit(AddProductInCartState());
  }

  void addProductToCart(ProductModel productModel) {
    if (productMap.containsKey(productModel) && productMap[productModel] >= 1) {
      productMap[productModel] >= 1;
    } else {
      productMap[productModel] = 1;
    }
    Get.snackbar('Added Successfully.. ', 'Come Add Item',
        backgroundColor: Colors.white,
        colorText: mainColor,
        margin: const EdgeInsets.all(10.0));
    // isCart = !isCart;
    // productMap[productModel] = ! productMap[productModel];
    emit(AddProductToCartState());
  }

  get productSubtotal =>
      productMap.entries.map((e) => e.key.price * e.value).toList();

  get productTotal => productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  // get boolCart => productMap.entries.map((e) => e.value).toList().add(productModel);

  void removeProductFromCart(ProductModel productModel) {
    if (productMap.containsKey(productModel) && productMap[productModel] == 1) {
      productMap.removeWhere((key, value) => key == productModel);
    } else {
      productMap[productModel] -= 1;
    }
    emit(RemoveProductFromCartState());
  }

  void removeOneProduct(ProductModel productModel) {
    productMap.removeWhere((key, value) => key == productModel);
    emit(RemoveOneProductCartState());
  }

  void clearAllProduct() {
    Get.defaultDialog(
      title: 'Clear All List Cart.!!',
      titleStyle: TextStyle(
        fontSize: 16,
        color: Get.isDarkMode ? pinkClr : mainColor,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need clear product ? ',
      middleTextStyle: TextStyle(
        fontSize: 16,
        color: Get.isDarkMode ? pinkClr : mainColor,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.white,
      textCancel: 'No',
      textConfirm: 'Yes',
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
      cancelTextColor: Get.isDarkMode ? pinkClr : mainColor,
      contentPadding: const EdgeInsets.all(10.0),
      onCancel: () {
        Navigator.pop;
      },
      onConfirm: () {
        productMap.clear();
        Get.offAll(() => const MainScreen());
      },
    );
    emit(ClearAllCartState());
  }

  int quantity() {
    if (productMap.isEmpty) {
      return 0;
    } else {
      return productMap.length;
    }
  }

  void searchToList(String searchName) {
    searchName = searchName.toLowerCase();
    searchList = productList.where((element) {
      return element.title.contains(searchName) ||
          element.price.toString().contains(searchName);
    }).toList();

    emit(SearchChangeListState());
  }

  void clearSearch() {
    searchToList('');
    emit(SearchClearListState());
  }

  // void getCategory()async{
  //  var categoryNames =   RemoteDataSource().getDataCategories() as List<String>;
  //
  //  try{
  //      isCategoryLoaded = true;
  //      categoryString.addAll(categoryNames);
  //
  //    emit(GetCategoryListState());
  //  }finally{
  //    isCategoryLoaded = false;
  //    emit(GetCategoryListFailState());
  //  }
  // }

  void saveLang(String lang) async{
    await CacheHelper.saveData(key: 'lang', value: lang);
  }
  Future<String> get getLang async { return await CacheHelper.getData(key: 'lang');}
  void changeLang(String lang) {
    // Get.updateLocale( Locale( lang));
    saveLang(lang);
    if(langLocal  == lang){
      return ;
    }else if(lang == frf){
      langLocal = frf;
      saveLang(lang);
    // }else if(lang == ene){
    //   langLocal = ene;
    //   saveLang(lang);
    }else if(lang == ara){
      langLocal = ara;
      saveLang(lang);
    }else{
      langLocal = ene;
      saveLang(lang);
    }
    emit(ChangeLangState());
  }

  Future<void> updatePosition() async {
    Position position = await _determinePosition();
    List<Placemark> placeMarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placeMarks[0];

    address = "${place.country},${place.street}";
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

@override
  void onChange(Change<AppState> change) async{
   langLocal = await getLang;
    super.onChange(change);
  }
}
