class ErrorGettingMatchesList implements Exception {
  ErrorGettingMatchesList(String error);
}

class ErrorGettingImage implements Exception {
  ErrorGettingImage(String error);
}

class DataIsEmpty implements Exception {}

class ErrorEmptyResponse implements Exception {}