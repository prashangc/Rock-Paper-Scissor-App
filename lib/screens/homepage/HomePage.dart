import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/model/UserSelectionModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> options = ['rock', 'paper', 'scissor'];
  String? userChoice;
  String? computerChoice;
  String? result;

  void makeChoice(int index) {
    setState(() {
      userChoice = options[index];
      computerChoice = options[Random().nextInt(options.length)];
      if (userChoice == computerChoice) {
        result = 'tie';
      } else if (userChoice == 'rock' && computerChoice == 'scissor' ||
          userChoice == 'paper' && computerChoice == 'rock' ||
          userChoice == 'scissor' && computerChoice == 'paper') {
        result = 'won';
      } else {
        result = 'lost';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        toolbarHeight: 20.0,
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              Text(
                result == 'tie'
                    ? 'Tie !'
                    : result == 'lost'
                        ? 'You Lost !'
                        : result == 'won'
                            ? 'You Won !'
                            : 'Select move',
                style: TextStyle(
                  fontSize: 20,
                  color: result == 'tie'
                      ? Colors.white
                      : result == 'lost'
                          ? Colors.red
                          : result == 'won'
                              ? Colors.green
                              : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              playGround(userChoice, computerChoice),
            ],
          )),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180.0,
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 25.0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: userSelectionModel.length,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) {
                  return userSelectionCard(userSelectionModel, i);
                }),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.play_arrow),
              SizedBox(width: 10),
              Text(
                'Play Again',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget playGround(userChoice, computerChoice) {
    return Expanded(
      child: userChoice == null && computerChoice == null
          ? Container()
          : Row(
              children: [
                Image.asset(
                  'assets/images/$userChoice.gif',
                  width: MediaQuery.of(context).size.width / 2,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/$computerChoice.gif',
                  width: MediaQuery.of(context).size.width / 2,
                  fit: BoxFit.cover,
                ),
              ],
            ),
    );
  }

  Widget userSelectionCard(data, i) {
    return GestureDetector(
      onTap: () {
        makeChoice(i);
      },
      child: Container(
        width: (MediaQuery.of(context).size.width / 3) - 16,
        margin: EdgeInsets.only(right: i == data.length - 1 ? 0.0 : 12.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  data[i].image,
                  width: MediaQuery.of(context).size.width,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                data[i].title.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
