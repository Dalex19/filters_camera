import 'package:filters_camera/helpers/my_images_pickers.dart';
import 'package:filters_camera/ui/widgets/custom_button.dart';
import 'package:filters_camera/ui/widgets/custom_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/app_state.dart';

class LoadPhoto extends StatelessWidget {
  const LoadPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    AppStateProvider imageStateRef = Provider.of<AppStateProvider>(context);

    return Center(
      child: CustomButtom(
          myColors: const [Color(0xFFFA7DC2), Color(0XFFEB42D0)],
          doSomething: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              barrierColor: Colors.transparent,
              builder: (context) {
                return CustomModal(
                  children: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: IconButton(
                              onPressed: () async {
                                String? photoCopy =
                                    await MyImagePicker.takePhoto();
                                (photoCopy != null)
                                    ? imageStateRef.chargeImage(photoCopy)
                                    : imageStateRef.secondChange();
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 100,
                              )),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: IconButton(
                              onPressed: () async {
                                String? photoCopy =
                                    await MyImagePicker.pickGallery();
                                (photoCopy != null)
                                    ? imageStateRef.chargeImage(photoCopy)
                                    : imageStateRef.secondChange();
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.photo_album,
                                color: Colors.white,
                                size: 90,
                              )),
                        )
                      ]),
                );
              },
            );
          },
          children: const Text(
            "ESCOGE UNA FOTO",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: "CustomFont",
                letterSpacing: 2),
          )),
    );
  }
}
