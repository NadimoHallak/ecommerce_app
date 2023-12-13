import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/services/base/base_service.dart';

abstract class ProductBaseServices extends BaseServices {
  //! get methods
  getAllProducts();
  getSingleProduct(String id);
  getAllProductsCategories(String categories);
  getProductsOfCategory(String categoryName);

  //! create methods
  createProduct(Product product);

  //! update methd

  updateProduct(String id, Product product);

  //! delete method

  deleteProduct(String id);
}
