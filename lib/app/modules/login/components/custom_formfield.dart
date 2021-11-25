import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final Function onSave;
  final String hintText;
  final bool obscureText;
  final String validatorMessage;

  const CustomFormField({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    required this.onSave,
    required this.validatorMessage,
  }) : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  final TextStyle style = const TextStyle(fontFamily: 'Arial', fontSize: 18.0);

  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.obscureText && passwordVisible,
      style: style,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                )
              : null,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: widget.hintText,
        hintStyle: const TextStyle(fontWeight: FontWeight.w300),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.green[400]!, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey[300]!, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.red[200]!, width: 2.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
        ),
      ),
      onSaved: (value) => widget.onSave(value),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.validatorMessage;
        }
        return null;
      },
    );
  }
}
