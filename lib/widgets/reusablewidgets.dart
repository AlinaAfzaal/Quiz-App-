import 'package:flutter/material.dart';

TextFormField mYTextField(TextEditingController controller, String errorMsg, String hintText )
{
  return TextFormField(
    controller: controller,
    validator: (value) {
      if (value!.isEmpty) {
        return errorMsg;
      }
      return null;
    },
    decoration: InputDecoration(
      fillColor: Colors.white, // White background
      filled: true,
      errorStyle: const TextStyle(color: Colors.grey),
      hintText: hintText,
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
    ),
    cursorColor: Colors.white.withOpacity(0.9),
  );

}


Text myLinkText(String text)
{
  return Text(
    text,
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
      decoration: TextDecoration.underline,
    ),
  );
}

ElevatedButton myElevatedButton(String text, VoidCallback onPressedFun)
{
  return ElevatedButton(
    onPressed: onPressedFun,
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(text,
          style: const TextStyle(
              color: Color(0xff4E5069),
              fontWeight: FontWeight.bold,
              fontSize: 20)),
    ),
    style: ElevatedButton.styleFrom(
      primary: Color(0xffDDDDDE),
    ),
  );
}


ClipRRect myIconButton(IconData icon,Color c, VoidCallback onpressed)
{
  return ClipRRect(
    borderRadius: BorderRadius.circular(50),
    child: TextButton(
        onPressed:onpressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Colors.white),
          overlayColor: MaterialStateProperty.all(
              Colors.white),
        ),
        child: Padding(
          padding:
          EdgeInsets.all( 8.0),
          child: Icon(icon, color: c)
        )),
  );
}
