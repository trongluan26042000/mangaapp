import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with TickerProviderStateMixin{
   late AnimationController _animationController;
    late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,)..forward();
  }

  _comicSelector(int index){
    var comics;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        double value = 1;
        return Center(
          child: SizedBox(
            height: _animationController.value * 270.0,
            width:_animationController.value * 400.0,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0.0,4.0),
                  blurRadius: 10.0,
                ),
              ],
              ),
              child:Center(
                child: Hero(
                  tag: comics[index].imageUrl,
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: AssetImage(comics[index].imageUrl),
                      height: 220.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var comics;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Image.network('https://inkythuatso.com/uploads/thumbnails/800/2021/12/logo-netflix-inkythuatso-01-01-09-05-42.jpg'),
        leading: IconButton(
          padding: const EdgeInsets.only(left: 30.0),
          onPressed: () => print("Menu"),
          icon: const Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 280.0,
            width: double.infinity,
            child: PageView.builder(
                controller: _pageController,
                itemCount: comics.length,
                itemBuilder: (BuildContext context, int index){
                  return _comicSelector(index);
                },
            ),
          )
        ],
      ),
    );
  }
}

