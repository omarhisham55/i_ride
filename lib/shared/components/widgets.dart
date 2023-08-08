import 'package:flutter/material.dart';
import '../styles/colors.dart';

class IRideButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final double? buttonBorderRadius;
  final EdgeInsets? textPadding;
  const IRideButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor,
    this.buttonTextColor,
    this.buttonBorderRadius, this.textPadding,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      minWidth: double.infinity,
      color: buttonColor ?? IRideColors.primaryColor,
      child: Padding(
        padding: textPadding ?? const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          buttonText,
          style: TextStyle(
            color: buttonTextColor ?? Colors.white,
            fontFamily: "Cairo",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class IRideFormFeild extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? type;
  final String? Function(String?)? validator;
  final Function(String?)? onSubmit;
  final TextAlignVertical? textVerticalAlign;
  final bool? isPassword;
  final Color? backgroundColor;
  final TextStyle? titleStyle;
  const IRideFormFeild({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.prefix,
    this.suffix,
    this.type,
    this.validator,
    this.onSubmit,
    this.textVerticalAlign,
    this.isPassword,
    this.backgroundColor,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: titleStyle ??
              Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(letterSpacing: 1.0),
        ),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          decoration: BoxDecoration(
            color: backgroundColor ?? IRideColors.darkColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: type,
            validator: validator,
            onFieldSubmitted: onSubmit,
            textAlignVertical: textVerticalAlign,
            obscureText: isPassword ?? false,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10.0),
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              prefixIcon: prefix,
              suffixIcon: suffix,
            ),
          ),
        ),
      ],
    );
  }
}

class IRideBookingFormFeild extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? type;
  final String? Function(String?)? validator;
  final Function(String?)? onSubmit;
  final TextAlignVertical? textVerticalAlign;
  final bool? isPassword;
  final Color? backgroundColor;
  const IRideBookingFormFeild({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.prefix,
    this.suffix,
    this.type,
    this.validator,
    this.onSubmit,
    this.textVerticalAlign,
    this.isPassword,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validator,
      onFieldSubmitted: onSubmit,
      textAlignVertical: textVerticalAlign,
      obscureText: isPassword ?? false,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 10.0),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: IRideColors.lightDarkColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: IRideColors.lightDarkColor),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: IRideColors.lightDarkColor),
        ),
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
    );
  }
}

Widget textSpanSecondButton({
  required BuildContext context,
  required String firstText,
  required String secondText,
  required Function() onPressed,
  TextStyle? firstStyle,
  TextStyle? secondStyle,
}) =>
    Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        Text(
          firstText,
          style: firstStyle,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            secondText,
            style: secondStyle,
          ),
        ),
      ],
    );
