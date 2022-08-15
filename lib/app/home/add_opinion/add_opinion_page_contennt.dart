import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  var gameName = "";
  var nameName = "";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: "Podaj nazwę gry",
            ),
            onChanged: (newValue) {
              setState(() {
                gameName = newValue;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: "Podaj nazwę Konsoli",
            ),
            onChanged: (newValue) {
              setState(() {
                nameName = newValue;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection("game")
                  .add({"neme": gameName, "game": nameName, "rating": 3.0});
            },
            child: const Text("Dodaj"),
          ),
        ],
      ),
    );
  }
}
