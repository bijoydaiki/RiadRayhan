import 'package:flutter/material.dart';


class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final IconData icon;
  final String? imageUrl; // Single image (backward compatibility)
  final List<String>? imageUrls; // Multiple images - NEW FEATURE
  final String? videoUrl; // YouTube URL or direct video URL
  final bool isYouTubeVideo;

  Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.icon,
    this.imageUrl,
    this.imageUrls, // NEW: Support for multiple images
    this.videoUrl,
    this.isYouTubeVideo = false,
  });
}

// Sample Data - Enhanced with multiple images
final List<Project> liveApps = [
  Project(
    title: 'Daiki Axis ERP',
    description: 'Daiki Axis is a global leader in Sewage Treatment Plant (STP) solutions. With advanced technology and years of experience, Daiki Axis helps clean and treat wastewater to make the environment healthier and safer.This app helps our team work better, faster, and smarter. From scheduling regular maintenance to reporting problems - everything is just a tap away.Whether you are working on a small site or a big project, this app keeps everything organized and helps you connect with your team and higher authority easily.',

    technologies: ['Flutter', 'Google Map', 'Location', 'REST API','Redis','Hive'],
    icon: Icons.domain,
    imageUrls: [
      'https://play-lh.googleusercontent.com/G_Sk1nX6-AL3lfLWWXWJwBe00oxJerg_ZzfCFcxeGAafplCKDsl2fIV6z_ttPd-lZw=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/qPptjDGA3tBEsnndIW_aUx_J3qcBQxGwq0SBiEhaqNZ1xJoRMBMxIEPn9wVxABH6Ww=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/qPptjDGA3tBEsnndIW_aUx_J3qcBQxGwq0SBiEhaqNZ1xJoRMBMxIEPn9wVxABH6Ww=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/Vktt-bEakcC9DOl9YG2cCqxbcRTc4WeOekL4SxlLu7YS4roHV5TdXSdpzNXfqtGJFZY=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/1kyVxh-ZlpC0-WJ1PriXsjS_e5l1pjE_luOeMRqWqT0WiLjRbZjOpR7F9-oiv7iNvvo=w2560-h1440-rw',
    ],
    videoUrl: 'https://youtu.be/uANj8OUAgQA',
    isYouTubeVideo: true,
  ),
  Project(
    title: 'Urloker',
    description: 'This app is made for Australian people only. Your all-in-one platform for hassle-free storage, convenience, and connectivity! Designed to make your life easier, Urloker offers three innovative services\n'
        '\n1. Luggage Storage Made Easy: Travelers can securely store their luggage in convenient locations, freeing them to explore without the burden of heavy bags. With affordable rates and 24/7 access at select locations, Urloker ensures your belongings are safe while you roam worry-free'
        '\n2. Airbnb Key Exchange Simplified: Hosts and guests can enjoy seamless key handovers with our secure key storage system. Airbnb hosts can leave keys in trusted Urloker locations for guests to pick up at their convenience, ensuring a smooth check-in experience.'
        '\n3. Mobile Charging Stations: Stay powered up on the go! Our mobile charging stations, located at partner stores, provide fast, reliable charging for your devices while you relax or shop.',
    technologies: ['Flutter', 'Google Map', 'Stripe', 'REST API'],
    icon: Icons.shopping_cart,
    imageUrls: [
      'https://play-lh.googleusercontent.com/-HgBhOBJFp6sVCeym6BMd4zuYdeh1DObAIUd6bJfE4a91IXAktbtzWVR4JaZwaWbQfov=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/D_V2euLZX4dChwQwj9fxYNsljj_y_1wJ0gfcAp9RCG-Q860esa8shtRq3qDkzsc4Tuk=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/ZBDcNXwR-V2fiGzEu_CM_t3_jMz7hY9vBXWVpGPYKneRkUAb-oO-64MgYAQrA6ShncA=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/s3ineBQVQ3BLMcXE5-mv2KLNRkz9OLufzr_uRJQFG5LcKbceqSSMfaXnhWpTo2WjcAo=w2560-h1440-rw',
      'https://play-lh.googleusercontent.com/_gUKIw3k4VJ2ex4UAduYVMFbz1AFlM6EBWDd62zkb-11lphNMGhFVRraDLOF91xkoyuO=w2560-h1440-rw',
    ],
    videoUrl: 'https://drive.google.com/file/d/15GjnVy0HaAodpeepnnBbPt6En6gvp0yp/view?usp=sharing',
    isYouTubeVideo: true,
  ),
  Project(
    title: 'Sheba HealthCheck',
    description: 'This App is created for General Fitness and Wellness purposes, it uses Smartphone Camera for tracking Fitness and Wellness level of a User.'
    'It Monitors health and track blood pressure, Heart Rate and Breathing Rate. It counts Steps for jogging and records blood sugar',
    technologies: ['Java', 'ML', 'Sensor'],
    icon: Icons.people,
    imageUrls: [
      'https://play-lh.googleusercontent.com/aflcTuCl2Qc8ap2O8sK4PksQUCf57xJfdPGpb1Vpl3CQsHLqxAHfUkqJkulEE8Pqsh9f=w2560-h1440-rw',
    ],
    videoUrl: 'https://www.youtube.com/watch?v=example123',
    isYouTubeVideo: true,
  ),
  Project(
    title: 'Breast Cancer Detection',
    description: 'Breast Cancer app designed to help detect breast cancer using only your smartphone camera. This app leverages the '
        'power of machine learning to analyze images and provide a preliminary assessment of whether breast cancer might be present. '
        'working process is Data Collection then,Image Processing,(secret processing), result. after 3 step complete then will be show output.',
    technologies: ['Flutter', 'java', 'ML', 'Tflite', 'Python','Dataset'],
    icon: Icons.currency_bitcoin,
    imageUrls: [
      'https://images.unsplash.com/photo-1518546305927-5a555bb7020d?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1640340434855-6084b1f4901c?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1640161704729-cbe966a08853?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1642104704074-907c0698cbd9?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1621761191319-c6fb62004040?w=400&h=300&fit=crop',
    ],
    videoUrl: 'https://www.youtube.com/shorts/B5iKIy3PcGo?feature=share',
    isYouTubeVideo: true,
  ),
  Project(
    title: 'Detectors',
    description: 'Introducing "Detectors," your all-in-one metal and environmental awareness app for Android. '
        'This innovative application transforms your smartphone into a powerful detection tool, capable of identifying various metals like pistols, knives, and gold, and emitting a loud warning sound upon detection. Beyond metal, Detectors leverages your device'
        ' sensors to provide real-time information on step count, pressure changes, ambient sound levels, current speed, and light intensity. Whether for personal safety, hobbyist exploration, or just curious environmental monitoring, Detectors offers a unique blend of functionality, keeping you informed and alert to your surroundings.',
    technologies: ['java', 'Sensor'],
    icon: Icons.currency_bitcoin,
    imageUrls: [
      'https://images.unsplash.com/photo-1518546305927-5a555bb7020d?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1640340434855-6084b1f4901c?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1640161704729-cbe966a08853?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1642104704074-907c0698cbd9?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1621761191319-c6fb62004040?w=400&h=300&fit=crop',
    ],
    videoUrl: 'https://www.youtube.com/watch?v=crypto123',
    isYouTubeVideo: true,
  ),
];

