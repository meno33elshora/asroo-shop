part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppLoadingHomeState extends AppState {}

class AppGetDataHomeState extends AppState{}

class IsFavouriteState extends AppState{}
class IsFavouriteListState extends AppState{}
class ChangeThemeState extends AppState{}
class SaveDataState extends AppState{}
class GetDataState extends AppState{}


class AddProductToCartState extends AppState{}
class RemoveProductFromCartState extends AppState{}
class RemoveOneProductCartState extends AppState{}
class ClearAllCartState extends AppState{}
class QuantityState extends AppState{}
class AddProductInCartState extends AppState{}
class SearchChangeListState extends AppState{}
class SearchClearListState extends AppState{}
class GetCategoryListState extends AppState{}
class GetCategoryListFailState extends AppState{}
class ChangeLangState extends AppState{}

