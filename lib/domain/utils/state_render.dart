abstract class StateRender<T> {
  StateRender();
}

class Init extends StateRender {
  Init();
}

class Loading extends StateRender {
  Loading();
}

class Success<T> extends StateRender<T> {
  final T data;

  Success(this.data);
}

class Error<T> extends StateRender<T> {
  final String error;

  Error(this.error);
}