final List<Project> aiapps = [
  Project(
    title: 'Gemini AI Chatbot',
    description: 'This Flutter-based app integrates Gemini AI using the Gemini API to deliver intelligent, real-time responses and powerful conversational capabilities. Built with a sleek and user-friendly interface, the app allows users to interact with Gemini AI for tasks such as answering questions, generating content, and assisting with everyday queries. Leveraging Google\'s advanced AI technology, the app offers fast, context-aware replies and a smooth user experience across devices. It showcases the potential of combining Flutter\'s cross-platform development with cutting-edge AI, making it ideal for productivity, learning, and experimentation with generative AI features in a mobile environment.',
    technologies: ['Flutter', 'Gemini API'],
    icon: Icons.radar,
    imageUrls: [
      'https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1428515613728-6b4607e44363?w=400&h=300&fit=crop',
    ],
    videoUrl: 'https://www.youtube.com/watch?v=restaurant123',
    isYouTubeVideo: true,
  ),
  Project(
    title: 'AI Financial Manager(Automation)',
    description: 'I created financial automation app using Gemini AI. in this app all task will be complete by AI. data will be get from API. after fetching data then AI started the work.also it can submit day by days report successfully',
    technologies: ['Flutter', 'Gemini API'],
    icon: Icons.manage_accounts,
    imageUrls: [
      'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1538805060514-97d9cc17730c?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=400&h=300&fit=crop',
    ],
    videoUrl: 'https://www.youtube.com/watch?v=fitness123',
    isYouTubeVideo: true,
  ),

  Project(
    title: 'Fitness Tracker',
    description: 'Comprehensive health and fitness tracking app with workout plans, nutrition tracking, and social features.',
    technologies: ['Flutter', 'HealthKit', 'Firebase', 'ML Kit'],
    icon: Icons.fitness_center,
    imageUrls: [
      'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1538805060514-97d9cc17730c?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=400&h=300&fit=crop',
    ],
    videoUrl: 'https://www.youtube.com/watch?v=fitness123',
    isYouTubeVideo: true,
  ),

];

