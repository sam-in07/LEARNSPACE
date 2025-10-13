
import 'package:flutter/material.dart';

class CustomerTextFeild extends StatelessWidget {
 final TextEditingController controller  ;
 final String hintText;
 final Widget ? prefixWidget ;
 final bool  obscureText ;
   CustomerTextFeild({super.key, required this.controller, required this.hintText,  this.prefixWidget,  this.obscureText = false});
   //widget ba icon sobujate thakbe na oijnno "requried" hobe na .. oijnno ...."final Widget ? prefixWidget ;"  ? hobe

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   // throw UnimplementedError();
    return   TextFormField(
      controller: controller,
      style: TextStyle(
        fontSize: 18 ,
        color: Colors.redAccent,
      ),
      obscureText: obscureText ,
      decoration:
      InputDecoration(
        hintText: hintText ,
        hintStyle: TextStyle(
          color: Colors.amberAccent,
          fontSize: 18,
        ),

        fillColor: Colors.blue[50],
        filled: true,
        prefixIcon: prefixWidget ,
        labelText: "Email",
        enabledBorder:
        OutlineInputBorder(

        ),
        focusedBorder: OutlineInputBorder(

        ),

      ),
    );
  }

}

