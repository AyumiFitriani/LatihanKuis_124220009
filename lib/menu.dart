import 'package:flutter/material.dart';
import 'dummy_menu.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Menentukan jumlah kolom berdasarkan lebar layar
          int crossAxisCount;
          double width = constraints.maxWidth;

          if (width >= 1200) {
            crossAxisCount =
                5; // Untuk layar besar, seperti web atau tablet landscape
          } else if (width >= 800) {
            crossAxisCount =
                4; // Untuk layar menengah, seperti tablet portrait atau desktop kecil
          } else if (width >= 600) {
            crossAxisCount = 3; // Untuk layar tablet kecil
          } else {
            crossAxisCount = 2; // Untuk layar mobile
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.7,
            ),
            itemCount: foodMenuList.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final FoodMenu menu = foodMenuList[index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 10, // Bagian gambar menempati 2/3 dari tinggi card
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15)),
                        child: Image.network(
                          menu.imageUrls[0],
                          width: double.infinity,
                          fit: BoxFit
                              .cover, // Menyesuaikan gambar agar proporsional
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            menu.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Category: ${menu.category}",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            menu.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Ingredients: ${menu.ingredients}",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Cooking Time: ${menu.cookingTime}",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Price: ${menu.price}",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
