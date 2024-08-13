import 'package:flutter/material.dart';
import 'package:shopping_app2/Global_variables.dart';
import 'package:shopping_app2/below_AppBar.dart';
import 'package:shopping_app2/details_page.dart';
import 'package:shopping_app2/filters.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  String selectedCategory = 'Cricket';

  void updateCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> products;
    switch (selectedCategory) {
      case 'Badminton':
        products = badminton;
        break;
      case 'Soccer':
        products = soccer;
        break;
      case 'Tennis':
        products = tennis;
        break;
      case 'Cricket':
      default:
        products = cricket;
        break;
    }

    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(100, 100, 100, 1)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(25)),
    );

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Sports\nCollection",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
            child: Filters(
              selectedFilter: selectedCategory,
              onFilterChanged: updateCategory,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailsPage(product: product);
                        },
                      ),
                    );
                  },
                  child: ImagesContainer(
                    backgroundcolor: index.isEven
                        ? const Color.fromRGBO(216, 240, 253, 1)
                        : const Color.fromRGBO(245, 247, 249, 1),
                    image: product['image URL'] as String,
                    title: product['title'] as String,
                    price: double.parse(product['price'] as String),
                    company: product['company name'] as String,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
