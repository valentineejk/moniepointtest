import 'package:flutter/material.dart';
import 'package:moniepointtest/views/settings.dart';
import 'package:moniepointtest/views/voucher.dart';
import 'package:moniepointtest/views/wallet.dart';

import 'views/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _selectedScreen,
          children: [
            Home(),
            const Voucher(),
            const Wallet(),
            const Settings(),
          ],
        ),
        bottomNavigationBar: NavigationBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            selectedIndex: _selectedScreen,
            indicatorColor: Colors.transparent,
            onDestinationSelected: (d) => setState(() {
                  _selectedScreen = d;
                }),
            destinations: const [
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.home,
                  color: Color(0xff569C86),
                ),
                icon: Icon(
                  Icons.home_outlined,
                  color: Color(0xff569C86),
                ),
                label: 'Home',
              ),
              NavigationDestination(
                  selectedIcon: Icon(
                    Icons.confirmation_num,
                    color: Color(0xff569C86),
                  ),
                  icon: Icon(
                    Icons.confirmation_num_outlined,
                    color: Color(0xff569C86),
                  ),
                  label: 'Voucher'),
              NavigationDestination(
                  selectedIcon: Icon(
                    Icons.account_balance_wallet,
                    color: Color(0xff569C86),
                  ),
                  icon: Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Color(0xff569C86),
                  ),
                  label: 'Wallet'),
              NavigationDestination(
                  selectedIcon: Icon(
                    Icons.settings,
                    color: Color(0xff569C86),
                  ),
                  icon: Icon(
                    Icons.settings_outlined,
                    color: Color(0xff569C86),
                  ),
                  label: 'Settings'),
            ]));
  }
}
