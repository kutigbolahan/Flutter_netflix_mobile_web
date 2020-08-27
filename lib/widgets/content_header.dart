import 'package:flutter/material.dart';
import 'package:netflix_mobile_web/models/models.dart';
import 'package:video_player/video_player.dart';

import 'widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({Key key, this.featuredContent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: _ContentHeaderMobile(featuredContent: featuredContent),
        desktop: _ContentHeaderDesktop(featuredContent: featuredContent));
  }
}

class _ContentHeaderMobile extends StatelessWidget {
  final Content featuredContent;

  const _ContentHeaderMobile({Key key, this.featuredContent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(featuredContent.imageUrl),
                  fit: BoxFit.cover)),
        ),
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black, Colors.transparent])),
        ),
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 250,
            child: Image.asset(featuredContent.titleImageUrl),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconButton(
                    icon: Icons.add,
                    title: 'List',
                    onTap: () => print('My List')),
                _PlayButton(),
                VerticalIconButton(
                    icon: Icons.info_outline,
                    title: 'info',
                    onTap: () => print('My info'))
              ],
            ))
      ],
    );
  }
}

class _ContentHeaderDesktop extends StatefulWidget {
  final Content featuredContent;

  const _ContentHeaderDesktop({Key key, this.featuredContent})
      : super(key: key);

  @override
  __ContentHeaderDesktopState createState() => __ContentHeaderDesktopState();
}

class __ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  VideoPlayerController _videoPlayerController;
  bool _isMuted = true;
  @override
  void initState() {
    _videoPlayerController =
            VideoPlayerController.network(widget.featuredContent.videoUrl)
              ..initialize().then((value) => setState(() {}))
        //..play()
        ;
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoPlayerController.value.isPlaying
          ? _videoPlayerController.pause()
          : _videoPlayerController.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            height: 500.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.featuredContent.imageUrl),
                    fit: BoxFit.cover)),
          ),
          Container(
            height: 500.0,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.transparent])),
          ),
          Positioned(
            bottom: 110,
            child: SizedBox(
              width: 250,
              child: Image.asset(widget.featuredContent.titleImageUrl),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  VerticalIconButton(
                      icon: Icons.add,
                      title: 'List',
                      onTap: () => print('My List')),
                  _PlayButton(),
                  VerticalIconButton(
                      icon: Icons.info_outline,
                      title: 'info',
                      onTap: () => print('My info'))
                ],
              ))
        ],
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0),
      onPressed: () => print('play'),
      color: Colors.white,
      icon: const Icon(
        Icons.play_arrow,
        size: 30,
      ),
      label: const Text(
        'data',
        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
      ),
    );
  }
}
