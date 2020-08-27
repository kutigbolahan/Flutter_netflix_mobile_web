import 'package:flutter/material.dart';
import 'package:netflix_mobile_web/models/models.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginals;

  const ContentList(
      {Key key, this.title, this.contentList, this.isOriginals = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: isOriginals ? 500.0 : 200.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              itemCount: contentList.length,
              itemBuilder: (BuildContext context, int index) {
                final Content content = contentList[index];
                return GestureDetector(
                  onTap: () => print(content.name),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: isOriginals ? 400 : 200,
                    width: isOriginals ? 200 : 130,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(content.imageUrl),
                            fit: BoxFit.cover)),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
