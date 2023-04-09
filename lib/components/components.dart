import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planetapp/models/plants.dart';

AnimatedContainer animatedContainer(
    {required String image,
    required String icon,
    required String text,
    required bool plants,
    // required Plants index,
    required BuildContext context,
    required Widget widget}) {
  return AnimatedContainer(
    margin: plants
        ? const EdgeInsetsDirectional.only(end: 10)
        : const EdgeInsetsDirectional.only(end: 30),
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    child: container(
        image: image,
        icon: icon,
        text: text,
        // index: index,
        context: context,
        widget: widget),
  );
}

Widget container(
    {required String image,
    required String icon,
    required String text,
    // required Plants index,
    required BuildContext context,
    required Widget widget}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
    },
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 2.3),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 4),
        child: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(20)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 4,
            top: 4,
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 14,
              child: Image.asset(
                icon,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.5),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ]),
      ),
    ),
  );
}

Widget containerPopular({
  required String image,
  required String icon,
  required String text,
  required String text2,
}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 180,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 2.3),
          borderRadius: BorderRadius.circular(20)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        SizedBox(
          height: 70,
          width: 70,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text2,
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 14,
                  child: Image.asset(
                    icon,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ]),
    ),
  );
}
