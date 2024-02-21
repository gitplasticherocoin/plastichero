import 'package:flutter/material.dart';
import 'package:plastichero/constants/color_theme.dart';
import 'package:plastichero/constants/setting.dart';

import '../widget/button_widget.dart';


/* example
showDialog(
  context: context,
  barrierColor: Colors.transparent,
  barrierDismissible: true,
  builder: (BuildContext context) => InfoDialog(
    title: 'What_is_Master_Key'.tr(),
    body: 'What_is_Master_Key_guide'.tr(),
    btnText: 'OK'.tr(),
    onConfirm: () {
    },
  ),
);
*/

class InfoDialog extends StatefulWidget {
  final String body;
  final String? btnText;
  final VoidCallback? onConfirm;

  const InfoDialog({
    Key? key,
    required this.body,
    this.btnText,
    this.onConfirm,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InfoDialogState();
  }
}

class _InfoDialogState extends State<InfoDialog> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 32.0;
    if (width > 328.0) {
      width = 328.0;
    }
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      content: SingleChildScrollView(
        child: Container(
          width: width,
          margin: EdgeInsets.zero,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                physics: const BouncingScrollPhysics(),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    widget.body,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      height: 1.6,
                      fontSize: 14,
                      fontFamily: Setting.appFont,
                      fontWeight: FontWeight.w500,
                      color: Color(ColorTheme.c_212121),
                    ),
                  ),
                ),
              ),
              Container(
                height: 1,
                color: const Color(ColorTheme.c_ededed),
              ),
              Flexible(
                flex: 1,
                child: ButtonStyle1(
                  text: widget.btnText,
                  radius: 0.0,
                  onTap: () {
                    Navigator.of(context).pop();
                    if (widget.onConfirm != null) {
                      widget.onConfirm!.call();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
