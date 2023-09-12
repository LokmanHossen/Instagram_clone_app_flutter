import 'package:flutter/material.dart';
import 'package:instagram_clone_app/sign_up.dart';

class OnBordaring extends StatefulWidget {
  const OnBordaring({super.key});

  @override
  State<OnBordaring> createState() => _OnBordaringState();
}

class _OnBordaringState extends State<OnBordaring> {
  final _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              children: const [
                OnBordaringScreen(
                  headingText: 'Connect',
                  heading: 'With your friends',
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/fir-c41ab.appspot.com/o/onboarding2.png?alt=media&token=224cbba6-9cc2-459f-baa5-cd0e154ad0ce&_gl=1*1ilyao7*_ga*MTMyNTIwNzg5Mi4xNjUzMzIzMzkz*_ga_CW55HF8NVT*MTY4NjY0MDc0Ni4xMjcuMC4xNjg2NjQwNzQ2LjAuMC4whttps://firebasestorage.googleapis.com/v0/b/fir-c41ab.appspot.com/o/onboarding2.png?alt=media&token=224cbba6-9cc2-459f-baa5-cd0e154ad0ce&_gl=1*1ilyao7*_ga*MTMyNTIwNzg5Mi4xNjUzMzIzMzkz*_ga_CW55HF8NVT*MTY4NjY0MDc0Ni4xMjcuMC4xNjg2NjQwNzQ2LjAuMC4w',
                  paragraph:
                      'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document',
                  subheading: 'Direct Message',
                ),
                OnBordaringScreen(
                  headingText: 'Post',
                  heading: 'Your best Moment',
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/fir-c41ab.appspot.com/o/onboarding1.png?alt=media&token=fa5c3024-5e2c-4132-a1c8-993c3967e082&_gl=1*11q0rag*_ga*MTMyNTIwNzg5Mi4xNjUzMzIzMzkz*_ga_CW55HF8NVT*MTY4NjY0MDc0Ni4xMjcuMS4xNjg2NjQwNzUxLjAuMC4w',
                  paragraph:
                      'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document',
                  subheading: ' Create Videos',
                ),
                OnBordaringScreen(
                  headingText: 'Connect',
                  heading: 'With your friends',
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/fir-c41ab.appspot.com/o/onboarding2.png?alt=media&token=224cbba6-9cc2-459f-baa5-cd0e154ad0ce&_gl=1*1ilyao7*_ga*MTMyNTIwNzg5Mi4xNjUzMzIzMzkz*_ga_CW55HF8NVT*MTY4NjY0MDc0Ni4xMjcuMC4xNjg2NjQwNzQ2LjAuMC4whttps://firebasestorage.googleapis.com/v0/b/fir-c41ab.appspot.com/o/onboarding2.png?alt=media&token=224cbba6-9cc2-459f-baa5-cd0e154ad0ce&_gl=1*1ilyao7*_ga*MTMyNTIwNzg5Mi4xNjUzMzIzMzkz*_ga_CW55HF8NVT*MTY4NjY0MDc0Ni4xMjcuMC4xNjg2NjQwNzQ2LjAuMC4w',
                  paragraph:
                      'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document',
                  subheading: 'Direct Message',
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 40,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(microseconds: 500),
                      curve: Curves.ease,
                    );
                  }
                  // _pageController.nextPage(
                  //     duration: const Duration(microseconds: 500),
                  //     curve: Curves.ease);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color.fromARGB(255, 166, 76, 6),
                ),
                child: const Text('Next'),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 12,
            child: ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 12,
                  width: 12,
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.white : Colors.blue,
                    borderRadius: BorderRadius.circular(50),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class OnBordaringScreen extends StatelessWidget {
  const OnBordaringScreen({
    super.key,
    required this.imageUrl,
    required this.heading,
    required this.subheading,
    required this.paragraph,
    required this.headingText,
  });
  final String imageUrl;
  final String heading;
  final String subheading;
  final String paragraph;
  final String headingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.network(
            'https://cdn.pixabay.com/photo/2016/02/10/20/00/symbol-of-infinity-of-autism-1192408_1280.png',
            width: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 210,
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.only(left: 10),
              decoration: const BoxDecoration(
                  border: Border(
                      left: BorderSide(
                color: Color.fromARGB(255, 246, 87, 8),
                width: 4.0,
              ))),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 32),
                  children: [
                    TextSpan(
                      text: headingText,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 246, 87, 8),
                      ),
                    ),
                    TextSpan(
                      text: heading,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Image.network(
            imageUrl,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            subheading,
            style: const TextStyle(
              color: Color.fromARGB(255, 177, 175, 175),
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            paragraph,
            style: const TextStyle(
                color: Color.fromARGB(255, 177, 175, 175), fontSize: 18),
          ),
        ],
      ),
    );
  }
}
