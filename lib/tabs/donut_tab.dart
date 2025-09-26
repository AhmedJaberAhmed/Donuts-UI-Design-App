import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  DonutTab({super.key});

  final List dounuts = [
    ["Ice Cream", "36", Colors.blue, "images/donuts/donut_cream.png"],
    ["Straw berry", "28", Colors.red, "images/donuts/choco.png"],
    ["Grapq Age", "87", Colors.purple, "images/donuts/faro.png"],
    ["Choco", "99", Colors.brown, "images/donuts/moni.png"],
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 2;
    if (screenWidth > 1200) {
      crossAxisCount = 5;
    } else if (screenWidth > 800) {
      crossAxisCount = 3;
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: dounuts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return DonutTile(
          flavor: dounuts[index][0],
          price: dounuts[index][1],
          dcolor: dounuts[index][2],
          imageName: dounuts[index][3],
        );
      },
    );
  }
}

class DonutTile extends StatelessWidget {
  const DonutTile({
    super.key,
    required this.price,
    required this.flavor,
    this.dcolor,
    required this.imageName,
  });

  final String price;
  final String flavor;
  final dcolor;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double titleFontSize = screenWidth < 400 ? 14 : 16;
    double priceFontSize = screenWidth < 400 ? 14 : 18;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: dcolor[100],
      ),
      child: Column(
        children: [
          // Price top-right
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: dcolor[800],
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Text(
                "\$$price",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: priceFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Donut image
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Image.asset(
                imageName,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Donut flavor
          Text(
            flavor,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: titleFontSize,
            ),
          ),

          const SizedBox(height: 4),

          // Subtitle
          Text(
            'Dunkins',
            style: TextStyle(color: Colors.grey[600]),
          ),

          // Bottom actions
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.favorite, color: Colors.pink[400]),
                Icon(Icons.add, color: Colors.grey[800]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
