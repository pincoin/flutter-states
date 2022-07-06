import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial(0)) {
    on<CounterIncrementPressed>(
      (event, emit) => emit(CounterChange(state.count + 1)),
    );
    on<CounterDecrementPressed>(
      (event, emit) => emit(CounterChange(state.count - 1)),
    );
  }
}
