import 'dart:async';

import 'package:flutter/material.dart';

class BreathingExercise extends StatefulWidget {
  const BreathingExercise({super.key});

  @override
  _BreathingExerciseState createState() => _BreathingExerciseState();
}

class _BreathingExerciseState extends State<BreathingExercise>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Timer _timer;
  bool _isBreathingIn = true;
  int _secondsRemaining = 10;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
          setState(() {
            _isBreathingIn = false;
          });
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
          setState(() {
            _isBreathingIn = true;
            _secondsRemaining--;
          });
          if (_secondsRemaining == 0) {
            _timer.cancel();
            // TODO: Show completion message or navigate to another page
          }
        }
      });

    _animationController.forward();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        _secondsRemaining--;
      });
      if (_secondsRemaining == 0) {
        _timer.cancel();
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Breathing Exercise",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 26.0),
        ),
        backgroundColor: Colors.blue,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context, Widget? child) {
                return Container(
                  width: 200.0,
                  height: 200.0,
                  child: CustomPaint(
                    painter: BreathingPainter(
                      animation: _animationController,
                      isBreathingIn: _isBreathingIn,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20.0),
            Text(
              _isBreathingIn ? 'Breathe in' : 'Breathe out',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 10.0),
            Text(
              '$_secondsRemaining seconds remaining',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}

class BreathingPainter extends CustomPainter {
  late Animation<double> animation;
  late bool isBreathingIn;

  BreathingPainter({required this.animation, required this.isBreathingIn})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blueAccent;

    double radius = size.width / 2;

    if (!isBreathingIn) {
      radius -= animation.value * radius;
    }

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
  }

  @override
  bool shouldRepaint(BreathingPainter oldDelegate) =>
      animation != oldDelegate.animation ||
      isBreathingIn != oldDelegate.isBreathingIn;
}
