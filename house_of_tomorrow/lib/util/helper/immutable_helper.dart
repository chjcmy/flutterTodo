extension ImmutableHelper<T> on Iterable<T> {
  List<T> toImmutable() => List.unmodifiable(this);
}
