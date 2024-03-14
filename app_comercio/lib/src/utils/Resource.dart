abstract class Resource<T> {}

class Initial extends Resource {}

class Loading extends Resource {}

class Succes<T> extends Resource {
  final T data;
  Succes(this.data);
}

class Error<T> extends Resource {
  final String message;
  Error(this.message);
}
