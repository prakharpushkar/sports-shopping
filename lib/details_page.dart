import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app2/changenotifyer.dart';

class DetailsPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const DetailsPage({super.key, required this.product});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int _quantity = 1;

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Details",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Center(
                child: Text(' ${widget.product['title'] as String}',
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              const SizedBox(height: 20),
              Image(
                image: AssetImage(widget.product['image URL'] as String),
                height: 250,
                width: 250,
              ),
              const SizedBox(height: 20),
              Text(
                widget.product['description'] as String,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              Container(
                height: 100,
                width: 500,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(216, 240, 253, 1),
                ),
                child: Column(children: [
                  Text('\$ ${widget.product['price']}',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: _decrement,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '$_quantity',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: _increment,
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () {
                          Provider.of<cartProvider>(context, listen: false)
                              .addProduct({
                            'title': widget.product['title'],
                            'price': widget.product['price'],
                            'company name': widget.product['company name'],
                            'image URL': widget.product['image URL'],
                            'description': widget.product['description'],
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Added successfully to the cart"),
                            ),
                          );
                        },
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            minimumSize: const Size(50, 50)),
                      ),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
