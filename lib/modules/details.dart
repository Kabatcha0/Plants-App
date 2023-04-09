import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:planetapp/models/plants.dart';

class Details extends StatelessWidget {
  Plants plants;
  Details({required this.plants});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: SizedBox(
                child: Image.asset(plants.imagePath,
                    width: double.infinity, fit: BoxFit.cover),
              )),
              Expanded(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                            text: TextSpan(
                                children: [
                              TextSpan(
                                  text: " (Office Plant)",
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold))
                            ],
                                text: plants.name,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                        Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green),
                            child: Image.asset(
                              "assets/icons/heart.png",
                              color: Colors.white,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      plants.description,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 17, color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Treatment",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 35,
                          height: 35,
                          child: Image.asset(
                            'assets/icons/sun.png',
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(
                          width: 35,
                          height: 35,
                          child: Image.asset(
                            'assets/icons/drop.png',
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(
                          width: 35,
                          height: 35,
                          child: Image.asset(
                            'assets/icons/temperature.png',
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(
                          width: 35,
                          height: 35,
                          child: Image.asset(
                            'assets/icons/up_arrow.png',
                            color: Colors.green,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 23,
                      color: Colors.green,
                    )),
                Image.asset(
                  "assets/icons/cart.png",
                  color: Colors.green,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                  ),
                  color: Colors.green),
              child: const Text("Treatment",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal)),
            ),
          )
        ],
      ),
    ));
  }
}
