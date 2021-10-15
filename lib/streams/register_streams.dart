
import 'dart:async';

class RegisterStreams extends Object{
  final _isLoadingController = StreamController<bool>();

  StreamSink<bool> get isLoadingToggle => _isLoadingController.sink;

  Stream<bool> get isLoading => _isLoadingController.stream;
  
  void dispose() {
    _isLoadingController.close();
  }
}
