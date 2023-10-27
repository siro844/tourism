import 'package:flutter/material.dart';
import 'package:tourism/misc/colors.dart';
import 'package:tourism/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  final Color bgColor;
  double size;
  bool isIcon;
  final Color borderColor;
 AppButton({super.key,this.isIcon=false, this.icon,this.text,required this.color, required this.bgColor, required this.borderColor,required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
                              width: size,
                              height: size,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: borderColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(15),
                                color: bgColor,
                              ),
                              child: isIcon==false?
                              Center(
                                child: AppText(text: text!,
                                color: color,
                                ),
                              )
                              :Icon(icon,color: color,),
                          );
  }
}