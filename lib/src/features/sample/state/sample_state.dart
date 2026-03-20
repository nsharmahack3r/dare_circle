class SampleState {
  final int counter;
  
  const SampleState({this.counter = 0});

  SampleState copyWith({int? counter}) {
    return SampleState(
      counter: counter ?? this.counter,
    );
  }
}
