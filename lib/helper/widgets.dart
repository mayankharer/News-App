import 'package:flutter/material.dart';
import 'package:news_app_api/views/article_view.dart';

Widget MyAppBar() {
  return AppBar(
    foregroundColor: Colors.black,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Todays -",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        Text(
          "News",
          style: TextStyle(
              color: Colors.lightBlueAccent, fontWeight: FontWeight.w600),
        )
      ],
    ),
    backgroundColor: Colors.blueGrey[700],
    elevation: 0.0,
  );
}

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  NewsTile({
    this.imgUrl,
    this.desc,
    this.title,
    this.content,
    @required this.posturl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(
              postUrl: posturl,
            ),
          ),
        );
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(6),
                  bottomLeft: Radius.circular(6),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        imgUrl,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
