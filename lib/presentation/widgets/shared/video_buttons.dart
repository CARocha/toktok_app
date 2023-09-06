import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tokto_app/config/helpers/human_formats.dart';
import 'package:tokto_app/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  const VideoButtons({super.key, required this.video});

  final VideoPost video;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(value: video.likes, iconData: Icons.favorite, iconColor: Colors.red),
        const SizedBox(height: 16,),
        _CustomIconButton(value: video.likes, iconData: Icons.remove_red_eye_outlined),
        const SizedBox(height: 16,),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomIconButton(value: 0, iconData: Icons.play_circle_filled_sharp))
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  const _CustomIconButton({
    required this.value, 
    required this.iconData, 
    iconColor
    }): color = iconColor ?? Colors.white;

  final int value;
  final IconData iconData;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         IconButton(onPressed: (){}, icon: Icon(iconData, color: color, size: 30,)),
         if (value > 0)
          Text(HumanFormat.humanReadbleNumber(value.toDouble()))
      ],
    );
  }
}