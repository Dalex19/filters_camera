import 'package:filters_camera/helpers/my_images_pickers.dart';
import 'package:filters_camera/provider/app_state.dart';
import 'package:filters_camera/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OthersButtons extends StatelessWidget {
  final GlobalKey myGlobalKey;

  const OthersButtons({
    Key? key,
    required this.myGlobalKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppStateProvider currentStateImage = Provider.of<AppStateProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButtom(
            myColors: const [Color(0XFF838FFF), Color(0XFF5D52FF)],
            doSomething: () {
              currentStateImage.secondChange();
            },
            children: const Icon(
              Icons.clear,
              size: 45,
            )),
        const SizedBox(
          width: 50,
        ),
        CustomButtom(
            myColors: const [Color(0XFF17E8D1), Color(0XFF0D96A1)],
            doSomething: () async {
              bool? status = await MyImagePicker.capturePng(myGlobalKey);
              if (status != null) {
                final snackBar = SnackBar(
                  backgroundColor: const Color(0XFF69F0AE),
                  behavior: SnackBarBehavior.floating,
                  content: const Text(
                    'Imagen guardada! :D',
                    style: TextStyle(color: Colors.black),
                  ),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      currentStateImage.secondChange();
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            children: const Icon(
              Icons.download_done_rounded,
              size: 50,
            )),
      ],
    );
  }
}
