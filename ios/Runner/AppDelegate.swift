import UIKit
import SwiftUI
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
      GeneratedPluginRegistrant.register(with: self)
      
      let navigationController = DelegateViewController(rootViewController: controller)
     
      
      navigationController.isNavigationBarHidden = true
      window?.rootViewController = navigationController
      window?.makeKeyAndVisible()
      
      let mlkitChannel = FlutterMethodChannel(name: "com.hendrick.navigateChannel", binaryMessenger: controller.binaryMessenger)
      mlkitChannel.setMethodCallHandler({(call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          navigationController.result = result
          if  call.method == "navigateFunction" {
              let swiftUIViewController = UIHostingController(rootView: SwiftUIView(navigationController: navigationController, delegate: navigationController))
              
              navigationController.pushViewController(swiftUIViewController, animated: true)
          }
      })
      
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
