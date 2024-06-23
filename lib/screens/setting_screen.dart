import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Notification Settings'),
              trailing: Switch(value: true, onChanged: (bool value) {}),
            ),
            ListTile(
              title: Text('Privacy Policy'),
              onTap: () {
                // Navigate to privacy policy screen
                Navigator.pushNamed(context, '/privacy_policy');
              },
            ),
            ListTile(
              title: Text('Terms of Service'),
              onTap: () {
                // Navigate to terms of service screen
                Navigator.pushNamed(context, '/terms_of_service');
              },
            ),
          ],
        ),
      ),
    );
  }
}
