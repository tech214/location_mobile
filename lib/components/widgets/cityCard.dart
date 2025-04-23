import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  const CityCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Hero(
            tag: "city",
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/jacques-bopp-Hh18POSx5qk-unsplash.jpg"
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Stack(
                    children: [
                      Positioned(
                          left: 10,
                          bottom: 20,
                          child: Text(
                            "citY Name",
                          )
                      )
                    ]
                )
            )
        )
    );
  }
}