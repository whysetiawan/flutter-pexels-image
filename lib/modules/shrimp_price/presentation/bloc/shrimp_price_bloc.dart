import "package:flutter_bloc/flutter_bloc.dart";
import 'package:equatable/equatable.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/shrimp_price_filter_entity.dart';
import 'package:jala_test/modules/shrimp_price/domain/usecases/get_shrimp_prices_usecase.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/shrimp_price_entity.dart';

part "shrimp_price_state.dart";
part "shrimp_price_event.dart";

class ShrimpPriceBloc extends Bloc<ShrimpPriceEvent, ShrimpPriceState> {
  final GetShrimpPricesUseCase _getShrimpPricesUseCase;

  ShrimpPriceBloc({
    required GetShrimpPricesUseCase getShrimpPricesUseCase,
  })  : _getShrimpPricesUseCase = getShrimpPricesUseCase,
        super(const ShrimpPriceState()) {
    on<FetchShrimpPrice>(_handleFetchShrimpPrice);
    on<ShrimpSizeChange>(_handleChangeShrimpSize);
  }

  void _handleChangeShrimpSize(
    ShrimpSizeChange event,
    Emitter<ShrimpPriceState> emit,
  ) {
    return emit(
      state.copyWith(
        filter: state.filter.copyWith(
          size: event.size,
        ),
      ),
    );
  }

  List<ShrimpPriceItem> get shrimpPrices =>
      state.shrimpPrice.getShrimpPricesBySize(state.filter.size);

  Future<void> _handleFetchShrimpPrice(
      FetchShrimpPrice event, Emitter<ShrimpPriceState> emit) async {
    emit(
      state.copyWith(
        status: ShrimpPriceStatus.loading,
      ),
    );

    final result = await _getShrimpPricesUseCase.invoke(null);
    result.when(
      onSuccess: (shrimpPrices) {
        emit(
          state.copyWith(
            status: ShrimpPriceStatus.success,
            shrimpPrice: shrimpPrices.data,
          ),
        );
      },
      onFailure: (e) {
        emit(
          state.copyWith(
            status: ShrimpPriceStatus.failure,
          ),
        );
      },
    );
  }
}