final List<Project> mlApps = [
  Project(
    title: 'Skin Diseases Detector',
    description: 'This skin disease detector app is developed using a combination of Flutter and Java, leveraging machine learning technology to identify skin conditions with accuracy and speed. The app uses a trained data model to detect and classify three common skin diseases from user-submitted images. With a simple and intuitive UI built in Flutter and powerful ML processing handled in Java, the app offers real-time analysis and instant results. Ideal for preliminary health checks, it empowers users to gain insights into potential skin issues. This project demonstrates the effective integration of cross-platform UI and native ML capabilities for healthcare innovation.',
    technologies: ['Flutter', 'TensorFlow-lite', 'Python', 'Java', 'ML'],
    icon: Icons.indeterminate_check_box,
    imageUrls: [
      'https://images.unsplash.com/photo-1507146426996-ef05306b995a?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1555255707-c07966088b7b?w=400&h=300&fit=crop',
    ],
    videoUrl: 'https://www.youtube.com/shorts/EnHmHobX7yE?feature=share',
    isYouTubeVideo: true,
  ),
  Project(
    title: 'OptiVerse',
    description: 'OptiVerse revolutionizes how you shop for sunglasses. Leveraging cutting-edge Augmented Reality (AR), this app brings the fitting room to your fingertips. Simply open ShadeView AR, point your devices camera at your face, and instantly see a vast array of sunglasses rendered virtually, perfectly conforming to your features in real-time. Explore diverse brands, styles, and colors without leaving your home. Compare multiple pairs side-by-side, snap photos of your favorite looks to share, and make confident purchasing decisions. ShadeView AR ensures you find your perfect pair, making sunglass shopping engaging, convenient, and truly personalized.',
    technologies: ['Flutter', 'ML','model data','python'],
    icon: Icons.chat,
    imageUrls: [
      'https://images.unsplash.com/photo-1531746790731-6c087fecd65a?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1677442136019-21780ecad995?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1587560699334-cc4ff634909a?w=400&h=300&fit=crop',
    ],
    videoUrl: 'https://www.youtube.com/watch?v=chatbot123',
    isYouTubeVideo: true,
  ),
  Project(
    title: 'Air Gesture Recognition',
    description: 'Using this app user can art easily without touching display or screen.',
    technologies: ['Flutter', 'OpenCV', 'MediaPipe', 'TensorFlow'],
    icon: Icons.back_hand,
    imageUrls: [
      'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1581092795360-fd1ca04f0952?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1593376853899-fbb47f862266?w=400&h=300&fit=crop',
    ],
    videoUrl: 'https://www.youtube.com/watch?v=gesture123',
    isYouTubeVideo: true,
  ),
  Project(
    title: 'OCR Text Scanner',
    description: 'Optical Character Recognition app with multi-language support, document scanning, and text translation.',
    technologies: ['Flutter', 'ML Kit', 'Firebase'],
    icon: Icons.document_scanner,
    imageUrls: [
      'https://images.unsplash.com/photo-1586281380117-5a60ae2050cc?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1434030216411-0b793f4b4173?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=300&fit=crop',
    ],
  ),
];

