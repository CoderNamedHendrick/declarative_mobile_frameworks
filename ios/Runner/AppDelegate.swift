import UIKit
import SwiftUI
import Flutter

typealias FlutterResult = (Result<String, Error>) -> Void

@main
@objc class AppDelegate: FlutterAppDelegate {
    private var api: NativeMobileFlutterApi? = nil
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        guard let pluginRegistrar = self.registrar(forPlugin: "plugin-name") else { return false }
        api = NativeMobileFlutterApi(binaryMessenger: pluginRegistrar.messenger())
        let factory = FLNativeViewFactory() { message in
            self.api?.onSumResult(result: message, completion: {result in })
        }
        
        pluginRegistrar.register(factory, withId: "calculator-platform-view")
        return super.application(application, didFinishLaunchingWithOptions:launchOptions)
    }
}
