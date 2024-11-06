import 'firebase_options_prod.dart';
import 'flavor_config.dart';
import 'run_app.dart';

void main() {
  final flavorConfig = FlavorConfig(
    flavor: AppFlavor.prod,
    bundleId: 'com.mindsystemsolutions.boardbitpublic',
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
  );
  runBoardBitApp(flavorConfig);
}
