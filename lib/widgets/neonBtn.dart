import 'package:flutter/material.dart';


class NeonBtn extends StatefulWidget {
  // const NeonBtn({Key? key}) : super(key: key);

  @override
  _NeonBtnState createState() => _NeonBtnState();
}

class _NeonBtnState extends State<NeonBtn> {
  @override
  Widget build(BuildContext context) {
    Color shadowCol = Colors.red;
    bool isPressed = false;
    return Container(
      child: Center(
        child: Listener(
          onPointerDown: (_) {
            setState(() {
              isPressed = true;
            });
          },
          onPointerUp: (_) {
            setState(() {
              isPressed = false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  for (double i = 1; i < 5; i++)
                    BoxShadow(
                      color: shadowCol,
                      blurRadius: 3 * i,
                      spreadRadius: -1
                    )
                ]),
            child: TextButton(
              onLongPress: () {
                setState(() {
                  //  isPressed=true;
                });
              },
              onPressed: () {},
              style: TextButton.styleFrom(
                  side: BorderSide(color: Colors.white, width: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: Text(
                "Neon Btn",
                style: TextStyle(fontSize: 50, shadows: [
                  for (double i = 1; i < (isPressed ? 8 : 4); i++)
                    Shadow(color: shadowCol, blurRadius: 3 * i),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
