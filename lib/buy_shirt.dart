import 'package:flutter/material.dart';

class BuyShirtPage extends StatefulWidget {
  @override
  _BuyShirtPageState createState() => _BuyShirtPageState();
}

class _BuyShirtPageState extends State<BuyShirtPage> {
  List<BuyButtonModel> sampleSizeData = List<BuyButtonModel>();
  List<BuyButtonModel> sampleColorData = List<BuyButtonModel>();
  Color _shirtColor = Colors.grey;
  String testShirt = 'assets/images/logo.png';


  @override
  void initState() {
    super.initState();


    sampleSizeData.add(BuyButtonModel(isSelected: false, text: 'S'));
    sampleSizeData.add(BuyButtonModel(isSelected: false, text: 'M'));
    sampleSizeData.add(BuyButtonModel(isSelected: false, text: 'L'));
    sampleSizeData.add(BuyButtonModel(isSelected: false, text: 'XL'));
    sampleSizeData.add(BuyButtonModel(isSelected: false, text: '2XL'));

    sampleColorData.add(BuyButtonModel(isSelected: false,text: ' ',color: Colors.blue[300]));
    sampleColorData.add(BuyButtonModel(isSelected: false,text: ' ',color: Colors.green[400]));
    sampleColorData.add(BuyButtonModel(isSelected: false,text: ' ',color: Colors.red[300]));
    sampleColorData.add(BuyButtonModel(isSelected: false,text: ' ',color: Colors.orange[300]));
    sampleColorData.add(BuyButtonModel(isSelected: false,text: ' ',color: Colors.grey));
    sampleColorData.add(BuyButtonModel(isSelected: false,text: ' ',color: Colors.blue[300]));
    sampleColorData.add(BuyButtonModel(isSelected: false,text: ' ',color: Colors.green[400]));
    sampleColorData.add(BuyButtonModel(isSelected: false,text: ' ',color: Colors.red[300]));
    sampleColorData.add(BuyButtonModel(isSelected: false,text: ' ',color: Colors.orange[300]));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  body() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          shirtPicWithImage(),
          columnHeader('Size'),
          Padding(padding: EdgeInsets.only(top: 10)),
          sizeListView(),
          Padding(padding: EdgeInsets.only(top: 10)),
          columnHeader('Color'),
          Padding(padding: EdgeInsets.only(top: 10)),
          colorListView(),
        ],
      ),
    );
  }

  primaryPadding() {
    return Padding(
      padding: EdgeInsets.only(top: 15),
    );
  }

  columnHeader(String text) {
    return Column(
      children: [
        Container(
          height: 22,
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.grey[600]),
          ),
        ),
        Container(
          height: 2,
          width: screenSize(context).width * .8,
          color: Colors.grey[300],
        )
      ],
    );
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  sizeListView() {
    return Container(
      height: 50,
      width: 330,
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) => Container(
          width: 20,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: sampleSizeData.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                sampleSizeData.forEach((element) {
                  element.isSelected = false;
                });
                sampleSizeData[index].isSelected = true;
              });
            },
            child: BuyDetailsButton(sampleSizeData[index]),
          );
        },
      ),
    );
  }
  colorListView(){
    return Container(
      height: 50,
      width: 330,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Container(
          width: 20,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: sampleColorData.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _shirtColor = sampleColorData[index].color;
              });
            },
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(sampleColorData[index].color, BlendMode.modulate),
                child: BuyDetailsButton(sampleColorData[index])),
          );
        },
      ),
    );
  }


  shirtPicWithImage(){
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        shirtPic(),
        Column(
          children: [
            Container(
              height: 100,
            ),
            testLogo(),
          ],
        )


      ],
    );

  }
  testLogo() {
    return Opacity(
      opacity: .8,
      child: Container(
        height: 30,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(testShirt),
          ),
        ),
      ),
    );
  }


  shirtPic() {
    String photo = "assets/images/gshirt.png";
    return Hero(
      tag: photo,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(_shirtColor, BlendMode.modulate),
        child: Container(
          height: 350,
          width: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(photo),
            ),
          ),
        ),
      ),
    );
  }
}


class BuyButtonModel {
  bool isSelected;
  final String text;
  final ColorFiltered colorFiltered;
  final Color color;

  BuyButtonModel({this.isSelected, this.text,this.colorFiltered,this.color});
}

class BuyDetailsButton extends StatelessWidget {
  final BuyButtonModel _model;
  BuyDetailsButton(this._model);

  @override
  Widget build(BuildContext context) {
    Size size1 = Size(50, 50);

    return AnimatedContainer(
      height: size1.height,
      width: size1.width,
      duration: Duration(milliseconds: 150),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              spreadRadius: _model.isSelected ? 2 : 0,
              blurRadius: _model.isSelected ? 6 : 0,
              color: Colors.black.withOpacity(.5),
            )
          ],
          color: _model.isSelected ? Colors.green[300] : Colors.grey[350]),
      child: Center(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            _model.text,
            style: TextStyle(
                color: _model.isSelected ? Colors.grey[50] : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
      ),
    );
  }
}
