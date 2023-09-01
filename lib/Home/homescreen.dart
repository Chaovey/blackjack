import 'package:blackjack/Home/game_screen.dart';
import 'package:blackjack/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  double rotationAnglo = 0;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    animationController.repeat(
      reverse: true,
    );
    animationController.addListener(() {
      setState(() {
        rotationAnglo = animationController.value * 0.15;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            background_image,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: rotationAnglo,
                child: Image.asset(
                  blackjeck,
                  width: 150,
                  height: 150,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Gamescreen(),
                      ));
                },
                child: Material(
                  elevation: 20,
                  color: Colors.transparent,
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xff3ec300),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text("Play"),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  SystemNavigator.pop();
                },
                child: Material(
                  elevation: 30,
                  color: Colors.transparent,
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xffffba08).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text("Quit"),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
