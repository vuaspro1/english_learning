import 'package:english_learning/src/constants/image_strings.dart';
import 'package:english_learning/src/constants/sizes.dart';
import 'package:english_learning/src/constants/text_strings.dart';
import 'package:english_learning/src/features/authentication/screens/home/course_screen.dart';
import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../nav_bar/nav_bar_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  get onPressed => null;

  List imglist=[
    "Yourself",
    "Holidays",
    "Sports",
    "Family"
  ];
  @override
  Widget build(BuildContext context) {
    TabController tabController=TabController(length: 4, vsync: this);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(tBackground),
                fit: BoxFit.cover,
              )
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Hello $tUserName", style: Theme.of(context).textTheme.headlineSmall?.copyWith()),
                            Text(twelcome, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.blueGrey)),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NavBarScreen(initialPageIndex: 3)),
                            );
                          },
                          child: const CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(tavt),
                          ),
                        ),

                      ],
                    ),
                    // const SizedBox(height: 10), // Khoảng cách giữa các dòng
                  ],
                ),
              ),
              const SizedBox(height: 25),
              //cards
              Container(
                  width: 350,
                  padding:const EdgeInsets.all(20) ,
                  decoration: BoxDecoration(
                    color: tBoxDecoration,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            tlearning_english,
                            style: TextStyle(
                              color: tDarkColor,
                              fontSize: tFontTextButton,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: onPressed,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: tTextButtonColor, // Màu nền của nút
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0), // Đặt borderRadius tại đây
                              ),
                            ),
                            child: const Text("Start", style: TextStyle(color: tDarkColor)), // Đổi màu văn bản
                          ),
                        ],
                      ),
                      Image.asset(
                        trocket,
                        width: 100,
                        height: 100,
                      )
                    ],
                  )
              ),
              const SizedBox(height: 30),
              //tabbar
              Container(
                margin: const EdgeInsets.all(10),
                child: TabBar(
                  controller: tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(text: talltopics),
                    Tab(text: tyourtopics),
                    Tab(text: trecently),
                    Tab(text: tpractice),
                  ],
                ),
              ),

              SingleChildScrollView(
                  child:SizedBox(
                    height: 410, // Set the desired height
                    child: SizedBox(
                      width: double.maxFinite,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          GridView.builder(
                            itemCount: imglist.length,
                            shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                              // Adjust the aspect ratio as needed
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context)=>
                                        CourseScreen(imglist[index]),));
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
                                            "assets/images/${imglist[index]}.png",
                                            width: 100,
                                            height: 100,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          imglist[index],
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
                          const Text("I"),
                          const Text("hi"),
                          const Text("sanh"),
                        ],
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}