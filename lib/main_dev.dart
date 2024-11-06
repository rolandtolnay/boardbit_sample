import 'firebase_options_dev.dart';
import 'flavor_config.dart';
import 'run_app.dart';

void main() {
  final flavorConfig = FlavorConfig(
    flavor: AppFlavor.dev,
    bundleId: 'com.mindsystemsolutions.boardbitpublic',
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
  );
  runBoardBitApp(flavorConfig);
}
