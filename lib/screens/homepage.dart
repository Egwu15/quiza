import 'package:flutter/material.dart';
import 'package:fun_quiz/designElements/cards.dart';
import 'package:fun_quiz/designElements/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              homepageCard(
                  context: context,
                  category: "General Knowledge",
                  categoryId: 9),
              homepageCard(
                  context: context, category: 'Mythology', categoryId: 20),
              homepageCard(
                  context: context,
                  category: 'Japanese anime and manga',
                  categoryId: 31),
              homepageCard(
                  context: context,
                  category: 'Cartoon and aimation',
                  categoryId: 32),
              homepageCard(
                  context: context, category: 'Sports', categoryId: 21),
              homepageCard(
                  context: context, category: 'Computers', categoryId: 18),
              homepageCard(
                  context: context, category: "Vehicles", categoryId: 28),
              homepageCard(context: context, category: "Music", categoryId: 12),
              homepageCard(
                  context: context, category: "Video games", categoryId: 15),
            ],
          ),
        ),
      ),
    );
  }
}
