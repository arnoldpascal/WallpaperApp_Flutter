import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/image_view.dart';
import '../model/wallpaper_model.dart';

Widget brandName() {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      children: const <TextSpan>[
        TextSpan(
            text: 'Pixel',
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
        TextSpan(
            text: 'Wallpaper',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500)),
      ],
    ),
  );
}
// style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
// style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500)

Widget credit() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "Made by",
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
      ),
      Text(
        " Arnold Pascal",
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
      )
    ],
  );
}

Widget poweredBy() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "© Powered by",
        style: TextStyle(
            color: const Color.fromARGB(255, 40, 200, 123),
            fontSize: 14,
            fontWeight: FontWeight.w400),
      ),
      Text(
        " Pexels API",
        style: TextStyle(
            color: Color.fromARGB(255, 15, 177, 99),
            fontWeight: FontWeight.w500,
            fontSize: 14),
      ),
    ],
  );
}

Widget wallpapersList({required List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageView(
                            imgUrl: wallpaper.src.portrait,
                          )));
            },
            child: Hero(
              tag: wallpaper.src.portrait,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    wallpaper.src.portrait,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
