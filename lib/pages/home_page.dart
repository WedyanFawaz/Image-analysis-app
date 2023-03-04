import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_items_identification/widgets/constants.dart';
import 'package:image_items_identification/widgets/AppButton.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
} 

class _HomePageState extends State<HomePage> {
  File? pickedImageF;
  final picker = ImagePicker();

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextApp(
                  label: 'Choose from libary',
                  icon: Icons.photo_library,
                  onPressed: _chooseFromLib,
                ),
                TextApp(
                  label: 'take a picture',
                  icon: Icons.camera,
                  onPressed: _takePictureCamera,
                )
              ],
            ));
  }

  Future<void> _takePictureCamera() async {
    final pickedImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 100);

    setState(() {
      pickedImageF = File(pickedImage!.path);
      isThereImage = true;
    });
  }

  Future<void> _chooseFromLib() async {
    final pickedImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);

    setState(() {
      pickedImageF = File(pickedImage!.path);
      isThereImage = true;
    });
  }

  var isThereImage = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 15, 71, 117),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isThereImage?
                Text(
                  'الصورة المختارة',
                  textAlign: TextAlign.right,
                  style:kstyleText,
                ): Text(
                  'أضف صورة',
                  textAlign: TextAlign.right,
                  style:kstyleText,
                ),
                kverticalSpace2,
                Container(
                  width: double.infinity,
                  height: 230,
                  decoration: kAppContainerDec,
                  child: isThereImage
                      ? SizedBox(
                        height: size.height*0.42,
                        width: size.width*0.8,
                        child: Image.file(pickedImageF!,fit: BoxFit.cover,),
                      )
                      :  SizedBox(
                        height: size.height*0.42,
                        width: size.width*0.8,
                        child: Image.asset('assests/images/import22.png'),
                      ),
                ),
                kverticalSpace,
                AppButton(
                  label: isThereImage ? 'تغيير الصورة' : 'إضافة الصورة هنا',
                  size: size,
                  onPressed: () => showBottomSheet(context),
                ),
                if (isThereImage) ...[
                  AppButton(
                      label: 'حذف الصورة', size: size, onPressed: () {setState(() {
                        isThereImage=false;
                        pickedImageF=null;
                      });}),
                  AppButton(
                      label: 'تحليل الصورة', size: size, onPressed: ()=>identiyItemInImage(context,image:pickedImageF!)),
                ]
              ]),
        ));
  }
}

class TextApp extends StatelessWidget {
  const TextApp({
    required this.label,
    required this.onPressed,
    required this.icon,
    Key? key,
  }) : super(key: key);
  final String label;
  final Function() onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onPressed();
          Navigator.pop(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 8,
            ),
            Icon(icon)
          ],
        ));
  }
}
