//
//  DelegateViewController.swift
//  Runner
//
//  Created by Sebastine Odeh on 18/09/2023.
//
import Foundation
import Flutter

class DelegateViewController : UINavigationController, DelegateProtocol {
    var result : FlutterResult?
    
    func popViewController(string: String) {
        result?(.success(string))
    }
}
