import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jala_test/modules/shrimp_news/presentation/bloc/shrimp_news_bloc.dart';
import 'package:jala_test/modules/shrimp_news/presentation/widgets/news_list_item.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    context.read<ShrimpNewsBloc>().add(GetShrimpNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ShrimpNewsBloc, ShrimpNewsState>(
      builder: (context, state) {
        if (state.fetchShrimpNewsStatus.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.news.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final news = state.news[index];
            return NewsListItem(news: news);
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
