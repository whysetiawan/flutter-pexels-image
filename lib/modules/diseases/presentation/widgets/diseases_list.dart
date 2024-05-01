import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jala_test/modules/diseases/presentation/bloc/diseases_bloc.dart';
import 'package:jala_test/modules/diseases/presentation/widgets/diseases_list_item.dart';

class DiseaseList extends StatefulWidget {
  const DiseaseList({super.key});

  @override
  State<DiseaseList> createState() => _DiseaseListState();
}

class _DiseaseListState extends State<DiseaseList>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    context.read<DiseasesBloc>().add(GetDiseaseListEvent());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<DiseasesBloc, DiseasesState>(
      builder: (context, state) {
        if (state.fetchDiseaseListStatus.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.diseases.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final news = state.diseases[index];
            return DiseaseListItem(news: news);
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
