import 'package:discover_app/data/data.dart';
import 'package:discover_app/utils/helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<String> _locations = ['Poluare', 'Japan', 'Moscow', 'London'];
  int _activeIndex = 1;
  @override
  Widget build(BuildContext context) => Scaffold(
      body: SafeArea(
          top: true,
          left: false,
          right: false,
          bottom: true,
          minimum: EdgeInsets.fromLTRB(mediaQueryHorizontal(context, 0.05), 0,
              mediaQueryHorizontal(context, 0.05), 0),
          child: _mainColumn(context)));

  Widget _mainColumn(BuildContext _context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.menu, color: Colors.black87, size: 35),
              Container(
                height: 39,
                width: 144,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/logo_discover.png'))),
              ),
              Icon(Icons.search, color: Colors.black87, size: 35),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: mediaQueryVertical(context, 0.03),
                bottom: mediaQueryVertical(context, 0.03)),
            child: _locationBar(_context),
          ),
          _articlesList(context)
        ],
      );

  Widget _locationBar(BuildContext context) => Container(
        height: mediaQueryVertical(context, 0.065),
        decoration: BoxDecoration(
            color: Color.fromRGBO(69, 69, 69, 1),
            borderRadius: BorderRadius.circular(100)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _locations.map((city) {
              bool _isActive = _locations[_activeIndex] == city ? true : false;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    city,
                    style: TextStyle(
                        fontSize: 15,
                        color: _isActive ? Colors.white : Colors.white54,
                        fontFamily: 'Montserrat'),
                  ),
                  if (_isActive)
                    Container(
                      height: 6,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent),
                    )
                  else
                    Container()
                ],
              );
            }).toList()),
      );

  Widget _articlesList(BuildContext context) => Expanded(
        child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) => Stack(
            overflow: Overflow.visible,
            children: <Widget>[Padding(
              padding: EdgeInsets.only(bottom: mediaQueryVertical(context, 0.05)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: mediaQueryVertical(context, 0.30),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 2,
                            blurRadius: 50,
                            offset: Offset(0, 6))
                      ],
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(articles[index].image))),
                  child: _articleInfoColumn(context, index),
                ),
              ),
            ),
              Positioned(
                  bottom: 30,
                  left: mediaQueryHorizontal(context, 0.10),
                  child: _socialInfoContainer(context, index))
            ],
          ),
        ),
      );

  Widget _articleInfoColumn(BuildContext context, int index) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 30, 0),
            child: _authorInforRow(context, index),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                30, mediaQueryVertical(context, 0.05), 30, 0),
            child: _detailInfoRow(context, index),
          )
        ],
      );

  Widget _authorInforRow(BuildContext context, int _index) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('https://i.pravatar.cc/300')),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      articles[_index].author,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                    Text(
                      '3 hours ago',
                      style: TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.w300,
                          fontSize: 13),
                    )
                  ],
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 20,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Icon(
                  Icons.bookmark,
                  color: Colors.white,
                  size: 20,
                ),
              )
            ],
          )
        ],
      );

  Widget _detailInfoRow(BuildContext context, int _index) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.play_arrow,
              color: Colors.redAccent,
              size: 30,
            ),
            onPressed: () {},
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: mediaQueryHorizontal(context, 0.5),
                  child: Text(
                    articles[_index].title,
                    maxLines: 3,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(articles[_index].location, style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.w300,
                  fontSize: 13
                ),
                ),
                _ratingWidget(context, _index)
              ],
            ),
          )
        ],
      );

  Widget _socialInfoContainer(BuildContext _context, int _index) =>
      Container(
        height: mediaQueryVertical(_context, 0.08),
        width: mediaQueryHorizontal(_context, 0.70),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.favorite_border, color: Colors.redAccent,),
                Text(articles[_index].likes.toString(),
                  style: TextStyle(color: Colors.redAccent),)
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.comment, color: Colors.grey,),
                Text(articles[_index].comments.toString(),
                  style: TextStyle(color: Colors.grey),)
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.share, color: Colors.grey,),
                Text(articles[_index].shares.toString(),
                  style: TextStyle(color: Colors.grey),)
              ],
            ),

          ],
        ),
      );

  Widget _ratingWidget(BuildContext context, int _index) =>
      Row(
        children: List<Widget>.generate(5, (_currentIndex) {
          double _fillAmount = articles[_index].rating - _currentIndex;
          Icon _starIcon;
          if(_fillAmount >= 1) {
            _starIcon = Icon(Icons.star, color: Colors.amberAccent, size: 15,);
          } else if(_fillAmount >= .5) {
            _starIcon = Icon(Icons.star_half, color: Colors.amberAccent, size: 15,);
          } else {
            _starIcon = Icon(Icons.star_border, color: Colors.amberAccent, size: 15,);

          }
          return _starIcon;
      }),
      );
}
