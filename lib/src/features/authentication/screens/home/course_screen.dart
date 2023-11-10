import 'package:english_learning/src/constants/image_strings.dart';
import 'package:english_learning/src/constants/sizes.dart';
import 'package:english_learning/src/constants/text_strings.dart';
import 'package:english_learning/src/features/authentication/screens/test/test_page.dart';
import 'package:english_learning/src/utils/theme/widget_themes/button_theme.dart';
import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';

class CourseScreen extends StatefulWidget {
  String imglist;
  CourseScreen(this.imglist, {super.key});
  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final Map<String, List<Map<String, dynamic>>> _vocabularyMap = {
    'Yourself': [
      {'id': 1, 'name': 'Ancestor', 'mean': '👎. Tổ tiên'},
      {'id': 2, 'name': 'agreement  👎', 'mean': '/əˈɡriː.mənt/. Sự thỏa thuận'},
      {'id': 3, 'name': 'specific  (adj)', 'mean': '/spəˈsɪf.ɪk/. Cụ thể'},
      {'id': 4, 'name': 'abide by  (v)', 'mean': '/əˈbaɪd baɪ/. Tuân theo'},
      {'id': 5, 'name': '	market  👎', 'mean': '/ˈmɑːrkɪt/. Thị trường'},
      {'id': 6, 'name': 'persuasion  👎', 'mean': '/pɚˈsweɪ.ʒən/. Sự thuyết phục'},
      {'id': 7, 'name': 'consume  (v)', 'mean': '/kən’sju:m/. Tiêu thụ'},
      {'id': 8, 'name': 'establish  (v)', 'mean': '/ɪˈstæblɪʃ/. Thành lập'},
      {'id': 9, 'name': 'resolve  (v)', 'mean': '/rɪˈzɔːlv/. Giải quyết'},
      {'id': 10, 'name': 'engage  (v)', 'mean': '/ɪnˈɡeɪdʒ/. Tham dự'},
    ],
    'Holidays': [
      {'id': 1, 'name': 'Airline schedule', 'mean': 'ˈeəlaɪn ˈʃedjuːl. lịch bay'},
      {'id': 2, 'name': 'Check-in  👎', 'mean': '/tʃek – ɪn/. 	giấy tờ vào cửa'},
      {'id': 3, 'name': 'High season  (adj)', 'mean': '/haɪ ˈsiːzn/. 	Mùa cao điểm'},
      {'id': 4, 'name': 'Itinerary (v)', 'mean': '/	aɪˈtɪnərəri/. Lịch trình'},
      {'id': 5, 'name': '	Destination  👎', 'mean': '/desti’neiʃn/. Điểm đến'},
    ],
    'Sports': [
      {'id': 1, 'name': 'Canoeing', 'mean': '/kəˈnuː.ɪŋ/. Chèo thuyền ca-nô'},
      {'id': 2, 'name': 'Gymnastics ', 'mean': '/dʒɪmˈnæs.tɪks/. Tập thể hình'},
      {'id': 3, 'name': 'Horse racing ', 'mean': '/ˈhɔːs ˌreɪ.sɪŋ/.	Đua ngựa'},
      {'id': 4, 'name': 'Mountaineering', 'mean': '/ˌmaʊn.tɪˈnɪə.rɪŋ/. 	Leo núi'},
      {'id': 5, 'name': '	Volleyball ', 'mean': '/ˈvɒl.i.bɔːl/. 	Bóng chuyền'},
    ],
    'Family': [
      {'id': 1, 'name': 'Dysfunctional family ', 'mean': '/dɪsˈfʌŋkʃənl ˈfæm·ə·li/. Gia đình bất ổn'},
      {'id': 2, 'name': 'Single parent ', 'mean': '/ˈsɪŋ.ɡəl ˈper.ənt/. Bố hoặc mẹ đơn thân '},
      {'id': 3, 'name': 'Only - child  ', 'mean': '/ˌəʊnli ˈtʃaɪld/.	Gia đình một con '},
      {'id': 4, 'name': 'Parent', 'mean': '	/ˈpeərənt/. 	Bố mẹ '},
      {'id': 5, 'name': '	Cousin ', 'mean': '/ˈkʌzn/. Anh em họ '},
    ],
    // Add more imglist entries as needed
  };

  List<Map<String, dynamic>> _foundWords = [];

  @override
  void initState() {
    super.initState();
    _loadVocabulary();
  }
  void _loadVocabulary() {
    if (_vocabularyMap.containsKey(widget.imglist)) {
      _foundWords = _vocabularyMap[widget.imglist]!;
    } else {
      // Handle the case where imglist is not found in the map
      _foundWords = [];
    }
  }
  void _filter(String key) {
    List<Map<String, dynamic>> results = [];
    if (key.isEmpty) {
      results = _vocabularyMap[widget.imglist] ?? [];
    } else {
      results = _vocabularyMap[widget.imglist]
          ?.where((element) => element['name'].toLowerCase().contains(key.toLowerCase()))
          .toList() ?? [];
    }
    setState(() {
      _foundWords = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.imglist,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(tBackground),
              fit: BoxFit.cover,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
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
              const SizedBox(height: 20),
              const Text(
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
                      color: Colors.white,
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
                      return const Learning();
                    }),
                  );
                },
                backgroundColor: tBackgroundButtonColor,
                textColor: tTextButtonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}