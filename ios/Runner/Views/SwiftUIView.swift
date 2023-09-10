//
//  SwiftUIView.swift
//  Runner
//
//  Created by Sebastine Odeh on 10/09/2023.
//

import SwiftUI

struct SwiftUIView: View {
    
    weak var navigationController: UINavigationController?
    weak var delegate: DelegateProtocol?
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Hello, World! from the SwiftUI side")
            Spacer().frame(height: 20)
            
            Button(action: {
                let message: String = "Message from the swiftUI side";
//                navigationController?.popButtonTapped(message: message)
                delegate?.popViewController(string: message)
                navigationController?.popViewController(animated: true)
            }) {
                Text("Click me to send message to the flutter side")
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
