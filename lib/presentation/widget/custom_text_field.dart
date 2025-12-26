import 'package:flutter/material.dart';
class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    this.text,
    this.controller,
    this.onChanged,
    this.suffixIcon,
    this.validator,
    this.isPassword = false,
    this.hintText = "",
  });

  final String? text;
  final TextEditingController? controller;
  void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isPassword;
  final String hintText;
  final Widget? suffixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          if(widget.text!=null&&widget.text!.isNotEmpty)...[
            Text(
              widget.text!,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: "Times",
              ),
            ),
            SizedBox(height: 5),
        ],
        TextFormField(
          obscureText: widget.isPassword ? !isVisible : false,
          controller: widget.controller,
          onChanged: widget.onChanged,
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      isVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      isVisible = !isVisible;
                      setState(() {});
                    },
                  )
                : widget.suffixIcon,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
