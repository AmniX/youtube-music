class Lazy<T> {
  final Function _func;
  bool _isEvaluated = false;

  Lazy(this._func);

  T _value;

  bool isInitialized() => _value != null;

  T call() {
    if (!_isEvaluated) {
      if (_func != null) {
        _value = _func();
      }
      _isEvaluated = true;
    }
    return _value;
  }
}
