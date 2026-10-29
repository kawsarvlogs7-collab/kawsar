import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kawsar Secure App',
      theme: ThemeData.dark(),
      home: const PasswordScreen(),
    );
  }
}

// ১. পাসওয়ার্ড বা পিন দেওয়ার স্ক্রিন
class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passController = TextEditingController();
  final String mySecretPin = "510"; // আপনার পাসওয়ার্ড ৫১০ সেট করা আছে
  String errorMessage = "";

  void checkPassword() {
    if (_passController.text == mySecretPin) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const VideoFeedScreen()),
      );
    } else {
      setState(() {
        errorMessage = "ভুল পাসওয়ার্ড! সঠিক পাসওয়ার্ড দিন (৫১০)।";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('কাউসারের সিকিউর অ্যাপ - লগইন')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'অ্যাপটি ওপেন করতে পিন দিন (পিন: 510)',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passController,
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'পাসওয়ার্ড পিন (510)',
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: checkPassword,
              child: const Text('লগইন করুন'),
            ),
            const SizedBox(height: 10),
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

// ২. মূল ভিডিও ফিড স্ক্রিন
class VideoFeedScreen extends StatelessWidget {
  const VideoFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> videoList = [
      'ভিডিও ১ লিংক',
      'ভিডিও ২ লিংক',
      'ভিডিও ৩ লিংক',
    ];

    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videoList.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                color: Colors.black,
                child: Center(
                  child: Text(
                    'এখানে ভিডিও প্লে হবে \n(${videoList[index]})',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Positioned(
                right: 15,
                bottom: 80,
                child: Column(
                  children: const [
                    IconButton(
                      icon: Icon(Icons.favorite, color: Colors.white, size: 35),
                      onPressed: null,
                    ),
                    Text('লাইক', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 20),
                    IconButton(
                      icon: Icon(Icons.comment, color: Colors.white, size: 35),
                      onPressed: null,
                    ),
                    Text('কমেন্ট', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 20),
                    IconButton(
                      icon: Icon(Icons.share, color: Colors.white, size: 35),
                      onPressed: null,
                    ),
                    Text('শেয়ার', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              Positioned(
                left: 15,
                bottom: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '@kawsar',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'এটি কাউসারের সিকিউর অ্যাপ! #trending #secure',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
