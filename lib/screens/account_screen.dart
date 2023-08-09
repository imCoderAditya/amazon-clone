import 'package:flutter/material.dart';

import '../widget/account_screen_appbar.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AccountScreenAppBar(),
        body: const Center(
          child: Text("Account Screen"),
        ),
      ),
    );
  }
}
