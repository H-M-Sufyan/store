import 'package:flutter/material.dart';
import 'package:store/constants/colors.dart';
import 'package:store/models/category_model.dart';
import 'package:store/models/featured_model.dart';
import 'package:store/widgets/banner_widget.dart';
import 'package:store/widgets/categories_section.dart';
import 'package:store/widgets/drawer_widget.dart';
import 'package:store/widgets/featured_section.dart';
import 'package:store/widgets/searchbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Categories List
  final categories = [
    CategoryModel(name: "Foods", icon: Icons.fastfood, color: Colors.orange),
    CategoryModel(
      name: "Gifts",
      icon: Icons.card_giftcard,
      color: Colors.purple,
    ),
    CategoryModel(name: "Furniture", icon: Icons.chair, color: Colors.green),
    CategoryModel(
      name: "Fashion",
      icon: Icons.shopping_bag,
      color: Colors.pink,
    ),
    CategoryModel(
      name: "Electronics",
      icon: Icons.electrical_services_rounded,
      color: Colors.orange,
    ),
  ];

  // Featured Product List
  final featuredProducts = [
    FeaturedModel(
      imageUrl: 'assets/images/product1.png',
      name: 'Product One',
      price: '\$25',
      rating: 4.0,
    ),
    FeaturedModel(
      imageUrl: 'assets/images/product2.png',
      name: 'Product Two',
      price: '\$40',
      rating: 5.0,
    ),
    FeaturedModel(
      imageUrl: 'assets/images/product3.png',
      name: 'Product Three',
      price: '\$15',
      rating: 3.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.TextPrimColor),
        backgroundColor: AppColors.PrimColor,
        title: Text(
          "Sufyan's Store",
          style: TextStyle(
            color: AppColors.TextPrimColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
              IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
            ],
          ),
        ],
        centerTitle: true,
      ),
      drawer: DrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                CustomSearchBar(), BannerWidget(), SizedBox(height: 16),

                // Categories
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: AppColors.SecColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                CategoriesSection(categories: categories),
                SizedBox(height: 16),

                // Featured Products
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured Products",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: AppColors.PrimColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                FeaturedSection(featuredList: featuredProducts),
                SizedBox(height: 16),

                // Promotional Green Container
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CO2 - Cable \nMultifunction',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: const [
                                  Text(
                                    'Shop Now',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/images/product2.png',
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),

                // Best Sellers
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Best Sellers",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: AppColors.PrimColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                FeaturedSection(featuredList: featuredProducts),
                SizedBox(height: 16),

                // Promotional Blue Container
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.PrimColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CO2 - Cable \nMultifunction',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: const [
                                  Text(
                                    'Shop Now',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/images/product1.png',
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),

                // New Arrivals
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New Arrivals",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: AppColors.PrimColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                FeaturedSection(featuredList: featuredProducts),
                SizedBox(height: 16),

                // Top Rated Products
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Rated Products",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: AppColors.PrimColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                FeaturedSection(featuredList: featuredProducts),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.PrimColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Orders',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Login'),
        ],
      ),
    );
  }
}
