
import 'dart:io';

import "package:filters_camera/provider/app_state.dart";
import 'package:filters_camera/ui/widgets/load_photo.dart';
import "package:filters_camera/ui/widgets/other_buttons.dart";
import "package:filters_camera/ui/widgets/photo_with_filters.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../helpers/filters.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey globalKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    AppStateProvider currentStateImage = Provider.of<AppStateProvider>(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF701ebd),
          Color(0xFF873bcc),
          Color(0xFFfe4a97),
          Color(0xFFe17763),
          Color(0xFF68998c),
        ], stops: [
          0.1,
          0.4,
          0.6,
          0.8,
          1
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (currentStateImage.myImageFilter.getFirstView &&
              currentStateImage.myImageFilter.getMyPhoto != "")
            Container(
              constraints:
                  BoxConstraints(maxWidth: size.width, maxHeight: size.width),
              child:
                  Image.file(File(currentStateImage.myImageFilter.getMyPhoto)),
            ),
          if (currentStateImage.myImageFilter.getNumberFilter != null)
            RepaintBoundary(
              key: globalKey,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: size.width,
                  maxHeight: size.width,
                ),
                child: ColorFiltered(
                  colorFilter: ColorFilter.matrix(filters[
                      currentStateImage.myImageFilter.getNumberFilter as int]),
                  child: Image.file(
                    File(currentStateImage.myImageFilter.getMyPhoto),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          SizedBox(
            height: size.height * 0.03,
          ),
          if (!currentStateImage.myImageFilter.changePosition)
            const LoadPhoto()
          else
            OthersButtons(
             myGlobalKey: globalKey,
            ),
          SizedBox(
            height: size.height * 0.04,
          ),
          currentStateImage.myImageFilter.getChangePosition &&
                  currentStateImage.myImageFilter.getMyPhoto != ""
              ? const PhotoWithFilters()
              : Container()
        ]),
      ),
    );
  }
}
