import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class DataService extends ChangeNotifier {
  List<Data> dataList = []; // 책 목록

  // DataService 생성자 내에서 init 함수를 호출하도록 수정
  DataService() {
    init();
  }

  void init() {
    search();
    notifyListeners(); // 데이터 로드 완료 후 리스너에게 변경 알림을 보냄
  }

  void search() async {
    print('object');
    Response res = await Dio().get(
      "http://52.79.115.43:8090/api/collections/news/records",
    );
    List items = res.data["items"];
    for (Map<String, dynamic> item in items) {
      Data data = Data(
        id: item['id'],
        title: item['title'] ?? "",
        author: item['author'] ?? "",
        thumbnail: item['thumbnail'] ??
            "https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg",
        collectionId: item['collectionId'] ?? "",
        collectionName: item['collectionName'] ?? "",
        content: item['content'] ?? "",
        create: item['create'] ?? "",
        newsUrl: item['news_url'] ?? "",
        updated: item['updated'] ?? "",
        viewer: item['viewer'] ?? "",
      );
      dataList.add(data);
    }
  }
}
