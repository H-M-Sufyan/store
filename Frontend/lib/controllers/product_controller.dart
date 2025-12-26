import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';

class ProductController extends GetxController {
  final ProductService _productService = ProductService();

  // Loading
  RxBool isLoading = false.obs;

  // Product Lists
  RxList<Product> allProducts = <Product>[].obs;
  RxList<Product> featuredProducts = <Product>[].obs;
  RxList<Product> bestSellers = <Product>[].obs;
  RxList<Product> specialOffers = <Product>[].obs;
  RxList<Product> topRated = <Product>[].obs;
  RxList<Product> newArrivals = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllSections();
  }

  // Fetch everything (Home screen use-case)
  Future<void> fetchAllSections() async {
    try {
      isLoading.value = true;

      allProducts.value = await _productService.getProducts();
      featuredProducts.value =
          await _productService.getFeaturedProducts();
      bestSellers.value = await _productService.getBestSellers();
      specialOffers.value =
          await _productService.getSpecialOffers();
      topRated.value = await _productService.getTopRated();
      newArrivals.value = await _productService.getNewArrivals();
    } catch (e) {
      print("Product fetch error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // Optional: Fetch individually if needed
  Future<void> fetchFeatured() async {
    featuredProducts.value =
        await _productService.getFeaturedProducts();
  }
}
  