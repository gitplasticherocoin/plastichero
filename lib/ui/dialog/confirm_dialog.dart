
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:plastichero/constants/color_theme.dart';
import 'package:plastichero/constants/common.dart';
import 'package:plastichero/constants/setting.dart';
import 'package:plastichero/ui/widget/button_widget.dart';

class ConfirmDialog extends StatefulWidget {
  final String body;
  final String? btnConfirmText;
  final Function()? onConfirm;
  final String? btnCancelText;
  final Function()? onCancel;
  final Color? btnCancelColor;
  final Color? btnCancelTextColor;
  final Color? btnConfirmColor;
  final Color? btnConfirmTextColor;
  final String? imgUrl;
  final double width;
  final double height;

  const ConfirmDialog(
      {Key? key,
        required this.body,
        this.imgUrl,
        this.btnConfirmText,
        this.onConfirm,
        this.btnCancelText,
        this.onCancel,
        this.btnCancelColor,
        this.btnCancelTextColor,
        this.btnConfirmColor,
        this.btnConfirmTextColor,
        this.width = 0,
        this.height = 0})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ConfirmDialogState();
  }
}

class ConfirmDialogState extends State<ConfirmDialog> {
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
      iconPadding: EdgeInsets.zero,
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
          width: widget.width > 0 ? widget.width : null,
          height: widget.height > 0 ? widget.height + 1 + Common.boxH : null,
          margin: EdgeInsets.zero,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              widget.imgUrl != null
                  ? SizedBox(
                height: widget.height > 0 ? widget.height : 200,
                width: widget.width > 0 ? widget.width : 200,
                child: CachedNetworkImage(
                  imageUrl: widget.imgUrl ?? '',
                  fit: BoxFit.fill,
                  width: widget.width > 0 ? widget.width : 200,
                  height: widget.height > 0 ? widget.height : 200,
                  placeholder: (_, __) {
                    return noImgView();
                  },
                  errorWidget: (_, __, ___) {
                    return noImgView();
                  },
                ),
              )
                  : SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16.0, 42.0, 16.0, 45.0),
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
              Row(children: [
                Flexible(
                  flex: 1,
                  child: ButtonStyle1(
                    text: widget.btnCancelText ?? 'no'.tr(),
                    radius: 0.0,
                    btnColor: widget.btnCancelColor ?? const Color(ColorTheme.c_ffffff),
                    textColor: widget.btnCancelTextColor ?? const Color(ColorTheme.c_9e9e9f),
                    onTap: () {
                      Navigator.of(context).pop();
                      if (widget.onCancel != null) {
                        widget.onCancel!.call();
                      }
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: ButtonStyle1(
                    text: widget.btnConfirmText ?? 'yes'.tr(),
                    radius: 0.0,
                    btnColor: widget.btnConfirmColor ?? const Color(ColorTheme.c_ffffff),
                    textColor: widget.btnConfirmTextColor ?? const Color(ColorTheme.c_bb2649),
                    onTap: () {
                      Navigator.of(context).pop(true);
                      if (widget.onConfirm != null) {
                        widget.onConfirm?.call();
                      }
                    },
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget noImgView() {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color(ColorTheme.c_ededed),
        // borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(
          image: AssetImage(
            'images/noimg_bw.png',
          ),
        ),
      ),
    );
  }
}
