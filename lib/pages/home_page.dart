import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../widgets/navbar.dart';
import '../widgets/home_sections.dart'; // your data file

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<int, VideoPlayerController> _controllers = {};

  @override
  void initState() {
    super.initState();

    // Initialize video controllers for sections that have a video
    for (int i = 0; i < homeSections.length; i++) {
      final section = homeSections[i];
      if (section.videoPath != null) {
        _controllers[i] = VideoPlayerController.asset(section.videoPath!)
          ..initialize().then((_) {
            _controllers[i]!.setLooping(true);
            _controllers[i]!.play();
            setState(() {});
          });
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < homeSections.length; i++)
              _buildSection(
                title: homeSections[i].title,
                description: homeSections[i].description,
                imagePath: homeSections[i].imagePath,
                videoController: _controllers[i],
              ),
          ],
        ),
      ),

      bottomNavigationBar: const NavBar(),
      extendBody: true,
    );
  }

  Widget _buildSection({
    required String title,
    required String description,
    String? imagePath,
    VideoPlayerController? videoController,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [

          // Background: video -> image -> fallback gray
          Positioned.fill(
            child: videoController != null && videoController.value.isInitialized
                ? VideoPlayer(videoController)
                : (imagePath != null
                    ? Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      )
                    : Container(color: Colors.grey.shade200)),
          ),

          Container(
            color: Colors.black.withOpacity(0.3),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
