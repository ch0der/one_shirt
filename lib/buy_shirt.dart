import 'package:flutter/material.dart';

class BuyShirtPage extends StatefulWidget {
  @override
  _BuyShirtPageState createState() => _BuyShirtPageState();
}

class _BuyShirtPageState extends State<BuyShirtPage> {
  Color buttonColor = Colors.blue;
  Color selected = Colors.green;
  Color unselected = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: shirtPic(),
        ),

        detailButton(),
      ],
    );
  }

  shirtPic() {
    String photo = "assets/images/gshirt.png";
    return Hero(
      tag: photo,
      child: Container(
        height: 350,
        width: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(photo),
          ),
        ),
      ),
    );
  }
  detailButton(){
    Color color = unselected;
    return GestureDetector(
      onTap: () {
        setState(() {
          unselected = selected;
        });
        print(color);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(color: color),
        child: Text('test'),
      ),
    );
  }
  detailButton2(){
    Color color;
    return Container(
      child:  ShirtMenuIcon(
        color: color,
        button: (){
          setState(() {
            b
          });
        },
      ),
    );
  }

}

class ShirtMenuIcon extends StatefulWidget {
  final VoidCallback button;
  final Color color;

  ShirtMenuIcon({@required this.button,@required this.color});

  @override
  _ShirtMenuIconState createState() => _ShirtMenuIconState();
}

class _ShirtMenuIconState extends State<ShirtMenuIcon> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        widget.button();
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(color:widget.color),
        child: Text('test'),
      ),
    );
  }
}
