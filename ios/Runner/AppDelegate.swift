import UIKit
import SwiftUI
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    private let channelName =  "com.hendrick.navigateChannel"
    private let navigateFunctionName = "flutterNavigate"
    
    
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
      
      let methodChannel = FlutterMethodChannel(name: channelName, binaryMessenger: controller.binaryMessenger)
      
      methodChannel.setMethodCallHandler({(call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          navigationController.result = result
          
          if call.method == self.navigateFunctionName {
              let swiftUIViewController = UIHostingController(rootView: SwiftUIView(navigationController: navigationController, delegate: navigationController))
              
              navigationController.pushViewController(swiftUIViewController, animated: true)
          }
      })
      
      return super.application(application, didFinishLaunchingWithOptions:launchOptions)
  }
}
