import 'package:flutter/material.dart';
import 'package:learnsphere/widgets/app_text_style.dart';
import 'package:learnsphere/widgets/colors.dart';



class PrimaryButton extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final Color color;
  final Color? borderColor;
  final String title;
  final TextStyle? textStyle;
  final Function()? onTap;

  const PrimaryButton({
    super.key,
    required this.height,
    required this.width,
    required this.radius,
    required this.color,
    required this.title,
    this.borderColor,
    this.textStyle,
    required this.onTap,
  });
  // Note: No body {} here

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color ?? AppColors.appButtonColor, // Assuming AppColors is defined elsewhere
          border : Border.all(
            color: borderColor ?? Colors.transparent,
          ),
        ),
        child: Center(
          child: Text(
            title, // Removed the null check here as title is required
            style: textStyle ?? AppTextstyle.textStyle22WideW300,
          ),
        ),

      ),
    );
  }
}