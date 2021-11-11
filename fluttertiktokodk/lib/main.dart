import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageHome(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/tiktok_add.png'),
            label: 'Add',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.comment_outlined),
            label: 'Comment',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF141518),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}

class PageHome extends StatelessWidget {
  PageHome({Key? key}) : super(key: key);
  final List<Map> tiktokItems = [
    {
      "video": "assets/videos/tiktok_1.mp4",
    },
    {
      "video": "assets/videos/tiktok_2.mp4",
    },
    {
      "video": "assets/videos/tiktok_3.mp4",
    },
    {
      "video": "assets/videos/tiktok_6.mp4",
    },
    {
      "video": "assets/videos/tiktok_9.mp4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: double.infinity,
        scrollDirection: Axis.vertical,
        viewportFraction: 1.0,
      ),
      items: tiktokItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              color: const Color(0xFF141518),
              child: Stack(
                children: [
                  VideoTiktok(videoUrl: item['video']),
                  const PostContent()
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class VideoTiktok extends StatefulWidget {
  const VideoTiktok({Key? key, required this.videoUrl}) : super(key: key);
  final String videoUrl;

  @override
  _VideoTiktokState createState() => _VideoTiktokState(this.videoUrl);
}

class _VideoTiktokState extends State<VideoTiktok> {
  late VideoPlayerController _controller;
  final String videoUrl;
  _VideoTiktokState(this.videoUrl);

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(videoUrl)
      ..initialize().then((_) {
        _controller.play();
        initState();
      });
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(_controller);
  }
}

class PostContent extends StatelessWidget {
  const PostContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          padding: const EdgeInsets.only(top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Abonnements',
                style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 20),
              Text(
                'Pour toi',
                style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      //color: Colors.red,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '@prince prince',
                            style: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 20),
                          const Text(
                            'respect#respect #coding',
                            style: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            'Les actions de coding sont realisé par les génies et flutter nous facilite la tâche',
                            style: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.music_note,
                                color: Colors.white,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Original - originale & classic',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ),
                SizedBox(
                  width: 80,
                  // color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 80,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: const CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage('assets/images/lexa.jpg')),
                            ),
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                //color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        child: Column(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.white.withOpacity(0.83),
                              size: 45,
                            ),
                            const Text(
                              '25.5k',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        // color: Colors.grey,
                        child: Column(
                          children: [
                            Icon(
                              Icons.message,
                              color: Colors.white.withOpacity(0.83),
                              size: 45,
                            ),
                            const Text(
                              '25.5k',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        // color: Colors.yellow,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/share.png',
                              height: 40,
                              width: 40,
                            ),
                            const Text(
                              '25.5k',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const AnimatedLogo(),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({Key? key}) : super(key: key);

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    //super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: child,
        );
      },
      child: Container(
        height: 45,
        width: 45,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: const DecorationImage(
            image: const AssetImage('assets/images/logotik.png'),
          ),
        ),
      ),
    );
  }
}
