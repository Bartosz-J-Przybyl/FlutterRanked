import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'add_opinion/add_opinion_page_contennt.dart';
import 'game/game_page_contennt.dart';
import 'my_account/my_account_page_contennt.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RANKING GIER"),
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const GamesPagesContent();
        }

        if (currentIndex == 2) {
          return const AddOpinionPageContent();
        }
        return MyAccountPageCountent(email: widget.user.email);
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.reviews),
            label: " Opinie",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "moje Konto",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "dodaj",
          ),
        ],
      ),
    );
  }
}
