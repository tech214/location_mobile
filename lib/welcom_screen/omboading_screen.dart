import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../screens/auth/login.dart';
import '../themes/app_theme.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            top: -10,
            left: -160,
            child: Row(
              children: [
                ScrollingImages(startingIndex: 0),
                ScrollingImages(startingIndex: 1),
                ScrollingImages(startingIndex: 2),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                height: h * 0.6,
                width: w,
                decoration: BoxDecoration(
                    color: const Color(0xFFFBCF84),
                    gradient: LinearGradient(colors: [
                      Colors.transparent,
                      const Color(0xFFFBCF84).withOpacity(0.6),
                    ], begin: Alignment.topCenter, end: Alignment.center)),
                child: Column(
                  children: [
                    const Spacer(),
                    Text(
                      "Your Appearance Shows Your Quality",
                      textScaleFactor: 2.5,
                      textAlign: TextAlign.center,
                      style: AppThemes.primaryFontStyle,
                    ),
                    Text(
                      "Change the Quality of your Appearance with MNIML Fashion now.",
                      textScaleFactor: 1.2,
                      textAlign: TextAlign.center,
                      style: AppThemes.secondaryFontStyle,
                    ),
                    const SizedBox(height: 50),
                    InkWell(
                      onTap: () => Get.off(() => LoginScreen()),
                      child: Container(
                        height: 60,
                        width: w * 0.8,
                        margin: const EdgeInsets.only(
                            bottom: 20, left: 20, right: 20),
                        decoration: const BoxDecoration(
                          color: AppThemes.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: const Center(
                            child: Text(
                          "Get start",
                          textScaleFactor: 1.3,
                          style: TextStyle(
                              color: Color(0xFFFBCF84),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class ScrollingImages extends StatefulWidget {
  final int startingIndex;

  const ScrollingImages({
    super.key,
    required this.startingIndex,
  });

  @override
  State<ScrollingImages> createState() => _ScrollingImagesState();
}

class _ScrollingImagesState extends State<ScrollingImages> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.minScrollExtent) {
        _autoScrollForward();
      } else if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        _autoScrollbackward();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoScrollForward();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _autoScrollForward() {
    final currentPosition = _scrollController.offset;
    final endPosition = _scrollController.position.maxScrollExtent;
    scheduleMicrotask(() {
      _scrollController.animateTo(
          currentPosition == endPosition ? 0 : endPosition,
          duration: Duration(seconds: 20 + widget.startingIndex + 2),
          curve: Curves.linear);
    });
  }

  _autoScrollbackward() {
    final currentPosition = _scrollController.offset;
    final endPosition = _scrollController.position.minScrollExtent;
    scheduleMicrotask(() {
      _scrollController.animateTo(
          currentPosition == endPosition ? 0 : endPosition,
          duration: Duration(seconds: 20 + widget.startingIndex + 2),
          curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Transform.rotate(
      angle: 1.96 * pi,
      child: SizedBox(
        height: h * 0.6,
        width: w * 0.6,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 5,
          itemBuilder: (context, index) {
            int imageIndex = (widget.startingIndex + index) % images.length;
            return Container(
              margin: const EdgeInsets.only(right: 8, left: 8, top: 10),
              height: h * 0.6,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    image: AssetImage(images[imageIndex]), fit: BoxFit.cover),
              ),
            );
          },
        ),
      ),
    );
  }
}

List<String> images = [
  'assets/images/johnson-johnson-U6Q6zVDgmSs-unsplash.jpg',
  'assets/images/kara-eads-L7EwHkq1B2s-unsplash.jpg',
  'assets/images/phil-hearing-IYfp2Ixe9nM-unsplash.jpg',
  'assets/images/florian-schmidinger-b_79nOqf95I-unsplash.jpg',
  'assets/images/frames-for-your-heart-mR1CIDduGLc-unsplash.jpg',
  'assets/images/jacques-bopp-Hh18POSx5qk-unsplash.jpg',
  'assets/images/sieuwert-otterloo-aren8nutd1Q-unsplash.jpg',
  'assets/images/stephan-bechert-yFV39g6AZ5o-unsplash.jpg',
  'assets/images/tierra-mallorca-rgJ1J8SDEAY-unsplash.jpg',
  'assets/images/todd-kent-178j8tJrNlc-unsplash.jpg',
];
