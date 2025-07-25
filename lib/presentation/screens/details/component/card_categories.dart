import 'package:bartech_app/data/models/product_category.dart';
import 'package:flutter/material.dart';

class CardCategory extends StatelessWidget {
  final ProductCategory category;
  final VoidCallback onTap;
  const CardCategory({super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: SizedBox(
        width: 300,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: category.imageUrl != null
                  ? Image.network(category.imageUrl!, fit: BoxFit.cover)
                  : Placeholder(fallbackHeight: 80),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                category.categoryItemName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
