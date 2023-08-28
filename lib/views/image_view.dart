import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatefulWidget {
  final String imgUrl;
  ImageView({required this.imgUrl});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  var filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Hero(
          tag: widget.imgUrl,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              widget.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _save();
                },
                child: Stack(
                  children: [
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 2,
                      // color: Color(0xff1C1B1B).withOpacity(0.8),
                      decoration: BoxDecoration(
                          color: Color(0xff1C1B1B).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white54, width: 1),
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)])),
                      child: Column(
                        children: [
                          Text(
                            "Set Wallpaper",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                          Text(
                            "Image will be saved in gallery",
                            style:
                                TextStyle(fontSize: 11, color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 14,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        )
      ],
    ));
  }

  // _save() async {
  //   if (Platform.isAndroid) {
  //     await _askPermission();
  //   }
  //   var response = await Dio()
  //       .get(widget.imgUrl, options: Options(responseType: ResponseType.bytes));
  //   final result =
  //       await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
  //   print(result);
  //   Navigator.pop(context);
  // }

  // _askPermission() async {
  //   if (Platform.isIOS) {
  //     /*Map<PermissionGroup, PermissionStatus> permissions =
  //         */
  //     await PermissionHandler().requestPermissions([PermissionGroup.photos]);
  //   } else {
  //     /* PermissionStatus permission = */ await PermissionHandler()
  //         .checkPermissionStatus(PermissionGroup.storage);
  //   }
  // }

  // _save() async {
  //   if (Platform.isAndroid) {
  //     await _askPermission();
  //   }
  //   try {
  //     Response response = await Dio().get(widget.imgUrl,
  //         options: Options(responseType: ResponseType.bytes));
  //     Uint8List bytes = Uint8List.fromList(response.data);
  //     final result = await ImageGallerySaver.saveImage(bytes);
  //     print(result);
  //   } catch (e) {
  //     print('Error saving image: $e');
  //   }
  //   Navigator.pop(context);
  // }

  // _askPermission() async {
  //   if (Platform.isIOS) {
  //     var status = await Permission.photos.request();
  //     if (status.isDenied) {
  //       // Handle denied permission
  //     }
  //   } else {
  //     var status = await Permission.storage.request();
  //     if (status.isDenied) {
  //       // Handle denied permission
  //     }
  //   }
  // }

  _save() async {
    if (Platform.isAndroid) {
      await _askPermission();
    }

    var response = await Dio()
        .get(widget.imgUrl, options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
  }

  _askPermission() async {
    if (Platform.isIOS) {
      await Permission.photos.request();
    } else {
      await Permission.storage.request();
    }
  }
}


// 2:10:40