final List<Project> sensorApps = [
  Project(
    title: 'Motion Detector',
    description: 'Real-time motion detection using device accelerometer with customizable sensitivity and alert system.',
    technologies: ['Flutter', 'Sensors', 'Firebase', 'Notifications'],
    icon: Icons.motion_photos_on,
    imageUrls: [
      'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1574169208507-84376144848b?w=400&h=300&fit=crop',
    ],
    videoUrl: 'https://www.youtube.com/watch?v=motion123',
    isYouTubeVideo: true,
  ),

  Project(
    title: 'Step Counter',
    description: 'Advanced fitness app using accelerometer and gyroscope sensors with goal setting and achievement tracking.',
    technologies: ['Java', 'sensor'],
    icon: Icons.directions_walk,
    imageUrls: [
      'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1549476464-37392f717541?w=400&h=300&fit=crop',
    ],
  ),

];

final List<Project> ecommerce = [
  Project(
    title: 'Misti Bari',
    description: 'Misti Bari is an E-Commerce Application. In this app there has many kind of food items like sweets,doi,sondesh etc.Here you can do order your favourite foods.',
    technologies: ['Flutter', 'Firebase', 'API'],
    icon: Icons.web,
    imageUrls: [
      'https://private-user-images.githubusercontent.com/44746454/269327531-77cbbcbd-eeaa-4863-99e9-20e4e10d3610.jpg?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDg5NDY5MzksIm5iZiI6MTc0ODk0NjYzOSwicGF0aCI6Ii80NDc0NjQ1NC8yNjkzMjc1MzEtNzdjYmJjYmQtZWVhYS00ODYzLTk5ZTktMjBlNGUxMGQzNjEwLmpwZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA2MDMlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNjAzVDEwMzAzOVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPThlNmJlZjNjMDk4OWVlNTZmYWY5N2Q4ZTYzZTE0OWJkYjYxYTAxNTJmMzk4ZjkyZjkyNGE4MmMxNDA2OThkY2MmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.vr4L-odm4kzzdn7FqM0sSgJGrPAWlAU3ru4MBWGohBI',
      'https://private-user-images.githubusercontent.com/44746454/269327596-83dc6337-e282-4d96-9f95-517b8e1a6975.jpg?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDg5NDY5MzksIm5iZiI6MTc0ODk0NjYzOSwicGF0aCI6Ii80NDc0NjQ1NC8yNjkzMjc1OTYtODNkYzYzMzctZTI4Mi00ZDk2LTlmOTUtNTE3YjhlMWE2OTc1LmpwZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA2MDMlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNjAzVDEwMzAzOVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTUyOGU4ZDBmN2YxM2ViN2UwYjU2Y2Q5MGYzMjdjYzE4Y2EzNjJlM2QxYjU3OTBjNTg4Zjk4MWVkYzJlOGRmZmImWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.EHT_PlM4uGfebSAQg6x8uOLZp9mU5KYqtzsjaXwQ1Ck',
      'https://private-user-images.githubusercontent.com/44746454/269327649-36f14fd0-b41a-42ad-a7c5-483391ffd974.jpg?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDg5NDY5MzksIm5iZiI6MTc0ODk0NjYzOSwicGF0aCI6Ii80NDc0NjQ1NC8yNjkzMjc2NDktMzZmMTRmZDAtYjQxYS00MmFkLWE3YzUtNDgzMzkxZmZkOTc0LmpwZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA2MDMlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNjAzVDEwMzAzOVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWZkMGU4NTUzYWU1ZDZiOGQxMzYyN2U2YTliMWVkOGYwOTY0NzIwMTFkOTk5NzFhZjExNzQ1ZmQzMGMzZGQ0ZDYmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.xL-TEvPBf0hUgnlvpMBqpRi_2rCfLx96mq8CSxyaryY',
      'https://private-user-images.githubusercontent.com/44746454/269327714-518c2ad0-8089-46fd-8815-44047ef26977.jpg?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDg5NDY5MzksIm5iZiI6MTc0ODk0NjYzOSwicGF0aCI6Ii80NDc0NjQ1NC8yNjkzMjc3MTQtNTE4YzJhZDAtODA4OS00NmZkLTg4MTUtNDQwNDdlZjI2OTc3LmpwZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA2MDMlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNjAzVDEwMzAzOVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTlhMjM4YTViN2I3NGFmZmJkNmYzMmNmYTAwYzY5NDBhZjhjODJiYWU2NThlNGJmZTY0NzJmODg5YWM2Y2ZlODYmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.6PXiAcET6zJXDJnE7LV5TACliikQxFxskd0LpoHTPDQ',
      'https://private-user-images.githubusercontent.com/44746454/269327767-c2cf7397-6651-4c22-989a-e63d7bc1f47e.jpg?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDg5NDY5MzksIm5iZiI6MTc0ODk0NjYzOSwicGF0aCI6Ii80NDc0NjQ1NC8yNjkzMjc3NjctYzJjZjczOTctNjY1MS00YzIyLTk4OWEtZTYzZDdiYzFmNDdlLmpwZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA2MDMlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNjAzVDEwMzAzOVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTdkNDc4MDBiMTJmNWU2NTczNWYyOWY2ZmFjNmVjZDNhN2ZiN2IxZDJmYTQ3MmEzNjYxOTYxNjdiZDhkNWFhY2EmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.uvAHa6sR_B-OiFuOhW_jp9C1VPCL6tWeIefpYthjVDo',
      'https://private-user-images.githubusercontent.com/44746454/269327826-cf25befa-8a50-4971-ba74-6f7358f928aa.jpg?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDg5NDY5MzksIm5iZiI6MTc0ODk0NjYzOSwicGF0aCI6Ii80NDc0NjQ1NC8yNjkzMjc4MjYtY2YyNWJlZmEtOGE1MC00OTcxLWJhNzQtNmY3MzU4ZjkyOGFhLmpwZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA2MDMlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNjAzVDEwMzAzOVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPThhYTJlZTU5M2ViZDc1N2UxYmYzNmMyNzdkZGViMjA5ZTA5OTY2OTczMWY0NzZmZDc2YTg1NTQ4NTA2MzU5NWQmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.5KFilur2majc1YdGrxLlwoAIuuyLgsx5TQZ94UZtTgE',
    ],
  ),
];

