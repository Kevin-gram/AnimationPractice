import 'package:flutter/material.dart';

void main() => runApp(AnimationDemo());

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BouncingBallPage(),
    );
  }
}

class BouncingBallPage extends StatefulWidget {
  @override
  _BouncingBallPageState createState() => _BouncingBallPageState();
}

class _BouncingBallPageState extends State<BouncingBallPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 300).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bouncing Ball Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              margin: EdgeInsets.only(top: _animation.value),
              child: child,
            );
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
