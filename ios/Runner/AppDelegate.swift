import UIKit
import Flutter
import FirebaseCore
import KakaoSDKCommon

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    KakaoSDK.initSDK(appKey: "kakaod7eaa723a1b0bbd17635330c5c561a5e")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
