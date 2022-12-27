import 'package:flutter/material.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter(
      {Key? key,
      this.numOfItems = 0,
      required this.iconSrc,
      required this.press})
      : super(key: key);

  final Icon iconSrc;
  final int numOfItems;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(50),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              height: height * 0.1,
              width: width * 0.1,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey[300]),
              child: iconSrc,
            ),
            // red circle
            Positioned(
              right: 0,
              child: Container(
                height: height * 0.06,
                width: width * 0.04,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                    child: Text(
                  "$numOfItems",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
