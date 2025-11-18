class Service {
  final String name;
  final String title;
  final String description;
  final String smallDescription;
  final String photo;

  Service({
    required this.name,
    required this.title,
    required this.description,
    required this.smallDescription,
    required this.photo,
  });
}

final List<Service> sections = [
  Service(
    name: "Educator", 
    title: "Education Support", 
    description: "Do you know the future of learning is here? Are you ready to unlock new possibilities? Connect with our educators and enhance your knowledge and skills in various fields, including professional development and leadership skills.",
    smallDescription: "Book an appointment with one of our raw talent Educator", 
    photo: "assets/images/educator.jpg", // path to your image
  ),
  Service(
    name: "Mentor", 
    title: "Mentorship Call", 
    description: "Your career is a journey, not a destination... Where will your next step take you? Connect with our mentors who offer personalized guidance and support to help you navigate your career path with confidence.", 
    smallDescription: "Book an appointment with one of our raw talent Mentor/Coach", 
    photo: "assets/images/mentor.jpg", // path to your image
  ),
  Service(
    name: "Counselor", 
    title: "Counseling Session", 
    description: "Life's journey can be unpredictable... But you don't have to navigate it alone. Get support when you need it. Connect with our counselors for supportive and non-judgmental space to discuss your concerns.", 
    smallDescription: "Book an appointment with one of our raw Talent Non-therapeutic Counselor", 
    photo: "assets/images/counselor.jpg", // path to your image
  ),
  Service(
    name: "Trainer/Coach", 
    title: "Training - Skills", 
    description: "Are you looking to acquire in-demand skills and knowledge in your field? Our trainers and coaches can help you stay ahead of the curve in your industry. Connect with us today to unlock your full potential.", 
    smallDescription: "Book an appointment with one of our raw talent skills Trainer", 
    photo: "assets/images/trainer_coach.jpg", // path to your image
  ),
  Service(
    name: "Conversationalist", 
    title: "Conversational Chat", 
    description: "Feeling lonely or just need someone to chat with? Our friendly conversationalists are here to listen and talk. Connect with us for a supportive and engaging conversation, anytime you need it.", 
    smallDescription: "Book an appointment with one of our raw talent Conversationist (Just Talk)", 
    photo: "assets/images/conversationalist.jpg", // path to your image
  ),
  Service(
    name: "iBARE", 
    title: "iBARE", 
    description: "Imagine having the answers to your life's toughest questions at your fingertips... Connect with our innovative interactive humanoid, iBARE, and get personalized solutions to your everyday challenges.",
    smallDescription: "Book an appointment with one of our interactive humanoid",  
    photo: "assets/images/ibare.jpg", // path to your image
  ),
];