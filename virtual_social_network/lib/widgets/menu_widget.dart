import 'package:flutter/material.dart';
import 'package:virtual_social_network/pages/about_page.dart';

class MenuWidget extends StatefulWidget {
  MenuWidget({Key key}) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: _listMenu(),
      ),
    );
  }

  List<Widget> _listMenu() {
    return [
      // user
      // UserAccountsDrawerHeader(
      //   accountName: Text(this.widget.user.name),
      //   accountEmail: Text(this.widget.user.email),
      //   currentAccountPicture: Center(
      //     child: CircleAvatar(
      //       backgroundImage: NetworkImage(this.widget.user.urlPhoto),
      //     ),
      //   ),
      // ),

      Divider(
        height: 10,
      ),

      ListBody(
        mainAxis: Axis.vertical,
        children: <Widget>[
          // About
          ListTile(
            title: Text('About'),
            leading: CircleAvatar(
              child: Icon(Icons.info, color: Theme.of(context).buttonColor),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new AboutPage()));
            },
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0),
            child: Icon(
              Icons.whatshot,
              size: 40.0,
            ),
          ),
        ],
      ),
    ];
  }
}
