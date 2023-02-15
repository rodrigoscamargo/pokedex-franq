import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MediaContainer extends StatelessWidget {
  final String? media;
  final BoxFit? fit;

  const MediaContainer({
    Key? key,
    required this.media,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (media == null) return Container();
    return _buildImageContainer();
  }

  Widget _buildImageContainer() {
    if (isSVG(media!)) {
      return Padding(
        padding: const EdgeInsets.all(0),
        child: SvgPicture.network(
          media!,
          fit: fit ?? BoxFit.contain,
        ),
      );
    }
    return CachedNetworkImage(
      imageUrl: media!,
      fit: fit,
      errorWidget: (context, _, __) => Container(),
    );
  }

  bool isSVG(String string) => string.endsWith('.svg');
}
