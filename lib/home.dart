import 'package:flutter/material.dart';
import 'package:wechat/chat/chat.dart';
import 'package:wechat/widges/button.dart';

import 'authentication/authentication.dart';
import 'login.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WeChat"),
        backgroundColor: Colors.purple,
        elevation: 4.0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Text(
                'WeChat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              // onTap: _navigateToAbout,
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Your chats'),
               onTap: (){
                 Navigator.of(context).pushReplacement(
                   MaterialPageRoute(builder: (context) => chatScreen(name: '',)),
                 );
               },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () async {
                await Authentication().signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Loginscreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Congratulations, you are successfully logged in",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            button(
              onTab: () async {
                await Authentication().signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Loginscreen()),
                );
              },
              text: 'Log Out',
            ),
          ],
        ),
      ),
    );
  }
}
