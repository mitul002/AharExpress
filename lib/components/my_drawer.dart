import 'package:first_app/components/my_drawer_tile.dart';
import 'package:first_app/pages/weather_page.dart';
import 'package:first_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout()
  {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:  Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("lib/images/logo/Screenshot 2025-03-27 131620.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Divider(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          // home list tile
          MyDrawerTile(
              text: "H O M E",
              icon: Icons.home,
              onTap: () => Navigator.pop(context),
          ),

          //settings list tile
          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),

          MyDrawerTile(
            text: "W E A T H E R",
            icon: Icons.sunny,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const WeatherPage(),
              ),
              );
            },
          ),

          const Spacer(),

          //logout list tile
          MyDrawerTile(
            text: "L O G O U T",
            icon: Icons.logout,
            onTap: logout,
          ),

          const SizedBox(height: 25),
        ],
      )
    );
  }
}
