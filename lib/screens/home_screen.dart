import 'package:flutter/material.dart';
import 'package:netflix_mobile_web/cubits/app_bar/app_bar_cubit.dart';
import 'package:netflix_mobile_web/data/data.dart';
import 'package:netflix_mobile_web/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        context.bloc<AppBarCubit>().setOffset(_scrollController.offset);
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          child: BlocBuilder<AppBarCubit, double>(
            builder: (context, scrolloffset) {
              return CustomAppBar(
                scrollOfsset: scrolloffset,
              );
            },
          ),
          preferredSize: Size(screenSize.width, 50.0)),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
              child: ContentHeader(featuredContent: sintelContent)),
          SliverPadding(
              sliver: SliverToBoxAdapter(
                child: Previews(
                    key: PageStorageKey('Previews'),
                    title: 'Previews',
                    contentList: previews),
              ),
              padding: EdgeInsets.only(top: 20.0)),
          SliverToBoxAdapter(
            child: ContentList(
                key: PageStorageKey('My List'),
                title: 'My List',
                contentList: myList),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('Netflix Originals'),
              title: 'Netflix Originals',
              contentList: originals,
              isOriginals: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 20),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                  key: PageStorageKey('Trending'),
                  title: 'Trending',
                  contentList: trending),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[850],
          child: const Icon(Icons.cast),
          onPressed: () {}),
    );
  }
}