final List<Project> Others = [

  Project(
    title: 'Telegram Mini Bot App',
    description: 'This Flutter-based Telegram Mini App is inspired by Hamster Kombat and offers an engaging coin-earning experience directly within Telegram. Users can earn coins through tap-to-earn mechanics, watching YouTube videos, claiming daily bonuses, and referring friends. The app also includes sharing features to boost engagement and reach. Built using Flutter Web, it ensures smooth performance and seamless integration with Telegram\'s interface. With real-time updates, gamified interactions, and user authentication via Telegram, the app delivers a fun and rewarding experience. Ideal for users looking to earn while engaging in simple tasks, it showcases the power of Flutter in Telegram Mini App development.',
    technologies: ['Flutter', 'Nodejs', 'MongoDB', 'Render'],
    icon: Icons.telegram,
    imageUrls: [
      'https://images.unsplash.com/photo-1504608524841-42fe6f032b4b?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1419833479618-c595710c0502?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1536431311719-398b6704d4cc?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1502134249126-9f3755a50d78?w=400&h=300&fit=crop',
    ],
    videoUrl: 'https://www.youtube.com/shorts/_tppMs9ES70?feature=share',
    isYouTubeVideo: true,
  ),

  Project(
    title: 'SIM less Communication',
    description: 'This Flutter-based app enables audio calling without the need for internet or a SIM card, using Bluetooth technology to create a direct, offline communication system. Inspired by NFC-style interactions, the app allows users to connect and talk with nearby devices running the same app, making it ideal for remote areas, emergencies, or secure local communication. It features real-time audio transmission, easy device pairing, and a simple user interface. Built entirely with Flutter and Bluetooth APIs, this app showcases the power of offline peer-to-peer communication, offering a practical solution for voice calls without relying on traditional network infrastructure.',
    technologies: ['Flutter', 'Bluetooth', 'Java', 'NFC'],
    icon: Icons.telegram,
    imageUrls: [
      'https://drive.google.com/file/d/1JhNL8NJJj7YY5v_Mmwzcunlqtllmk95w/view?usp=sharing',
      'https://images.unsplash.com/photo-1419833479618-c595710c0502?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1536431311719-398b6704d4cc?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1502134249126-9f3755a50d78?w=400&h=300&fit=crop',
    ],
    videoUrl: 'https://www.youtube.com/shorts/EnHmHo',
    isYouTubeVideo: true,
  ),
  Project(
    title: 'QR and Bar code crate and generator',
    description: 'QR and Bar code crate and generator Flutter app is a powerful QR and Barcode solution. It lets you easily create and generate** QR codes and barcodes for anything you need, from links to contact info. Plus, you can instantly share the encoded data, making information exchange super simple. Its a quick, reliable tool for personal or business use.',
    technologies: ['Flutter', 'QR & BAR Package','Camera'],
    icon: Icons.telegram,
    imageUrls: [
      'https://drive.google.com/file/d/1JhNL8NJJj7YY5v_Mmwzcunlqtllmk95w/view?usp=sharing',
      'https://images.unsplash.com/photo-1419833479618-c595710c0502?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1536431311719-398b6704d4cc?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1502134249126-9f3755a50d78?w=400&h=300&fit=crop',
    ],
    videoUrl: 'https://www.youtube.com/shorts/EnHmHo',
    isYouTubeVideo: true,
  ),
  Project(
    title: 'Dainik Sokal',
    description: 'Introducing the official Dainik Sokal app, built with Flutter! This intuitive application brings the latest news directly to your fingertips. Readers can enjoy a seamless experience Browse breaking news, in-depth articles, and diverse content from Bangladesh and beyond. Journalists, on the go, can easily upload their reports and updates directly through the app, ensuring timely and comprehensive news coverage. Stay informed and connected with Dainik Sokaler, your trusted source for daily news, now more accessible than ever.',

    technologies: ['Flutter', 'API'],
    icon: Icons.telegram,
    imageUrls: [
      'https://drive.google.com/file/d/1JhNL8NJJj7YY5v_Mmwzcunlqtllmk95w/view?usp=sharing',
      'https://images.unsplash.com/photo-1419833479618-c595710c0502?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1536431311719-398b6704d4cc?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1502134249126-9f3755a50d78?w=400&h=300&fit=crop',
    ],
    videoUrl: 'https://www.youtube.com/shorts/EnHmHo',
    isYouTubeVideo: true,
  ),

  Project(
    title: 'Riad Live TV',
    description: 'Riad Live TV, built with Flutter, offers an immersive live streaming experience from over 20 channels across 12+ countries. Users can explore a diverse range of content categorized into Islamic, Sports, Entertainment, News, and Others channels. A standout feature is the free live cricket score updates, keeping fans informed in real-time. Enjoy seamless access to global entertainment and essential news, all within one dynamic application'
        "Discover Riad Live TV, a dynamic Flutter app bringing global entertainment to your fingertips! Stream live content from 12+ countries and 20 channels across 5 distinct categories: Islamic, Sports, Entertainment, News, and Others. Cricket fans rejoice – the app also features a dedicated section for live cricket scores, keeping you updated with real-time action, all completely free. Experience a world of diverse programming and never miss a moment of your favorite live events with Riad Live TV.",

    technologies: ['Flutter', 'API'],
    icon: Icons.telegram,
    imageUrls: [
      'https://drive.google.com/file/d/1JhNL8NJJj7YY5v_Mmwzcunlqtllmk95w/view?usp=sharing',
      'https://images.unsplash.com/photo-1419833479618-c595710c0502?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1536431311719-398b6704d4cc?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1502134249126-9f3755a50d78?w=400&h=300&fit=crop',
    ],
    videoUrl: 'https://www.youtube.com/watch?v=hDMNf_f_LeE',
    isYouTubeVideo: true,
  ),

  Project(
    title: 'Blood Fighters',
    description: "Blood Fighters is a Flutter-built blood donation app designed to connect those in need with willing donors. It features two distinct user experiences: one for **recipients** to easily post blood requests, specifying type and location, and another for **donors** to register their details, availability, and respond to requests. The app streamlines the entire process, making it simple to find and fulfill blood requirements efficiently, ultimately helping to save lives by fostering a strong and responsive donation community.",

    technologies: ['Flutter', 'API'],
    icon: Icons.telegram,
    imageUrls: [
      'https://drive.google.com/file/d/1JhNL8NJJj7YY5v_Mmwzcunlqtllmk95w/view?usp=sharing',
      'https://images.unsplash.com/photo-1419833479618-c595710c0502?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1536431311719-398b6704d4cc?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1502134249126-9f3755a50d78?w=400&h=300&fit=crop',
    ],
    videoUrl: 'https://www.youtube.com/watch?v=pvLuTEsM-vg',
    isYouTubeVideo: true,
  ),

];

