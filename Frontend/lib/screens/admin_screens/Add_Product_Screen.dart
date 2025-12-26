import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../models/product_model.dart';
import '../../services/product_service.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController priceCtrl = TextEditingController();
  final TextEditingController imageCtrl = TextEditingController();
  final TextEditingController descriptionCtrl = TextEditingController();
  final ProductService productService = ProductService();

  bool isFeatured = false;
  bool isBestSeller = false;
  bool isSpecialOffer = false;

  void addProduct() async {
    if (_formKey.currentState!.validate()) {
      try {
        Product product = Product(
          name: nameCtrl.text.trim(),
          price: double.parse(priceCtrl.text),
          imageUrl: imageCtrl.text.trim(),
          description: descriptionCtrl.text.trim(), 
          isFeatured: isFeatured,
          isBestSeller: isBestSeller,
          isSpecialOffer: isSpecialOffer,
          rating: 0, 
          soldCount: 0,
        );

        await productService.addProduct(product);

        Get.snackbar(
          "Success",
          "Product Added Successfully",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        _formKey.currentState!.reset();
      } catch (e) {
        Get.snackbar(
          "Error",
          "Failed to add product",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.TextPrimColor
        ),
        title: const Text("Add Product", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: AppColors.PrimColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // PRODUCT NAME
              TextFormField(
                controller: nameCtrl,
                decoration: const InputDecoration(
                  labelText: "Product Name",
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    v!.isEmpty ? "Product name is required" : null,
              ),

              const SizedBox(height: 16),

              // PRICE
              TextFormField(
                controller: priceCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Price",
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v!.isEmpty ? "Price is required" : null,
              ),

              const SizedBox(height: 16),

              // IMAGE URL
              TextFormField(
                controller: imageCtrl,
                decoration: const InputDecoration(
                  labelText: "Image URL",
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v!.isEmpty ? "Image URL is required" : null,
              ),


              const SizedBox(height: 16),
              TextFormField(
                controller: descriptionCtrl,
                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // CHECKBOXES
              CheckboxListTile(
                title: const Text("Featured Product"),
                value: isFeatured,
                onChanged: (v) {
                  setState(() => isFeatured = v!);
                },
              ),

              CheckboxListTile(
                title: const Text("Best Seller"),
                value: isBestSeller,
                onChanged: (v) {
                  setState(() => isBestSeller = v!);
                },
              ),

              CheckboxListTile(
                title: const Text("Special Offer"),
                value: isSpecialOffer,
                onChanged: (v) {
                  setState(() => isSpecialOffer = v!);
                },
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: addProduct,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.PrimColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Add Product",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
