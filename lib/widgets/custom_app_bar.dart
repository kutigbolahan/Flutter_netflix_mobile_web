import 'package:flutter/material.dart';
import 'package:netflix_mobile_web/widgets/widgets.dart';

import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOfsset;

  const CustomAppBar({Key key, this.scrollOfsset = 0.0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
        color: Colors.black
            .withOpacity((scrollOfsset / 350).clamp(0, 1).toDouble()),
        child: Responsive(
            mobile: _CustomAppBarMobile(), desktop: _CustomAppBarDesktop()));
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(
            Assets.netflixLogo0,
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                    title: 'Tv Shows', onTap: () => print('Tv shows')),
                _AppBarButton(title: 'Movies', onTap: () => print('Tv shows')),
                _AppBarButton(title: 'My List', onTap: () => print('Tv shows'))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(
            Assets.netflixLogo1,
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(title: 'Home', onTap: () => print('Tv shows')),
                _AppBarButton(title: 'Movies', onTap: () => print('Tv shows')),
                _AppBarButton(
                    title: 'Tv Shows', onTap: () => print('Tv shows')),
                _AppBarButton(title: 'Latest', onTap: () => print('Tv shows')),
                _AppBarButton(title: 'My List', onTap: () => print('Tv shows'))
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 28,
                  color: Colors.white,
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                _AppBarButton(title: 'KIDS', onTap: () => print('Tv shows')),
                _AppBarButton(title: 'DVD', onTap: () => print('Tv shows')),
                IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 28,
                  color: Colors.white,
                  icon: Icon(Icons.card_giftcard),
                  onPressed: () {},
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 28,
                  color: Colors.white,
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const _AppBarButton({
    Key key,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600),
      ),
    );
  }
}
