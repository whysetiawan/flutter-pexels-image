final class ShrimpPriceLocalDataSource {
  Iterable<int> getShrimpSize(int max) sync* {
    int i = 20;
    while (i <= max) {
      yield i;
      i = i + 10;
    }
  }
}
