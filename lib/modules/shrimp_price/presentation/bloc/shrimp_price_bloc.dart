import "package:flutter_bloc/flutter_bloc.dart";
import 'package:equatable/equatable.dart';
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
    on<ShrimpPriceFetched>(_fetchShrimpPrices);
  }

  Future<void> _fetchShrimpPrices(
      ShrimpPriceFetched event, Emitter<ShrimpPriceState> emit) async {
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
            shrimpPrices: shrimpPrices,
          ),
        );
      },
      onFailure: (e) {
        print(
          "ERROr ${e.toString()}",
        );
        emit(
          state.copyWith(
            status: ShrimpPriceStatus.failure,
          ),
        );
      },
    );
  }
}
