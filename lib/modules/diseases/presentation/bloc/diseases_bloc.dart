import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jala_test/modules/diseases/domain/entity/disease_entity.dart';
import 'package:jala_test/modules/diseases/domain/usecases/get_disease_list_usecase.dart';

part 'diseases_event.dart';
part 'diseases_state.dart';

class DiseasesBloc extends Bloc<DiseasesEvent, DiseasesState> {
  final GetDiseaseListUseCase _getDiseaseListUseCase;

  DiseasesBloc({
    required GetDiseaseListUseCase getDiseaseListUseCase,
  })  : _getDiseaseListUseCase = getDiseaseListUseCase,
        super(const DiseasesState()) {
    on<GetDiseaseListEvent>(_handleFetchShrimpNews);
  }

  Future<void> _handleFetchShrimpNews(
    DiseasesEvent event,
    Emitter<DiseasesState> emit,
  ) async {
    emit(
      state.copyWith(
        status: FetchDiseaseListStatus.loading,
      ),
    );

    final result = await _getDiseaseListUseCase.invoke(null);
    result.when(
      onSuccess: (shrimpNews) {
        emit(
          state.copyWith(
            status: FetchDiseaseListStatus.success,
            diseases: shrimpNews.data,
          ),
        );
      },
      onFailure: (e) {
        emit(
          state.copyWith(
            status: FetchDiseaseListStatus.failure,
          ),
        );
      },
    );
  }
}
