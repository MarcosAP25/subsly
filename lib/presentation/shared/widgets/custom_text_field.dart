import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTextField extends HookWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key, 
    this.controller, 
    required this.hintText, 
    this.obscureText, 
    this.keyboardType, 
    this.validator, 
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {


   

    final colors = Theme.of(context).colorScheme;
    final isObscured = useState(obscureText ?? false);

     void _toggleObscure() {
      if (obscureText != null) {
       isObscured.value = !isObscured.value;
      }
    }

    final textBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: colors.primary.withAlpha(75), width: 1),
    );

    final decorationStyle = InputDecoration(
      hintText: hintText,
      border: textBorder,
      enabledBorder: textBorder,
      focusedBorder: textBorder.copyWith(
        borderSide: BorderSide(color: colors.primary, width: 1.5),
      ),
      suffixIcon: obscureText != null ? IconButton(
        icon: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Icon(
            isObscured.value ? Icons.visibility_off : Icons.visibility,
            color: colors.primary.withAlpha(150),
          ),
        ),
        onPressed: _toggleObscure,
      ) : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    );




    return TextFormField(
      decoration: decorationStyle,
      controller: controller,
      obscureText: isObscured.value,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
    );
  }
}