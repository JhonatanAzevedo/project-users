
import 'dependency_manager/dependency_manager.dart';
import 'infrastructure/infrastructure.dart';


///
/// Provides a static access to a singleton that implements [DependencyManager]
///
final DependencyManager DM = ModularDependencyManager.i();
