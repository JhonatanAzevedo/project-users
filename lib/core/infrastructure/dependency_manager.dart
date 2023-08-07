import 'dart:async';

///
/// Utility class to manage dependencies
///
abstract class DependencyManager {
  ///
  /// Get an instance of type T from the DM
  ///
  T get<T extends Object>();

  ///
  /// Get an instance of type T from the DM
  ///
  FutureOr<T> getAsync<T extends Object>();

  /// Disposes an object of type T from the DM
  bool dispose<T extends Object>();
}
