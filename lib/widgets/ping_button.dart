import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.title,
    this.onCallback,
    this.width = 0.4,
    this.height = 50.0,
  }) : super(key: key);

  final VoidCallback? onCallback;
  final String? title;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * width!,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          primary: const Color.fromRGBO(57, 118, 195, 1),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                title!,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        onPressed: onCallback,

      ),
    );
  }
}
