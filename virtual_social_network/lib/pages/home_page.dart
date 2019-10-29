import 'package:flutter/material.dart';
import 'package:virtual_social_network/services/authentification.dart';
import 'package:virtual_social_network/widgets/menu_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isEmailVerified = false;
  int _currentIndexBottomNavigation;

  @override
  void initState() {
    super.initState();
    this._currentIndexBottomNavigation = 0;
    initService();
    _checkEmailVerification();
  }

  Future initService() async {
    final authUser = await this.widget.auth.getCurrentUser();
  }

  void _checkEmailVerification() async {
    _isEmailVerified = await widget.auth.isEmailVerified();
    if (!_isEmailVerified) {
      _showVerifyEmailDialog();
    }
  }

  void _resentVerifyEmail() {
    widget.auth.sendEmailVerification();
    _showVerifyEmailSentDialog();
  }

  void _showVerifyEmailDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Please verify account in the link sent to email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Resent link"),
              onPressed: () {
                Navigator.of(context).pop();
                _resentVerifyEmail();
              },
            ),
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content:
              new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      debugPrint(e);
    }
  }

  Widget _getBodyWidgetByIndex(int index) {
    List<Widget> listWidget = [];

    return listWidget[index];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('VSN'),
        actions: <Widget>[
          new FlatButton(
              child: Tooltip(
                message: "Se déconnecter",
                child: Icon(Icons.power_settings_new,
                    color: Theme.of(context).buttonColor,
                    semanticLabel: "logout"),
              ),
              onPressed: _signOut)
        ],
      ),
      body: this._getBodyWidgetByIndex(this._currentIndexBottomNavigation),
      drawer: new MenuWidget(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndexBottomNavigation,
        onTap: (i) {
          setState(() {
            this._currentIndexBottomNavigation = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,
                color: Theme.of(context).buttonColor),
            title: Text("Account"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today,
                color: Theme.of(context).buttonColor),
            title: Text("Calendar"),
          ),
        ],
      ),
    );
  }
}
