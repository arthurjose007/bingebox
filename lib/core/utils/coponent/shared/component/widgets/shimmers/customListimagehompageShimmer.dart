import 'package:flutter/material.dart';

class BrokenImageView extends StatelessWidget {
  int length;
  Size size;

  BrokenImageView({super.key, required this.length, required this.size});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.white.withOpacity(0.2),
                    height: size.height * 0.370,
                    width: size.width * 0.195,
                    child: Center(
                      child: Icon(Icons.broken_image),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
