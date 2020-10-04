import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/widgets/destination_carousell.dart';
import 'package:flutter_travel_ui/widgets/hotel_carousell.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  int _selectedIndex = 0;
  int _currentTab = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Theme.of(context).accentColor
                : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30.0)),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 120),
                child: Text(
                  'What would you like to find?',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              )),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:
                _icons.asMap().entries.map((e) => _buildIcon(e.key)).toList(),
          ),
          SizedBox(
            height: 20.0,
          ),
          DestinationCarousel(),
          SizedBox(
            height: 20.0,
          ),
          HotelCarousell()
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30.0,
              ),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_pizza,
                size: 30.0,
              ),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15.0,
                  backgroundImage: NetworkImage('https://images.complex.com/complex/images/c_fill,f_auto,g_center,w_1200/fl_lossy,pg_1/lh8fmadxkcg4yxd6xbad/lil-wayne-getty-2020-frazer-harrison'),
              ),
              title: SizedBox.shrink())
        ],
      ),
    );
  }
}
