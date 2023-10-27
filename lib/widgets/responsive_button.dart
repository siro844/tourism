import 'package:flutter/material.dart';
import 'package:tourism/misc/colors.dart';

class ResponsiveButton  extends StatelessWidget {

  bool? isResponsive;
  double? width;
 ResponsiveButton ({super.key,this.width,this.isResponsive=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/button_2.png",color: Colors.white,height: 30,),
        ],
      ),

    );
  }
}