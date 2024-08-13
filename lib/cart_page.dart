import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app2/changenotifyer.dart'; // Make sure this import is correct

class cart_page extends StatelessWidget {
  const cart_page({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<cartProvider>(context).cart; // Move this line inside the build method

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Cart",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final cartItem = cart[index];

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(cartItem['image URL'] as String,
                    ),
                     radius: 30,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                          // to show the dialog when u delete a item
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                "Delete Product",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              content: Text(
                                "Are you sure you want to delete this item",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // removing dialogue box
                                    },
                                    child: const Text(
                                      "Remove",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Provider.of<cartProvider>(context,
                                              listen: false)
                                          .removeProduct(cartItem);
                                          Navigator.of(context).pop();// so that after clicking on delete dialogue box disappears
                                    },
                                    child: const Text("Delete",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold)))
                              ],
                            );
                          });    
                    },
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                  ),
                  title: Text(
                    cartItem['title'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    cartItem['price'] != null
                        ? '\$${cartItem['price']}'
                        : 'No price', // Handle null
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
