import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jala_test/modules/shrimp_news/domain/entity/news_entity.dart';
import 'package:jala_test/modules/shrimp_news/domain/usecases/get_shrimp_news_usecase.dart';

part 'shrimp_news_event.dart';
part 'shrimp_news_state.dart';

class ShrimpNewsBloc extends Bloc<ShrimpNewsEvent, ShrimpNewsState> {
  final GetShrimpNewsUseCase _getShrimpNewsUseCase;

  ShrimpNewsBloc({
    required GetShrimpNewsUseCase getShrimpNewsUseCase,
  })  : _getShrimpNewsUseCase = getShrimpNewsUseCase,
        super(const ShrimpNewsState()) {
    on<GetShrimpNewsEvent>(_handleFetchShrimpNews);
  }

  Future<void> _handleFetchShrimpNews(
    ShrimpNewsEvent event,
    Emitter<ShrimpNewsState> emit,
  ) async {
    emit(
      state.copyWith(
        status: FetchShrimpNewsStatus.loading,
      ),
    );

    final result = await _getShrimpNewsUseCase.invoke(null);
    result.when(
      onSuccess: (shrimpNews) {
        emit(
          state.copyWith(
            status: FetchShrimpNewsStatus.success,
            news: shrimpNews.data,
          ),
        );
      },
      onFailure: (e) {
        emit(
          state.copyWith(
            status: FetchShrimpNewsStatus.failure,
          ),
        );
      },
    );
  }
}
