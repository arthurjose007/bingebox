import 'package:flutter/material.dart';
import 'package:netfo/core/utils/coponent/shared/component/widgets/shimmers/shimmerWidgets.dart';

class Searchonloadshimmer extends StatelessWidget {
  const Searchonloadshimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Top Search",
          style: TextStyle(color: Colors.white),
        ),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2.5,
              mainAxisSpacing: 0,
              crossAxisSpacing: 5,
            ),
            itemCount: 8,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(10),
                height: 240,
                width: 130,
                margin: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius:
                      BorderRadius.circular(
                          20),
                      child: ShimmerWidget(
                        height: 240,
                        width: 130,

                      ),
                    ),
                    const SizedBox(width: 40),
                    ShimmerWidget(
                      height: 17,
                      width: 80,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
