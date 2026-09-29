import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:nutribot/chat_bubble.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //top header row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Iconsax.menu, color: Colors.black),
                      SizedBox(width: 10),
                      Icon(Iconsax.setting_2, color: Colors.black),
                    ],
                  ),
                  Text(
                    "Nutribot",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              Positioned(
                left: 0,
                child: ChatBubble(
                  text: "How much calories does 1gram of yams have",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
