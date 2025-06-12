import UIKit
import SwiftUI
import Flutter

typealias FlutterResult = (Result<String, Error>) -> Void

@main
@objc class AppDelegate: FlutterAppDelegate, NativeMobileHostApi {
    private var navigationController: DelegateViewController? = nil
    
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        GeneratedPluginRegistrant.register(with: self)
        
        navigationController = DelegateViewController(rootViewController: controller)
        
        navigationController?.isNavigationBarHidden = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        NativeMobileHostApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: self)
        return super.application(application, didFinishLaunchingWithOptions:launchOptions)
    }
    
    func getNativeUiResult(completion: @escaping (Result<String, Error>) -> Void) {
        navigationController?.result = completion
        let swiftUiViewController = UIHostingController(rootView: SwiftUIView(navigationController: self.navigationController, delegate: self.navigationController))
        
        navigationController?.pushViewController(swiftUiViewController, animated: true)
    }
}
