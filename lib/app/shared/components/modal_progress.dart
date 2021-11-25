import 'package:flutter/material.dart';

class ModalProgress extends StatelessWidget {
  const ModalProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0, 0, 0, 0),
      child: Center(
        child: Container(
          width: 100,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.green[400],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              const BoxShadow(
                blurRadius: 3,
                color: Colors.black26,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              CircularProgressIndicator(backgroundColor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
