import 'package:bloc_concurrency/bloc_concurrency.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:equatable/equatable.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/region_entity.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/shrimp_price_filter_entity.dart';
import 'package:jala_test/modules/shrimp_price/domain/usecases/get_regions_usecase.dart';
import 'package:jala_test/modules/shrimp_price/domain/usecases/get_shrimp_prices_usecase.dart';
import 'package:jala_test/modules/shrimp_price/domain/entities/shrimp_price_entity.dart';
import 'package:jala_test/shared/utils/logger.dart';
import 'package:stream_transform/stream_transform.dart';

part "shrimp_price_state.dart";
part "shrimp_price_event.dart";

class ShrimpPriceBloc extends Bloc<ShrimpPriceEvent, ShrimpPriceState> {
  final GetShrimpPricesUseCase _getShrimpPricesUseCase;
  final GetRegionsUseCase _getRegionsUseCase;

  ShrimpPriceBloc({
    required GetShrimpPricesUseCase getShrimpPricesUseCase,
    required GetRegionsUseCase getRegionsUseCase,
  })  : _getShrimpPricesUseCase = getShrimpPricesUseCase,
        _getRegionsUseCase = getRegionsUseCase,
        super(const ShrimpPriceState()) {
    on<FetchShrimpPrice>(_handleFetchShrimpPrice);
    on<ShrimpSizeChange>(_handleChangeShrimpSize);
    on<FetchRegions>(
      _handleFetchRegions,
      transformer: (events, mapper) {
        return droppable<FetchRegions>().call(
          events.throttle(
            const Duration(milliseconds: 250),
          ),
          mapper,
        );
      },
    );
    on<ChangeRegionKeyword>(
      _handleChangeRegionKeyword,
      transformer: (events, mapper) {
        return events
            .debounce(const Duration(milliseconds: 500))
            .switchMap(mapper);
      },
    );
    on<ChangeFilterRegion>(_handleChangeRegion);
  }
  void _handleChangeRegion(
      ChangeFilterRegion event, Emitter<ShrimpPriceState> emit) {
    emit(
      state.copyWith(
        filter: state.filter.copyWith(
          region: event.region,
        ),
      ),
    );
    add(
      FetchShrimpPrice(
        filter: state.filter.copyWith(
          region: event.region,
        ),
      ),
    );
  }

  void _handleChangeRegionKeyword(
    ChangeRegionKeyword event,
    Emitter<ShrimpPriceState> emit,
  ) {
    emit(
      state.copyWith(
        regions: const PaginatedRegionEntity(
          currentPage: 0,
          lastPage: 0,
          perPage: 0,
          total: 0,
          data: [],
        ),
      ),
    );
    add(
      FetchRegions(keyword: event.keyword),
    );
  }

  Future<void> _handleFetchRegions(
    FetchRegions event,
    Emitter<ShrimpPriceState> emit,
  ) async {
    emit(
      state.copyWith(
        fetchRegionsStatus: FetchRegionsStatus.loading,
      ),
    );
    final result = await _getRegionsUseCase.invoke(
      GetRegionsUseCaseParams(
        page: state.regions.currentPage + 1,
        keyword: event.keyword,
      ),
    );
    result.when(
      onSuccess: (regions) {
        emit(
          state.copyWith(
            fetchRegionsStatus: FetchRegionsStatus.success,
            regions: state.regions.copyWith(
              currentPage: regions.data.currentPage,
              lastPage: regions.data.lastPage,
              perPage: regions.data.perPage,
              total: regions.data.total,
              data: List.of(state.regionList)..addAll(regions.data.data),
            ),
          ),
        );
        logger.d("Regions: ${regions.data.currentPage}");
      },
      onFailure: (e) {
        emit(
          state.copyWith(
            fetchRegionsStatus: FetchRegionsStatus.failure,
          ),
        );
      },
    );
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

  Future<void> _handleFetchShrimpPrice(
      FetchShrimpPrice event, Emitter<ShrimpPriceState> emit) async {
    emit(
      state.copyWith(
        fetchShrimpPriceStatus: FetchShrimpPriceStatus.loading,
      ),
    );

    final result = await _getShrimpPricesUseCase.invoke(
      GetShrimpPricesUseCaseParams(
        event.filter.region.id,
      ),
    );
    result.when(
      onSuccess: (shrimpPrices) {
        emit(
          state.copyWith(
            fetchShrimpPriceStatus: FetchShrimpPriceStatus.success,
            shrimpPrice: shrimpPrices.data,
          ),
        );
      },
      onFailure: (e) {
        emit(
          state.copyWith(
            fetchShrimpPriceStatus: FetchShrimpPriceStatus.failure,
          ),
        );
      },
    );
  }
}
