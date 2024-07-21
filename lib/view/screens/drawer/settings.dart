import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final String? userName;
  final String? profileImageUrl;
  final bool? isDarkModeEnabled;
  final bool? isBackgroundMusicEnabled;
  final currentUser = FirebaseAuth.instance.currentUser;
  SettingsScreen({
    this.userName,
    this.profileImageUrl,
    this.isDarkModeEnabled,
    this.isBackgroundMusicEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 29.0,
        ),),
        backgroundColor: Color.fromRGBO(144, 94, 150, 1),),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255, 143, 177, 1),
              Color.fromRGBO(144, 94, 150, 1),
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            // User Profile Section
            ListTile(
              contentPadding: EdgeInsets.all(0), // Remove padding for ListTile
              title: Row(
                children: <Widget>[
                  // CircleAvatar on the left
                  CircleAvatar(
                    radius: 24, // Adjust the radius as needed
                    backgroundImage: profileImageUrl != null
                        ? NetworkImage(profileImageUrl!)
                        : null, // Set to null if no image URL is available
                    child: profileImageUrl == null
                        ? Text(
                      currentUser?.displayName != null
                          ? currentUser!.displayName![0].toUpperCase()
                          : '',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                        : null, // Display text only if there is no profile image
                  ),
                  SizedBox(width: 16), // Add some spacing between the CircleAvatar and text
                  // Text on the right
                  Text(
                    currentUser?.displayName != null
                        ? "Hello ${currentUser?.displayName}!!"
                        : 'Hello there!',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),

            Divider(), // Separator

            // Dark Mode Toggle
            SwitchListTile(
              title: Text('Dark Mode'),
              onChanged: null, // Disable functionality (null)
              value: isDarkModeEnabled ?? false, // Use false if isDarkModeEnabled is null
            ),

            Divider(), // Separator

            // Background Music Option
            SwitchListTile(
              title: Text('Background Music'),
              onChanged: null, // Disable functionality (null)
              value: isBackgroundMusicEnabled ?? false, // Use false if isBackgroundMusicEnabled is null
            ),
          ],
        ),
      ),
    );
  }
}
