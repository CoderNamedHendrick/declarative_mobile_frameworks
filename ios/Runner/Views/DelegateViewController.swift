//
//  DelegateViewController.swift
//  Runner
//
//  Created by Sebastine Odeh on 11/09/2023.
//

import Foundation
import Flutter

class DelegateViewController : UINavigationController, DelegateProtocol {
    var result: FlutterResult?
    
    func popViewController(string: String) {
        result?("Message from iOS: \(string)")
    }
}
