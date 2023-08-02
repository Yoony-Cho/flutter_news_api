import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'data.dart';

class DetailScreen extends StatelessWidget {
  final Data data;

  const DetailScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen')),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: data.thumbnail,
                  child: Image(image: NetworkImage(data.thumbnail)),
                ),
                SizedBox(height: 16),
                Text(
                  data.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Text(data.author),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          launchURL(data.newsUrl);
                        },
                        child: Text("Full Article"),
                      )
                    ],
                  ),
                ),
                Divider(),
                SizedBox(height: 16),
                Text(data.content),
                // 상세 정보를 보여주는 다른 위젯들을 추가할 수 있습니다.
              ],
            ),
          ),
        ],
      ),
    );
  }

  void launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
