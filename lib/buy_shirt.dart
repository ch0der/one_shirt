import 'package:flutter/cupertino.dart';
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
  String testLogo1 = 'assets/logoDesign4.png';
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    sampleSizeData.add(
        BuyButtonModel(isSelected: false, text: 'S', colorSelected: false));
    sampleSizeData.add(
        BuyButtonModel(isSelected: false, text: 'M', colorSelected: false));
    sampleSizeData.add(
        BuyButtonModel(isSelected: false, text: 'L', colorSelected: false));
    sampleSizeData.add(
        BuyButtonModel(isSelected: false, text: 'XL', colorSelected: false));
    sampleSizeData.add(
        BuyButtonModel(isSelected: false, text: '2XL', colorSelected: false));

    sampleColorData.add(BuyButtonModel(
        isSelected: false,
        text: ' ',
        color: Colors.blue[300],
        colorSelected: false));
    sampleColorData.add(BuyButtonModel(
        isSelected: false,
        text: ' ',
        color: Colors.green[400],
        colorSelected: false));
    sampleColorData.add(BuyButtonModel(
        isSelected: false,
        text: ' ',
        color: Colors.red[300],
        colorSelected: false));
    sampleColorData.add(BuyButtonModel(
        isSelected: false,
        text: ' ',
        color: Colors.orange[300],
        colorSelected: false));
    sampleColorData.add(BuyButtonModel(
        isSelected: false,
        text: ' ',
        color: Colors.grey,
        colorSelected: false));
    sampleColorData.add(BuyButtonModel(
        isSelected: false,
        text: ' ',
        color: Colors.blue[300],
        colorSelected: false));
    sampleColorData.add(BuyButtonModel(
        isSelected: false,
        text: ' ',
        color: Colors.green[400],
        colorSelected: false));
    sampleColorData.add(BuyButtonModel(
        isSelected: false,
        text: ' ',
        color: Colors.red[300],
        colorSelected: false));
    sampleColorData.add(BuyButtonModel(
        isSelected: false,
        text: ' ',
        color: Colors.orange[300],
        colorSelected: false));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_controller.hasClients) {
        _controller.animateTo(500,
            duration: Duration(seconds: 40), curve: Curves.linear);
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green[500],
        leading: Icon(Icons.arrow_back),
        title: Center(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logo(),
            appBarText(),
          ],
        )),
        actions: [
          Icon(Icons.settings)
        ],

      ),
      body: body(),
      persistentFooterButtons: [purchaseButton(),Container(width: 20,height: 50,)],//fix later
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
          Padding(padding: EdgeInsets.only(top: 5)),
          columnHeader('Color'),
          Padding(padding: EdgeInsets.only(top: 10)),
          colorListView(),
        ],
      ),
    );
  }

  logo(){
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/shitdesign1.png')),
        ),
      ),
    );
  }
  appBarText(){
    return Text(' OneShirt     ',style: TextStyle(fontSize: 30),);
  }

  primaryPadding() {
    return Padding(
      padding: EdgeInsets.only(top: 15),
    );
  }

  purchaseButton() {
    return ClipRRect(
      child: Container(
          height: 50,
          width: screenSize(context).width * .8,
          child: FlatButton(
              color: Colors.green[800], onPressed: () {}, child: Container())),
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

  colorListView() {
    return Container(
      height: 50,
      width: 330,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Container(
          width: 20,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: sampleColorData.length,
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                sampleColorData.forEach((element) {
                  element.colorSelected = false;
                });
                sampleColorData[index].colorSelected = true;
                _shirtColor = sampleColorData[index].color;
              });
            },
            child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    sampleColorData[index].color, BlendMode.modulate),
                child: BuyDetailsButton(sampleColorData[index])),
          );
        },
      ),
    );
  }

  shirtPicWithImage() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        shirtPic(),
        Column(
          children: [
            Container(
              height: 50,
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
          height: 300,
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
  bool colorSelected;
  final String text;
  final Color color;

  BuyButtonModel({this.isSelected, this.text, this.color, this.colorSelected});
}

class BuyDetailsButton extends StatelessWidget {
  final BuyButtonModel _model;
  BuyDetailsButton(this._model);

  @override
  Widget build(BuildContext context) {
    Size size1 = Size(50, 50);

    return AnimatedContainer(
      curve: Curves.easeOut,
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
          border: _model.colorSelected
              ? Border.all(width: 1.5, color: Colors.black)
              : null,
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
