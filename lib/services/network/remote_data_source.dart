import 'package:dio/dio.dart';
import '../../models/get_home_data_model.dart';



const String BaseUrl = 'https://fakestoreapi.com';

abstract class RemoteDataSourceBase {
  Future<List<ProductModel>> getData();
}

class RemoteDataSource implements RemoteDataSourceBase {
  static Dio dio = Dio();

  static initialDio() {
    dio = Dio(BaseOptions(
      baseUrl: BaseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  @override
  Future<List<ProductModel>> getData() async {
    var response = await dio.get("$BaseUrl/products");
    if (response.statusCode == 200) {
      final List json = response.data;
      // return productModelFromJson(json);
      final List<ProductModel> productJson = json
          .map<ProductModel>((jsonModel) => ProductModel.fromJson(jsonModel))
          .toList();
      return productJson;
    } else {
      return throw Exception("Failed Data");
    }
  }

  //
  // Future<List<String?>?> getDataCategories() async {
  //   var response = await dio.get("$BaseUrl/products/categories");
  //   if (response.statusCode == 200) {
  //     final List json = response.data;
  //     // return categoryModelFromJson(json);
  //     final List<String> productJson =  json.map<String>((jsonModel) =>  categoryModelFromJson(jsonModel),).toList();
  //     return productJson;
  //   } else {
  //     return throw Exception("Failed Data");
  //   }
  // }
}
