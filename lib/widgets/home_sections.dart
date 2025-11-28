import 'package:flutter/material.dart';

class HomeSection {
  final String title;
  final String description;
  final String? videoPath;
  final String? imagePath;


  HomeSection({
    required this.title,
    required this.description,
    this.videoPath,
    this.imagePath,
  });
}

final List<HomeSection> homeSections = [
  HomeSection(
    title: "Affordable Social Learning Services for Everyone",
    description: "Join Our Upcoming Event Now!",
    videoPath: 'assets/videos/home_page_video.mp4',
  ),
  HomeSection(
    imagePath: "assets/images/home1.png",
    title: "Empowering Connections Through Support",
    description: "We provide virtual social services that enhance personal growth and professional development, fostering community engagement and meaningful connections for everyone.",
  ),
  HomeSection(
    imagePath: "assets/images/home2.png",
    title: "About Our Services",
    description: "Our mission is to support individuals in their journey through education, training, mentorship, counseling, and conversation, helping them thrive in their lives.",
  )
];
