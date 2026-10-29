import 'package:arc_raiders_guide_task2/constants.dart';
import 'package:arc_raiders_guide_task2/data/models/item.dart';
import 'package:arc_raiders_guide_task2/theme.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    final rarityColor = rarityColors[item.rarity.trim().toLowerCase()];

    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(left: 10),
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Colors.grey.shade900, AppColors.backgroundColor],
          center: Alignment.center,
          radius: 2,
        ),
        border: rarityColor == null
            ? null
            : Border(bottom: BorderSide(color: rarityColor, width: 3)),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryCyan.withValues(alpha: 0.4),
            blurRadius: 6,
            spreadRadius: 2,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                tag: item.id.toString(),
                child: Image.network(item.imageUrl, width: 80, height: 80),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  item.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: ClipPath(
              clipper: _CornerTriangleClipper(),
              child: Container(width: 30, height: 30, color: rarityColor),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: ClipPath(
              clipper: _CornerTriangleClipper(),
              child: Container(
                width: 40,
                height: 40,
                color: rarityColor?.withValues(alpha: 0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CornerTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const radius = 10.0;

    return Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width, size.height - radius)
      ..quadraticBezierTo(
        size.width,
        size.height,
        size.width - radius,
        size.height,
      )
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
