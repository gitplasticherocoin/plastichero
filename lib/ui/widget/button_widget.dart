import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:plastichero/constants/common.dart';
import 'package:plastichero/constants/setting.dart';

import '../../constants/color_theme.dart';


// TODO : ButtonStyle1
class ButtonStyle1 extends StatelessWidget {
  final bool isEnable;
  final bool isDisableTap;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Color btnColor;
  final Color disableColor;
  final Color? pressColor;
  final String? text;
  final double radius;
  final double fontSize;
  final Color textColor;
  final Alignment? alignment;

  const ButtonStyle1(
      {Key? key,
        this.isEnable = true,
        this.isDisableTap = false,
        this.onTap,
        this.margin,
        this.padding,
        this.width = double.infinity,
        this.height = Common.boxH,
        this.btnColor = const Color(ColorTheme.c_ffffff),
        this.disableColor = const Color(ColorTheme.c_ffffff),
        this.pressColor,
        this.text,
        this.radius = 5.0,
        this.fontSize = 14.0,
        this.textColor = const Color(ColorTheme.c_bb2649),
        this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isEnable) {
      return Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: btnColor,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            highlightColor: pressColor,
            hoverColor: pressColor,
            splashColor: pressColor,
            borderRadius: BorderRadius.circular(radius),
            child: Container(
              alignment: alignment ?? Alignment.center,
              width: double.infinity,
              height: double.infinity,
              child: Text(
                text ?? 'confirm'.tr(),
                style: TextStyle(
                  height: 1.2,
                  fontSize: fontSize,
                  fontFamily: Setting.appFont,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          if (isDisableTap && onTap != null) {
            onTap!.call();
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          margin: margin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: disableColor,
          ),
          child: Text(
            text ?? 'confirm'.tr(),
            style: TextStyle(
              height: 1.2,
              fontSize: fontSize,
              fontFamily: Setting.appFont,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }
  }
}




/// ButtonStyle3
class ButtonStyle3 extends StatefulWidget {
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Color btnColor;
  final Color pressColor;
  final String text;
  final double fontSize;

  const ButtonStyle3({
    Key? key,
    this.onTap,
    this.margin,
    this.width = double.infinity,
    this.height = Common.boxH,
    this.btnColor = const Color(ColorTheme.appColor),
    this.pressColor = Colors.white,
    required this.text,
    this.fontSize = 15.0,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ButtonStyle3State();
  }
}

class _ButtonStyle3State extends State<ButtonStyle3> {
  bool isOnPress = false;

  @override
  void initState() {
    super.initState();
  }

  void setOnPress(bool onPress, {bool onTap = false}) async {
    if (mounted) {
      if (isOnPress != onPress) {
        setState(() {
          isOnPress = onPress;
        });
      }
      if (onTap) {
        await Future.delayed(const Duration(milliseconds: 100)).whenComplete(() => setOnPress(false));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return GestureDetector(
      onTap: () {
        setOnPress(true, onTap: true);
        if (widget.onTap != null) {
          widget.onTap!.call();
        }
      },
      onTapDown: (details) {
        setOnPress(true);
      },
      onTapUp: (details) {
        setOnPress(false);
      },
      onTapCancel: () {
        setOnPress(false);
      },
      child: Container(
        alignment: Alignment.center,
        width: widget.width,
        height: widget.height,
        margin: widget.margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            width: 1.0,
            color: widget.btnColor,
          ),
          color: isOnPress ? widget.btnColor : widget.pressColor,
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            height: 1.2,
            fontSize: widget.fontSize,
            fontFamily: Setting.appFont,
            color: isOnPress ? Colors.white : widget.btnColor,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

/// update_03_03 outline button 용
class ButtonStyle4 extends StatelessWidget {
  final bool isEnable;
  final bool isDisableTap;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Color btnColor;
  final Color borderColor;
  final Color disableColor;
  final Color? pressColor;
  final String? text;
  final double radius;
  final double fontSize;
  final Color textColor;
  final Alignment? alignment;
  final Widget? prefixIcon;

  const ButtonStyle4(
      {Key? key,
        this.isEnable = true,
        this.isDisableTap = false,
        this.onTap,
        this.margin,
        this.padding,
        this.width = double.infinity,
        this.height = 54,
        this.btnColor = const Color(ColorTheme.c_ffffff),
        this.disableColor = const Color(ColorTheme.c_ffffff),
        this.pressColor,
        this.text,
        this.radius = 5.0,
        this.fontSize = 14.0,
        this.textColor = const Color(ColorTheme.c_bb2649),
        this.borderColor = const Color(ColorTheme.c_d6d6dc),
        this.alignment,
        this.prefixIcon = null,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isEnable) {
      return Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: btnColor,
            border: Border.all(
                width: 1,
                color: borderColor
            )
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            highlightColor: pressColor,
            hoverColor: pressColor,
            splashColor: pressColor,
            borderRadius: BorderRadius.circular(radius),
            child: Container(
              alignment: alignment ?? Alignment.center,
              width: double.infinity,
              height: double.infinity,
              child: Visibility(
                visible: prefixIcon == null,
                replacement: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if(prefixIcon != null)
                      prefixIcon!,
                    Text(
                      text ?? 'confirm'.tr(),
                      style: TextStyle(
                        height: 1.2,
                        fontSize: fontSize,
                        fontFamily: Setting.appFont,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                child: Text(
                  text ?? 'confirm'.tr(),
                  style: TextStyle(
                    height: 1.2,
                    fontSize: fontSize,
                    fontFamily: Setting.appFont,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          if (isDisableTap && onTap != null) {
            onTap!.call();
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          margin: margin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
                width: 1,
                color: borderColor
            ),
            color: disableColor,
          ),
          child: Visibility(
            visible: prefixIcon == null,
            replacement: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(prefixIcon != null)
                  prefixIcon!,
                Text(
                  text ?? 'confirm'.tr(),
                  style: TextStyle(
                    height: 1.2,
                    fontSize: fontSize,
                    fontFamily: Setting.appFont,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            child: Text(
              text ?? 'confirm'.tr(),
              style: TextStyle(
                height: 1.2,
                fontSize: fontSize,
                fontFamily: Setting.appFont,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    }
  }
}

/// FillButtonStyle
class FillButtonStyle extends StatefulWidget {
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Color btnColor;
  final Color btnPressColor;
  final Color btnDisabledColor;
  final String text;
  final double fontSize;
  final bool isEnable;
  final bool isDisableTap;
  final double radius;

  const FillButtonStyle({
    Key? key,
    this.onTap,
    this.margin,
    this.width = double.infinity,
    this.height = Common.buttonH,
    this.btnColor = const Color(ColorTheme.appColor),
    this.btnPressColor = const Color(ColorTheme.appColor),
    this.btnDisabledColor = const Color(ColorTheme.c_74737b),
    required this.text,
    this.fontSize = 13.0,
    this.isEnable = true,
    this.isDisableTap = false,
    this.radius = 0,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FillButtonStyleState();
  }
}

class _FillButtonStyleState extends State<FillButtonStyle> {
  bool isOnPress = false;

  @override
  void initState() {
    super.initState();
  }

  void setOnPress(bool onPress, {bool onTap = false}) async {
    if (mounted) {
      if (isOnPress != onPress) {
        setState(() {
          isOnPress = onPress;
        });
      }
      if (onTap) {
        await Future.delayed(const Duration(milliseconds: 100)).whenComplete(() => setOnPress(false));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if (widget.isEnable) {
      return GestureDetector(
        onTap: () {
          setOnPress(true, onTap: true);
          if (widget.onTap != null) {
            widget.onTap!.call();
          }
        },
        onTapDown: (details) {
          setOnPress(true);
        },
        onTapUp: (details) {
          setOnPress(false);
        },
        onTapCancel: () {
          setOnPress(false);
        },
        child: Container(
          alignment: Alignment.center,
          width: widget.width,
          height: widget.height,
          margin: widget.margin,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: isOnPress ? widget.btnPressColor : widget.btnColor,
            ),
            borderRadius: BorderRadius.circular(widget.radius),
            color: isOnPress ? widget.btnPressColor : widget.btnColor,
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              height: 1.2,
              fontSize: widget.fontSize,
              fontFamily: Setting.appFont,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          if (widget.isDisableTap && widget.onTap != null) {
            widget.onTap!.call();
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: widget.width,
          height: widget.height,
          margin: widget.margin,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: widget.btnDisabledColor,
            ),
            borderRadius: BorderRadius.circular(widget.radius),
            color: widget.btnDisabledColor,
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              height: 1.2,
              fontSize: widget.fontSize,
              fontFamily: Setting.appFont,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      );
    }
  }
}

/// BottomButtonStyle
class BottomButtonStyle extends StatefulWidget {
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Color btnColor;
  final Color btnPressColor;
  final Color btnDisabledColor;
  final String text;
  final double fontSize;
  final bool isEnable;
  final bool isDisableTap;
  final double radius;

  const BottomButtonStyle({
    Key? key,
    this.onTap,
    this.margin,
    this.width = double.infinity,
    this.height = Common.bottomButtonH,
    this.btnColor = const Color(ColorTheme.appColor),
    this.btnPressColor = const Color(ColorTheme.appColor),
    this.btnDisabledColor = const Color(ColorTheme.c_d6d6dc),
    required this.text,
    this.fontSize = 14.0,
    this.isEnable = true,
    this.isDisableTap = false,
    this.radius = 0,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomButtonStyleState();
  }
}

class _BottomButtonStyleState extends State<BottomButtonStyle> {
  bool isOnPress = false;

  @override
  void initState() {
    super.initState();
  }

  void setOnPress(bool onPress, {bool onTap = false}) async {
    if (mounted) {
      if (isOnPress != onPress) {
        setState(() {
          isOnPress = onPress;
        });
      }
      if (onTap) {
        await Future.delayed(const Duration(milliseconds: 100)).whenComplete(() => setOnPress(false));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if (widget.isEnable) {
      return GestureDetector(
        onTap: () {
          setOnPress(true, onTap: true);
          if (widget.onTap != null) {
            widget.onTap!.call();
          }
        },
        onTapDown: (details) {
          setOnPress(true);
        },
        onTapUp: (details) {
          setOnPress(false);
        },
        onTapCancel: () {
          setOnPress(false);
        },
        child: Container(
          alignment: Alignment.center,
          width: widget.width,
          height: widget.height,
          margin: widget.margin,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: isOnPress ? widget.btnPressColor : widget.btnColor,
            ),
            borderRadius: BorderRadius.circular(widget.radius),
            color: isOnPress ? widget.btnPressColor : widget.btnColor,
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              height: 1.2,
              fontSize: widget.fontSize,
              fontFamily: Setting.appFont,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          if (widget.isDisableTap && widget.onTap != null) {
            widget.onTap!.call();
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: widget.width,
          height: widget.height,
          margin: widget.margin,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: widget.btnDisabledColor,
            ),
            borderRadius: BorderRadius.circular(widget.radius),
            color: widget.btnDisabledColor,
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              height: 1.2,
              fontSize: widget.fontSize,
              fontFamily: Setting.appFont,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      );
    }
  }
}

/// Feed Button
class FeedButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String imgSrc;
  final String? imgSrcPress;
  final bool isOn;

  const FeedButton({
    Key? key,
    this.onTap,
    required this.imgSrc,
    this.imgSrcPress,
    this.isOn = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FeedButtonState();
  }
}

class FeedButtonState extends State<FeedButton> {
  bool isOnPress = false;

  @override
  void initState() {
    super.initState();
  }

  void setOnPress(bool onPress) {
    setState(() {
      isOnPress = onPress;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (details) {
        setOnPress(true);
      },
      onTapUp: (details) {
        setOnPress(false);
      },
      onTapCancel: () {
        setOnPress(false);
      },
      child: Image.asset(
        (widget.isOn || isOnPress) && widget.imgSrcPress != null ? widget.imgSrcPress! : widget.imgSrc,
      ),
    );
  }
}

class ImageButton extends StatefulWidget {
  final String img;
  final String? pressImg;
  final String? disableImg;
  final double? imgWidth;
  final double? imgHeight;
  final bool isEnable;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Color? color;

  const ImageButton({
    Key? key,
    required this.img,
    this.pressImg,
    this.disableImg,
    this.imgWidth,
    this.imgHeight,
    this.isEnable = true,
    this.onTap,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ImageButtonState();
  }
}

class _ImageButtonState extends State<ImageButton> {
  bool isOnPress = false;

  @override
  void initState() {
    super.initState();
  }

  void setOnPress(bool onPress, {bool onTap = false}) async {
    if (mounted) {
      if (isOnPress != onPress) {
        setState(() {
          this.isOnPress = onPress;
        });
      }
      if (onTap) {
        await Future.delayed(Duration(milliseconds: 100)).whenComplete(() => setOnPress(false));
      }
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    String imgPath = widget.pressImg ?? '';
    if (imgPath.isNotEmpty) {
      precacheImage(Image.asset(imgPath).image, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setOnPress(true, onTap: true);
        if (widget.isEnable && widget.onTap != null) {
          widget.onTap!.call();
        }
      },
      onTapDown: (details) {
        setOnPress(true);
      },
      onTapUp: (details) {
        setOnPress(false);
      },
      onTapCancel: () {
        setOnPress(false);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        alignment: Alignment.center,
        color: widget.color,
        width: widget.width,
        height: widget.height,
        margin: widget.margin,
        padding: widget.padding,
        child: Image.asset(
          getImage(),
          width: widget.imgWidth,
          height: widget.imgHeight,
        ),
      ),
    );
  }

  String getImage() {
    if (!widget.isEnable) {
      return widget.disableImg ?? widget.img;
    } else if (isOnPress) {
      return widget.pressImg ?? widget.img;
    } else {
      return widget.img;
    }
  }
}
