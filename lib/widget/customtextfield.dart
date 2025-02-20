import 'package:donation/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  final Icon? icons;
  final int? maxlength;
  final int? maxline;
  final TextInputType? textinputtype;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validation;
  final String? labeltxt;
  final dynamic ontap;
  final bool? obscureText;
  final dynamic onChanged;

  const CustomFormField({
    super.key,
    this.labeltxt,
    this.validation,
    this.controller,
    this.textinputtype,
    this.maxline,
    this.maxlength,
    this.icons,
    this.onChanged,
    this.ontap,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator:validation,
        keyboardType:textinputtype,
        maxLines:maxline ?? 1,
        obscureText:obscureText ?? false, // Default to false if not provided
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxlength),
        ],
        onChanged:onChanged,
        decoration: InputDecoration(
          suffixIcon:ontap != null
              ? GestureDetector(
                  onTap:ontap,
                  child:icons,
                )
              : null,
          suffixIconColor: Colours.lightRed,
          labelStyle: TextStyle(
            fontSize: 14,
            color: const Color.fromARGB(162, 0, 0, 0)     ,   fontWeight: FontWeight.w500,
          ),
          labelText:labeltxt,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colours.lightRed,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colours.lightRed),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colours.lightRed,
            ),
          ),
        ),
      ),
    );
  }
}