import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final child;
  // double height;
  // double width;
  Color? background = Colors.grey[300];
  Color? bottomShadow = Colors.grey.shade500;
  Color? topShadow  =  Colors.white;
  BorderRadiusGeometry? borderRadiusGeometry = BorderRadius.circular(20);

  NeuBox({Key? key, /*required this.height, required this.width,*/ required this.child,required this.borderRadiusGeometry,required this.background,required this.topShadow,required this.bottomShadow
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height,
      // width: width,
      padding: EdgeInsets.all(4),
      child: child,
      decoration: BoxDecoration(
        // color: Colors.grey[300],
        color: background,
        borderRadius: borderRadiusGeometry,
        boxShadow: [
          //bottom right
          BoxShadow(
            color: bottomShadow!,
            blurRadius: 15,
            offset: Offset(5,5),
          ),

          //top left
          BoxShadow(
            color: topShadow!,
            blurRadius: 15,
            offset: Offset(-5,-5),
          ),
        ],
      ),
    );
  }
}
