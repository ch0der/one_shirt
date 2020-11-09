import 'package:flutter/material.dart';

class BuyShirtPage extends StatefulWidget {
  @override
  _BuyShirtPageState createState() => _BuyShirtPageState();
}

class _BuyShirtPageState extends State<BuyShirtPage> {

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
        sizeRow(),

      ],
    );
  }
  sizeRow(){
    double padding = 20;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShirtMenuIcon(
          button: (){},
          text: 'S',
        ),
        Padding(padding: EdgeInsets.only(left: padding),
        ),
        ShirtMenuIcon(
          button: (){},
          text: 'M',
        ),
        Padding(padding: EdgeInsets.only(left: padding),
        ),
        ShirtMenuIcon(
          button: (){},
          text: 'L',
        ),
        Padding(padding: EdgeInsets.only(left: padding),
        ),
        ShirtMenuIcon(
          button: (){},
          text: 'XL',
        ),
        Padding(padding: EdgeInsets.only(left: padding),
        ),


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

}

class ShirtMenuIcon extends StatefulWidget {
  final VoidCallback button;
  final String text;

  ShirtMenuIcon({@required this.button,@required this.text});

  @override
  _ShirtMenuIconState createState() => _ShirtMenuIconState();
}

class _ShirtMenuIconState extends State<ShirtMenuIcon> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;

        });
        widget.button();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(color:_selected == false? Colors.grey[300] : Colors.yellow[300],),
          child: Center(child: Text(widget.text,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
        ),
      ),
    );
  }
}
