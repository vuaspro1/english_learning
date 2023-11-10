import 'package:english_learning/src/constants/colors.dart';
import 'package:english_learning/src/constants/image_strings.dart';
import 'package:english_learning/src/features/authentication/screens/home/course_screen.dart';
import 'package:flutter/material.dart';

class TopicScreen extends StatefulWidget {
  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  TextEditingController _searchController = TextEditingController();
  List imgtopic = [
    "Yourself",
    "Holidays",
    "Sports",
    "Family",
    "Transport",
    "Education",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: ("Search..."),
            hintStyle: TextStyle(color: Colors.white),
            prefixIcon: Icon(Icons.search, color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(tBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                GridView.builder(
                  itemCount: imgtopic.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseScreen(imgtopic[index]),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: tviewtabbar,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(
                                  "assets/images/${imgtopic[index]}.png",
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                imgtopic[index],
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
