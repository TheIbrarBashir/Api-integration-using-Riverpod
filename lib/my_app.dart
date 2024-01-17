import 'package:flutter/material.dart';
import 'package:konquer_test/utils/app_theme.dart';
import 'package:konquer_test/view/users_data_page/users_data_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod Example',
      theme: appTheme,
      home: const UsersDataPage(),
    );
  }
}
