import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/theme/themedata.dart';
import '../widgets/primary_widget/custom_text_widget.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  File? image;
  Future imagePicker() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      final imageTwmporary = File(image.path);

      setState(() {
        this.image = imageTwmporary;
      });
    } on PlatformException catch (e) {
      print(e);
      const AlertDialog(
        title: CustomTextWidget(text: 'Falied to get image'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                image != null
                    ? Stack(children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                  image: FileImage(image!), fit: BoxFit.cover)),
                        ),
                        const Positioned(
                            top: 85,
                            left: 70,
                            child: Icon(
                              Icons.verified_user,
                              color: Colors.green,
                            )),
                      ])
                    : Stack(children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: const DecorationImage(
                              image: AssetImage('assets/image/me.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Positioned(
                            top: 85,
                            left: 70,
                            child: Icon(
                              Icons.verified_user,
                              color: Colors.green,
                            )),
                      ]),
                const SizedBox(width: 70),
                const CustomTextWidget(
                  text: '_Jannrayyy',
                  color: Colors.white,
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(0.3),
                width: 450,
                color: Colors.white),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                imagePicker();
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.photo,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: textBg1),
                      child: const CustomTextWidget(
                        text: 'Change Profile',
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.history,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: textBg1),
                    child: const CustomTextWidget(
                      text: 'History',
                      color: Colors.white,
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Iconify(
                  Ic.round_outlined_flag,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: textBg1),
                    child: const CustomTextWidget(
                      text: 'Watch Later',
                      color: Colors.white,
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: textBg1),
                    child: const CustomTextWidget(
                      text: 'Favories',
                      color: Colors.white,
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.diamond,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: textBg1),
                    child: const CustomTextWidget(
                      text: 'Purchase Premium',
                      color: Colors.white,
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: textBg1),
                    child: const CustomTextWidget(
                      text: 'General',
                      color: Colors.white,
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: textBg1),
                    child: const CustomTextWidget(
                      text: 'Log Out',
                      color: Colors.white,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
