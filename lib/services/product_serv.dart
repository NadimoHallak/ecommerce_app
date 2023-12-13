import 'package:dio/dio.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/model/products_model.dart';
import 'package:ecommerce_app/services/base_product_serv.dart';

class ProductServ extends ProductBaseServices {
// TODO: get methods

  @override
  getAllProducts() async {
    Response response = await dio.get(baseUrl);
    dynamic temp = response.data;
    // print(response.data);
    // List<AllProducts> allProducts = List.generate(
    //   temp.length,
    //   (index) => AllProducts.fromMap(temp[index]),
    // );
    // print(allProducts.toString());
    print(temp);

    if (response.data == 200) {
      return response.data;
    } else {
      return [];
    }
  }

  @override
  getAllProductsCategories(String categories) async {
    Response response = await dio.get("$baseUrl/$categories");
    dynamic temp = response.data;

    List<String> allCategories = temp;
    return allCategories;
  }

  @override
  getProductsOfCategory(String categoryName) async {
    Response response = await dio.post("$baseUrl/category/$categoryName");
    dynamic temp = response.data;
    AllProducts allProducts = AllProducts.fromMap(temp);

    return allProducts;
  }

  @override
  getSingleProduct(String id) async {
    Response response = await dio.get("$baseUrl/$id");

    dynamic temp = response.data;

    Product product = temp;

    return product;
  }

  // TODO: create methods
  @override
  createProduct(Product product) async {
    Response response = await dio.post(
      "$baseUrl/add",
      data: product.toJson(),
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dynamic temp = response.data;

    Product rsponseProduct = temp;

    return rsponseProduct;
  }

  //TODO: update method

  @override
  updateProduct(String id, Product product) async {
    Response response = await dio.put(
      "$baseUrl/$id",
      data: product.toJson(),
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );
    dynamic temp = response.data;

    Product rsponseProduct = temp;

    return rsponseProduct;
  }

  // TODO: delete product

  @override
  deleteProduct(String id) async {
    Response response = await dio.delete("$baseUrl/$id");

    dynamic temp = response.data;

    Product rsponseProduct = temp;

    return rsponseProduct;
  }
}
