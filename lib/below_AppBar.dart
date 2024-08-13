import 'package:flutter/material.dart';

class ImagesContainer extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  final String company;
  final Color backgroundcolor;

  const ImagesContainer({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.company,
    required this.backgroundcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundcolor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 15),
            Center(
              child: Image(
                image: AssetImage(image),
                height: 250,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Price: \$$price',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Company: $company',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
