import 'package:flutter/material.dart';

class BuyShirtPage extends StatefulWidget {
  @override
  _BuyShirtPageState createState() => _BuyShirtPageState();
}

class _BuyShirtPageState extends State<BuyShirtPage> {


  bool sizeSmall;
  bool sizeMedium;
  bool sizeLarge;
  bool sizeXL;

  @override

  void initState() {
    super.initState();

  }



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

  sizeRow() {
    double padding = 20;
    double size = 50;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(alignment: Alignment.center,
        child: smallSizeIcon(),),
        sizeButtonPadding(),
        Align(
          alignment: Alignment.center,
          child: mediumSizeIcon(),
        ),
        sizeButtonPadding(),
        Align(
          alignment: Alignment.center,
          child: largeSizeIcon(),
        ),
      ],
    );
  }
  sizeButtonPadding(){
    return   Padding(
      padding: EdgeInsets.only(left: 20),
    );
  }

  largeSizeIcon(){
    double size = 30;
    return  ShirtMenuIcon(
      isSelected: sizeLarge,
      button: () {
        if(sizeLarge != true){
          setState(() {
            sizeLarge = true;
            sizeMedium = false;
            sizeSmall = false;
            sizeXL = false;
          });
        }else if(sizeLarge == true){
          setState(() {
            sizeLarge = null;
            sizeMedium = null;
            sizeSmall = null;
            sizeXL = null;
          });
        }
      },
      text: 'L',
      size: size,
    );
  }
  smallSizeIcon(){
    double size = 60;
    return  ShirtMenuIcon(
      isSelected: sizeSmall,
      button: () {
        if(sizeSmall != true){
          setState(() {
            sizeSmall = true;
            sizeMedium = false;
            sizeLarge = false;
            sizeXL = false;
          });
        }else if(sizeSmall == true){
          setState(() {
            sizeLarge = null;
            sizeMedium = null;
            sizeSmall = null;
            sizeXL = null;
          });
        }
      },
      text: 'S',
      size: size,
    );
  }
  mediumSizeIcon(){
    double size = 60;
    return  ShirtMenuIcon(
      isSelected: sizeMedium,
      button: () {
        if(sizeMedium != true){
          setState(() {
            sizeMedium = true;
            sizeSmall = false;
            sizeLarge = false;
            sizeXL = false;
          });
        }else if(sizeMedium == true){
          setState(() {
            sizeLarge = null;
            sizeMedium = null;
            sizeSmall = null;
            sizeXL = null;
          });
        }
      },
      text: 'M',
      size: size,
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
  final double size;
  final bool isSelected;

  ShirtMenuIcon(
      {@required this.button, @required this.text, @required this.size,@required this.isSelected});

  @override
  _ShirtMenuIconState createState() => _ShirtMenuIconState();
}

class _ShirtMenuIconState extends State<ShirtMenuIcon> {
  bool _selected = false;
  double circleSize = 50;
  double size = 40;
  double size1 = 45;
  double size2 = 50;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
        widget.button();
      },
      child: ClipOval(
        child: AnimatedContainer(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 250),
          width: widget.isSelected == false? size : widget.isSelected == null? size1 : size2,
          height: widget.isSelected == false? size : widget.isSelected == null? size1 : size2,
          decoration: BoxDecoration(
            color: widget.isSelected ==  true ? Colors.grey[400] : Colors.grey[300] ,
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