class ResponsiveProjectGrid extends StatelessWidget {
  final List<Project> projects;

  const ResponsiveProjectGrid({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine number of columns based on screen width
    int getCrossAxisCount() {
      if (screenWidth >= 1200) return 4;
      if (screenWidth >= 900) return 3;
      if (screenWidth >= 600) return 2;
      return 1;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = getCrossAxisCount();

        // Check if projects overflow the grid
        final maxVisibleProjects = crossAxisCount * 2; // Show 2 rows initially
        final hasOverflow = projects.length > maxVisibleProjects;

        if (hasOverflow) {
          return Column(
            children: [
              // Grid for first set of projects
              Expanded(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.75, // Adjusted for media content
                  ),
                  itemCount: maxVisibleProjects,
                  itemBuilder: (context, index) {
                    return ProjectCard(project: projects[index]);
                  },
                ),
              ),
              SizedBox(height: 20),
              // Horizontal scrollable row for overflow projects
              if (projects.length > maxVisibleProjects)
                Container(
                  height: 320, // Increased height for media content
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, bottom: 10),
                        child: Text(
                          'More Projects',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: projects.length - maxVisibleProjects,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 280, // Increased width for media content
                              margin: EdgeInsets.only(right: 20),
                              child: ProjectCard(
                                project: projects[maxVisibleProjects + index],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        } else {
          // Regular grid view when no overflow
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.75, // Adjusted for media content
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return ProjectCard(project: projects[index]);
            },
          );
        }
      },
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _imageLoadError = false;
  bool _showVideo = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1A237E).withOpacity(0.8),
            Color(0xFF0A0E27).withOpacity(0.9),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color(0xFF00FFFF).withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF00FFFF).withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Media (Image/Video/Icon)
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF00FFFF).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFF00FFFF).withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: _buildMediaContent(),
              ),
            ),
            SizedBox(height: 12),
            // Project Title
            Text(
              widget.project.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            // Project Description
            Expanded(
              child: Text(
                widget.project.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.7),
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 12),
            // Project Technologies
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: widget.project.technologies.take(3).map((tech) =>
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFF00FFFF).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color(0xFF00FFFF).withOpacity(0.3),
                        width: 0.5,
                      ),
                    ),
                    child: Text(
                      tech,
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF00FFFF),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMediaContent() {
    // Priority: Image -> Video -> Icon
    if (widget.project.imageUrl != null && !_imageLoadError && !_showVideo) {
      return Stack(
        children: [
          // Image
          Image.network(
            widget.project.imageUrl!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00FFFF)),
                  strokeWidth: 2,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  _imageLoadError = true;
                });
              });
              return Container();
            },
          ),
          // Video overlay button if video is available
          if (widget.project.videoUrl != null)
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _showVideo = true;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: Color(0xFF00FFFF),
                    size: 20,
                  ),
                ),
              ),
            ),
          // Media type indicator
          Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'IMAGE',
                style: TextStyle(
                  color: Color(0xFF00FFFF),
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );
    }
    // Show video if image failed or video button was pressed
    else if (widget.project.videoUrl != null && (_imageLoadError || _showVideo)) {
      return Stack(
        children: [
          // Video thumbnail or placeholder
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.3),
            child: widget.project.isYouTubeVideo
                ? _buildYouTubeThumbnail()
                : _buildVideoThumbnail(),
          ),
          // Back to image button (if image is available)
          if (widget.project.imageUrl != null && !_imageLoadError)
            Positioned(
              top: 8,
              left: 8,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _showVideo = false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.image,
                    color: Color(0xFF00FFFF),
                    size: 16,
                  ),
                ),
              ),
            ),
          // Play button overlay
          Center(
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFF00FFFF).withOpacity(0.8),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          // Media type indicator
          Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                widget.project.isYouTubeVideo ? 'YOUTUBE' : 'VIDEO',
                style: TextStyle(
                  color: Color(0xFF00FFFF),
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );
    }
    // Fallback to icon
    else {
      return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF00FFFF).withOpacity(0.2),
              Color(0xFF1A237E).withOpacity(0.3),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.project.icon,
              size: 50,
              color: Color(0xFF00FFFF),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'ICON',
                style: TextStyle(
                  color: Color(0xFF00FFFF),
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildYouTubeThumbnail() {
    // Extract YouTube video ID from URL
    String? getYouTubeVideoId(String url) {
      final regExp = RegExp(
        r'(?:youtube\.com\/watch\?v=|youtu\.be\/|youtube\.com\/embed\/)([^&\n?#]+)',
        caseSensitive: false,
      );
      final match = regExp.firstMatch(url);
      return match?.group(1);
    }

    final videoId = getYouTubeVideoId(widget.project.videoUrl!);
    if (videoId != null) {
      final thumbnailUrl = 'https://img.youtube.com/vi/$videoId/maxresdefault.jpg';
      return Image.network(
        thumbnailUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.red.withOpacity(0.2),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.video_library,
                    color: Color(0xFF00FFFF),
                    size: 40,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'YouTube Video',
                    style: TextStyle(
                      color: Color(0xFF00FFFF),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Container(
      color: Colors.red.withOpacity(0.2),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.video_library,
              color: Color(0xFF00FFFF),
              size: 40,
            ),
            SizedBox(height: 8),
            Text(
              'YouTube Video',
              style: TextStyle(
                color: Color(0xFF00FFFF),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoThumbnail() {
    return Container(
      color: Colors.purple.withOpacity(0.2),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.videocam,
              color: Color(0xFF00FFFF),
              size: 40,
            ),
            SizedBox(height: 8),
            Text(
              'Video Content',
              style: TextStyle(
                color: Color(0xFF00FFFF),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}