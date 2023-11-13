import 'package:flutter/material.dart';
import 'package:tailor_size/statics/statics.dart';

class ProfileCategorySelector extends StatelessWidget {
  const ProfileCategorySelector({
    super.key, required this.image, this.onTap,
  });

  final String image;
   final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Stack(
          children: [
            Image.asset(image),
            Container(
              height: 64,
              width: 77,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(.2),
              ),
            ),
            // Center(child: Icon(Icons.check, color: Colors.green,),)
            const Icon(Icons.check, color: Colors.green, size: 30,)
          ],
        ),
      ),
    );
  }
}
