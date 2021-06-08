import 'dart:ui';

import 'package:flutter/material.dart';

class ModalProgress extends StatelessWidget {
  /* 
  Widget de loading, feedback visual enquanto a nova tela não carregar
   */
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromRGBO(0, 0, 0, 0.2),
      child: Center(
        child: Container(
          width: 100,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.green[400],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(blurRadius: 3, color: Colors.black26),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(backgroundColor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
