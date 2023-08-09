import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';

class CategeriesHorizontalListViewbar extends StatelessWidget {
  const CategeriesHorizontalListViewbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: kAppBarHeight * 1.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      categoryLogos[index],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(categoriesList[index]),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
