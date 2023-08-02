import 'package:flutter/material.dart';
import 'data.dart';
import 'data_service.dart';
import 'detail_view.dart';

class MainListView extends StatelessWidget {
  const MainListView({
    Key? key,
    required this.dataService,
  }) : super(key: key);

  final DataService dataService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main List View')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.separated(
          itemCount: dataService.dataList.length,
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemBuilder: (context, index) {
            Data data = dataService.dataList.elementAt(index);
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(data: data),
                  ),
                );
              },
              child: Hero(
                tag: data.thumbnail,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 220,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(data.thumbnail),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Opacity(
                        opacity: 0.5,
                        child: Container(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SizedBox(
                        height: 215,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 15,
                              child: Text(
                                data.title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: 35,
                              margin: EdgeInsets.only(top: 4),
                              child: Text(data.content,
                                  style: TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
