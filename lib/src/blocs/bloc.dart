import 'package:rxdart/rxdart.dart';
import '../models/translation_model.dart';
import '../resources/repository.dart';

class Bloc {
  // Instantiate Repository
  final Repository _repository = Repository();

  // Set up stream for translation text
  final BehaviorSubject<String> _userInput = BehaviorSubject<String>();

  // Set up stream getters
  Observable<String> get userInput => _userInput.stream;
  Function(String) get userInputSink => _userInput.sink.add;


  void translate() async {
    final String input = _userInput.value;
    final TranslationModel translation = await _repository.callAPI(input);
  }

  dispose() {
    _userInput.close();
  }
}
