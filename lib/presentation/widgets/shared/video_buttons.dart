import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tok_tik/config/helpers/human_formats.dart';
import 'package:tok_tik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _CustomIconButtom(
          iconData: Icons.favorite,
          onAction: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Pop Message'),
                  content: const Text('This is a pop message FOR WHITE'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          value: video.likes,
          iconColor: Colors.red,
        ),
        const SizedBox(height: 20),
        _CustomIconButtom(
          iconData: Icons.remove_red_eye_outlined,
          onAction: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Pop Message'),
                  content: const Text('This is a pop message FOR BLUE'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          value: video.views,
        ),
        const SizedBox(height: 20),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: _CustomIconButtom(
            onAction: () {},
            iconData: Icons.play_circle_outline,
            value: 0,
          ),
        ),
      ],
    );
  }
}

class _CustomIconButtom extends StatelessWidget {
  final int value;
  final IconData iconData;
  final dynamic onAction;
  final Color? color;

  const _CustomIconButtom(
      {required this.iconData,
      required this.onAction,
      required this.value,
      iconColor})
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onAction,
          icon: Icon(iconData, color: color, size: 30),
        ),
        if (value > 0)
        Text(HumanFormats.humanReadbleNumber( value.toDouble()))
      ],
    );
  }
}
