import 'package:english_learning/src/constants/sizes.dart';
import 'package:english_learning/src/constants/text_strings.dart';
import 'package:english_learning/src/features/authentication/screens/test/test.dart';
import 'package:english_learning/src/utils/theme/widget_themes/button_theme.dart';
import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';

class CourseScreen extends StatefulWidget {
  String imglist;
  CourseScreen(this.imglist);
  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  List<Map<String, dynamic>> get _allWords => [
    {'id': 1, 'name': 'Abate', 'mean': 'v. to diminish in intensity'},
    {'id': 2, 'name': 'Aberrant', 'mean': 'adj. diverging from the standard type'},
    {'id': 3, 'name': 'Abjure', 'mean': 'v. to reject or renounce'},
    {'id': 4, 'name': 'Abscond', 'mean': 'v. to leave secretly, evading detection'},
    {'id': 5, 'name': 'Abstain', 'mean': 'v. to voluntarily refrain from doing something'},
    {'id': 6, 'name': 'Acumen', 'mean': 'n. keen judgment and perception'},
    {'id': 7, 'name': 'Admonish', 'mean': 'v. scold or to advise firmly'},
    {'id': 8, 'name': 'Adulterate', 'mean': 'v. to contaminate or make impure by introducing inferior elements'},
    {'id': 9, 'name': 'Advocate', 'mean': 'v. to recommend, support, or advise'},
    {'id': 10, 'name': 'Aesthetic', 'mean': 'adj. concerned with the nature of beauty and art'},
  ];

  List<Map<String, dynamic>> _foundWords = [];

  @override
  void initState() {
    super.initState();
    _foundWords = _allWords;
  }

  void _filter(String key) {
    List<Map<String, dynamic>> results = [];
    if (key.isEmpty) {
      results = _allWords;
    } else {
      results = _allWords
          .where((element) => element['name'].toLowerCase().contains(key.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundWords = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        title: Text(
            widget.imglist,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
        body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: tviewtabbar,
                image: DecorationImage(
                  image: AssetImage("assets/images/${widget.imglist}.png"),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Vocabulary",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextField(
              onChanged: (value) => _filter(value),
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                labelText: 'Search...',
                labelStyle: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: _foundWords.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundWords.length,
                itemBuilder: (context, index) {
                  return Card(
                    key: ValueKey(_foundWords[index]['id']),
                    color: Colors.lightBlueAccent.shade200,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(
                        _foundWords[index]['name'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: Colors.black,
                            fontSize: 18),
                      ),
                      subtitle: Text(_foundWords[index]['mean'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: Colors.black,
                              fontSize: 16)),
                      // trailing: Text(
                      //     _allWords[index]['id'].toString(),
                      //     style: const TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //         letterSpacing: 1,
                      //         color: Colors.black,
                      //         fontSize: 15,
                      //         backgroundColor: Colors.white)),
                    ),
                  );
                },
              )
                  : const Center(
                    child: Text('Nothing Found'),
              ),
            ),
            const SizedBox(height: tFormHeight - 10),
            buildCustomButton(
              text: ttest,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const TestScreen();
                  }),
                );
              },
              backgroundColor: tBackgroundButtonColor,
              textColor: tTextButtonColor,
            ),
          ],
        ),
      ),
    );
  }
}
